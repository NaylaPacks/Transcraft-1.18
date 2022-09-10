// priority: 0

onEvent('jei.hide.items', event => {
	event.hide('ae2:facade')
})

onEvent('jei.add.items', event => {
    event.add(Item.of('ae2:facade', '{item:"minecraft:stone"}'))
})