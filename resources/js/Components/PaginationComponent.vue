<script setup>
defineProps({
    currentPage: Number,
    lastPage: Number,
    onPageChange: Function,  // Função para ser chamada quando a página mudar
});
</script>

<template>
    <div class="mt-4 flex justify-center">
        <!-- Botão Anterior -->
        <button 
            :disabled="currentPage <= 1" 
            @click="onPageChange(currentPage - 1)"
            class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded mr-2"
        >
            Anterior
        </button>

        <!-- Botão Próximo -->
        <button 
            :disabled="currentPage >= lastPage" 
            @click="onPageChange(currentPage + 1)"
            class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded"
        >
            Próximo
        </button>
    </div>
</template>
