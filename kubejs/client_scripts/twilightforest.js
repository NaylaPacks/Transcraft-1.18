// priority: 0

onEvent('jei.hide.items', event => {
    event.hide('twilightforest:uncrafting_table')
})


onEvent('jei.remove.categories', event => {
    event.remove('twilightforest:uncrafting')
})