<script setup>
defineProps({
    columns: Array,   // Definir as colunas da tabela como uma array de objetos
    data: Array,      // Dados a serem renderizados na tabela
    actions: Array,   // Ações possíveis na tabela (ex: editar, excluir)
});

const executeAction = (action, row) => {
    action.method(row);
};
</script>

<template>
    <div class="overflow-x-auto">
        <table class="min-w-full table-auto border-collapse">
            <thead>
                <tr>
                    <th v-for="column in columns" :key="column.key" class="px-4 py-2 text-left">
                        {{ column.label }}
                    </th>
                    <th v-if="actions.length" class="px-4 py-2">Ações</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="row in data" :key="row.id">
                    <td v-for="column in columns" :key="column.key" class="border px-4 py-2">
                        {{ row[column.key] }}
                    </td>
                    <td v-if="actions.length" class="border px-4 py-2">
                        <button 
                            v-for="action in actions" 
                            :key="action.name" 
                            @click="executeAction(action, row)"
                            :class="action.class">
                            {{ action.label }}
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
