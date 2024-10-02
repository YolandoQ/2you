<template>
    <AppLayout title="Gerenciador de categorias">
      <template #header>
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            Gerenciador de categorias
        </h2>
      </template>
  
      <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
          <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg p-6">
            <v-toolbar flat>
              <v-toolbar-title>Gerenciar Categorias</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-btn color="primary" dark @click="dialog = true">Nova Categoria</v-btn>
            </v-toolbar>
  
            <v-data-table-server v-model:items-per-page="pagination.itemsPerPage" :headers="headers" :items="categories"
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
                  <span class="text-h5">{{ editedIndex === -1 ? 'Nova Categoria' : 'Editar Categoria' }}</span>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" md="12">
                        <v-text-field v-model="editedItem.name" label="Nome da Categoria"
                          :error-messages="errors.name"></v-text-field>
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
    name: ''
  });
  const defaultItem = { ...editedItem.value };
  const editedIndex = ref(-1);
  
  const snackbar = ref(false);
  const snackbarMessage = ref('');
  const snackbarColor = ref('success');
  
  const headers = [
    { title: 'ID', key: 'id', align: 'start' },
    { title: 'Nome', key: 'name', align: 'start' },
    { title: 'Ações', key: 'actions', align: 'center', sortable: false },
  ];
  
  const errors = ref({
    name: null,
  });
  
  const validateFields = () => {
    let isValid = true;
    errors.value = {
      name: null,
    };
  
    if (!editedItem.value.name) {
      errors.value.name = 'Nome da Categoria é obrigatório';
      isValid = false;
    }
  
    return isValid;
  };
  
  const CategoryAPI = {
    async fetch({ page, itemsPerPage, sortBy }) {
      return new Promise(resolve => {
        axios.get(route('api.categorias.index'), {
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
    const { items, total } = await CategoryAPI.fetch({ page, itemsPerPage, sortBy });
    categories.value = items;
    pagination.value.totalItems = total;
    pagination.value.loading = false;
  };
  
  onMounted(() => {
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
    editedIndex.value = categories.value.indexOf(item);
    editedItem.value = { ...item };
    dialog.value = true;
  };
  
  const deleteItem = (item) => {
    editedIndex.value = categories.value.indexOf(item);
    editedItem.value = { ...item };
    dialogDelete.value = true;
  };
  
  const deleteItemConfirm = async () => {
    try {
      await axios.delete(route('api.categorias.destroy', editedItem.value.id));
      categories.value.splice(editedIndex.value, 1);
      closeDelete();
      showSnackbar('Categoria excluída com sucesso!', 'success');
      loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
    } catch (error) {
      showSnackbar('Erro ao excluir a categoria.', 'error');
      console.error('Erro ao deletar a categoria:', error);
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
        await axios.put(route('api.categorias.update', editedItem.value.id), payload);
        showSnackbar('Categoria atualizada com sucesso!', 'success');
      } else {
        const response = await axios.post(route('api.categorias.store'), payload);
        categories.value.push(response.data);
        showSnackbar('Categoria cadastrada com sucesso!', 'success');
      }
      close();
      loadItems({ page: pagination.value.currentPage, itemsPerPage: pagination.value.itemsPerPage, sortBy: pagination.value.sortBy });
    } catch (error) {
      showSnackbar('Erro ao salvar a categoria.', 'error');
      console.error('Erro ao salvar a categoria:', error);
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
  