<template>
  <AppLayout title="Gerenciador de véiculos">
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
        Gerenciador de véiculos
      </h2>
    </template>

    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg p-6">
          <v-toolbar flat>
            <v-toolbar-title>Gerenciar Veículos</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn color="primary" dark @click="dialog = true">Novo Veículo</v-btn>
          </v-toolbar>

          <v-data-table-server v-model:items-per-page="pagination.itemsPerPage" :headers="headers" :items="vehicles"
            :items-length="pagination.totalItems" :loading="pagination.loading" :sort-by.sync="pagination.sortBy"
            @update:page="handlePageChange" @update:items-per-page="handleItemsPerPageChange"
            @update:sort-by="handleSortChange" class="elevation-1">
            <template v-slot:item.actions="{ item }">
              <v-icon class="me-1" size="small" @click="editItem(item)">mdi-pencil</v-icon>
              <v-icon size="small" @click="deleteItem(item)">mdi-delete</v-icon>
            </template>
          </v-data-table-server>

          <v-dialog v-model="dialog" max-width="500px">
            <v-card>
              <v-card-title>
                <span class="text-h5">{{ editedIndex === -1 ? 'Novo Veículo' : 'Editar Veículo' }}</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" md="6">
                      <v-text-field v-model="editedItem.brand" label="Marca"
                        :error-messages="errors.brand"></v-text-field>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-text-field v-model="editedItem.model" label="Modelo"
                        :error-messages="errors.model"></v-text-field>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-text-field v-model="editedItem.year" label="Ano" :error-messages="errors.year"></v-text-field>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-text-field v-model="editedItem.color" label="Cor"
                        :error-messages="errors.color"></v-text-field>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-text-field v-model="editedItem.weight" label="Peso (kg)"
                        :error-messages="errors.weight"></v-text-field>
                    </v-col>
                    <v-col cols="12" md="6">
                      <v-select v-model="editedItem.status" :items="statusOptions" item-title="text" item-value="value"
                        label="Status" :error-messages="errors.status"></v-select>
                    </v-col>
                    <v-col cols="12" md="12">
                      <v-select v-model="editedItem.category_id" :items="categories" item-title="name" item-value="id"
                        label="Categoria" :error-messages="errors.category_id"></v-select>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue-darken-1" text @click="close">Cancelar</v-btn>
                <v-btn color="blue-darken-1" text @click="save">Salvar</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>

          <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="text-h5">Confirma essa ação?</v-card-title>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue-darken-1" text @click="closeDelete">Cancelar</v-btn>
                <v-btn color="blue-darken-1" text @click="deleteItemConfirm">Deletar</v-btn>
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </div>
      </div>
    </div>

    <v-snackbar v-model="snackbar" :color="snackbarColor" timeout="3000">
      {{ snackbarMessage }}
    </v-snackbar>
  </AppLayout>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import AppLayout from '@/Layouts/AppLayout.vue';
import axios from 'axios';

const vehicles = ref([]);
const categories = ref([]);
const pagination = ref({
  currentPage: 1,
  itemsPerPage: 10,
  totalItems: 0,
  loading: true,
  sortBy: []
});
const dialog = ref(false);
const dialogDelete = ref(false);
const editedItem = ref({
  id: null,
  brand: '',
  model: '',
  year: '',
  color: '',
  category_id: null,
  weight: '',
  status: null
});
const defaultItem = { ...editedItem.value };
const editedIndex = ref(-1);

const snackbar = ref(false);
const snackbarMessage = ref('');
const snackbarColor = ref('success');

const statusOptions = [
  { text: 'Ativo', value: 1 },
  { text: 'Inativo', value: 2 }
];

const headers = [
  { title: 'ID', key: 'id', align: 'start' },
  { title: 'Marca', key: 'brand', align: 'start' },
  { title: 'Modelo', key: 'model', align: 'start' },
  { title: 'Ano', key: 'year', align: 'start' },
  { title: 'Cor', key: 'color', align: 'start' },
  { title: 'Peso', key: 'weight', align: 'start' },
  { title: 'Categoria', key: 'category.name', align: 'start' },
  { title: 'Ações', key: 'actions', align: 'center', sortable: false },
];

const errors = ref({
  brand: null,
  model: null,
  year: null,
  color: null,
  category_id: null,
  weight: null,
  status: null,
});

const validateFields = () => {
  let isValid = true;
  errors.value = {
    brand: null,
    model: null,
    year: null,
    color: null,
    category_id: null,
    weight: null,
    status: null,
  };

  if (!editedItem.value.brand) {
    errors.value.brand = 'Marca é obrigatória';
    isValid = false;
  }
  if (!editedItem.value.model) {
    errors.value.model = 'Modelo é obrigatório';
    isValid = false;
  }
  if (!editedItem.value.year || isNaN(editedItem.value.year) || editedItem.value.year < 1900 || editedItem.value.year > new Date().getFullYear()) {
    errors.value.year = 'Ano inválido';
    isValid = false;
  }
  if (!editedItem.value.color) {
    errors.value.color = 'Cor é obrigatória';
    isValid = false;
  }
  if (!editedItem.value.weight || isNaN(editedItem.value.weight)) {
    errors.value.weight = 'Peso inválido';
    isValid = false;
  }
  if (editedItem.value.status === null) {
    errors.value.status = 'Status é obrigatório';
    isValid = false;
  }
  if (!editedItem.value.category_id) {
    errors.value.category_id = 'Categoria é obrigatória';
    isValid = false;
  }

  return isValid;
};

const VehicleAPI = {
  async fetch({ page, itemsPerPage, sortBy }) {
    return new Promise(resolve => {
      axios.get(route('api.veiculo.index'), {
        params: {
          page: page,
          per_page: itemsPerPage,
          sortBy: sortBy
        },
      }).then(response => {
        resolve({
          items: response.data.data,
          total: response.data.total,
        });
      });
    });
  },
};

const loadItems = async ({ page, itemsPerPage, sortBy }) => {
  pagination.value.loading = true;
  const { items, total } = await VehicleAPI.fetch({ page, itemsPerPage, sortBy });
  vehicles.value = items;
  pagination.value.totalItems = total;
  pagination.value.loading = false;
};

const loadCategories = async () => {
  try {
    const response = await axios.get(route('api.categorias.index'));
    if (Array.isArray(response.data.data)) {
      categories.value = response.data.data.map(category => ({
        id: category.id,
        name: category.name
      }));
    } else {
      console.error('Formato inesperado de dados para categorias.');
    }
  } catch (error) {
    console.error('Erro ao carregar categorias:', error);
  }
};

onMounted(() => {
  loadCategories();
  loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
});

const handlePageChange = (page) => {
  pagination.value.currentPage = page;
  loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
};

const handleItemsPerPageChange = (itemsPerPage) => {
  pagination.value.itemsPerPage = itemsPerPage;
  pagination.value.currentPage = 1;
  loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
};

const handleSortChange = (sortBy) => {
  pagination.value.sortBy = sortBy;
  loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
};

const editItem = (item) => {
  editedIndex.value = vehicles.value.indexOf(item);
  editedItem.value = { ...item };
  dialog.value = true;
};

const deleteItem = (item) => {
  editedIndex.value = vehicles.value.indexOf(item);
  editedItem.value = { ...item };
  dialogDelete.value = true;
};

const deleteItemConfirm = async () => {
  try {
    await axios.delete(route('api.veiculo.destroy', editedItem.value.id));
    vehicles.value.splice(editedIndex.value, 1);
    closeDelete();
    showSnackbar('Veículo excluído com sucesso!', 'success');
    loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
  } catch (error) {
    showSnackbar('Erro ao excluir o veículo.', 'error');
    console.error('Erro ao deletar o veículo:', error);
  }
};

const save = async () => {
  if (!validateFields()) {
    showSnackbar('Por favor, corrija os erros no formulário.', 'error');
    return;
  }

  try {
    const payload = { ...editedItem.value };

    if (editedItem.value.id) {
      await axios.put(route('api.veiculo.update', editedItem.value.id), payload);
      showSnackbar('Veículo atualizado com sucesso!', 'success');
    } else {
      const response = await axios.post(route('api.veiculo.store'), payload);
      vehicles.value.push(response.data);
      showSnackbar('Veículo cadastrado com sucesso!', 'success');
    }
    close();
    loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
  } catch (error) {
    showSnackbar('Erro ao salvar o veículo.', 'error');
    console.error('Erro ao salvar o veículo:', error);
  }
};

const showSnackbar = (message, color) => {
  snackbarMessage.value = message;
  snackbarColor.value = color;
  snackbar.value = true;
};

const close = () => {
  dialog.value = false;
  editedItem.value = { ...defaultItem };
  editedIndex.value = -1;
};

const closeDelete = () => {
  dialogDelete.value = false;
  editedItem.value = { ...defaultItem };
  editedIndex.value = -1;
};
</script>
