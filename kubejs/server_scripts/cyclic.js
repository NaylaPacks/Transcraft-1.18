// priority: 0

settings.logAddedRecipes = true
settings.logRemovedRecipes = true
settings.logSkippedRecipes = false
settings.logErroringRecipes = true

onEvent('recipes', event => {
	event.remove({output: 'cyclic:uncrafter'})
	event.remove({output: 'cyclic:compressed_cobblestone'})
	event.remove({output: 'cyclic:prospector'})
	event.remove({output: 'cyclic:crusher'})
	event.remove({output: 'cyclic:dropper'})
	event.remove({output: 'cyclic:anvil_magma'})
	event.remove({output: 'cyclic:harvester'})
	event.remove({output: 'cyclic:computer_shape'})
	event.remove({output: 'cyclic:user'})
	event.remove({output: 'cyclic:solidifier'})
	event.remove({output: '4x cyclic:dice'})
	event.remove({output: 'cyclic:fan_slab'})
	event.remove({output: 'cyclic:rotator'})
	event.remove({output: 'cyclic:disenchanter'})
	event.remove({output: 'cyclic:battery'})
	event.remove({output: 'cyclic:battery_clay'})
	event.remove({output: 'cyclic:mattock'})
	event.remove({output: 'cyclic:mattock_nether'})
	event.remove({output: 'cyclic:mattock_stone'})

	event.shaped(Item.of('cyclic:prospector', '{Damage:0}'), [
		' GD',
		' CG',
		'C  '
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		G: 'minecraft:light_blue_stained_glass',
		D: 'minecraft:diamond'
	})

	event.shaped('cyclic:crusher', [
		'CNC',
		'SFS',
		'CNC'
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		N: '#forge:nuggets/copper',
		S: 'minecraft:stonecutter',
		F: '#forge:storage_blocks/flint'
	})

	event.shaped('cyclic:dropper', [
		'NCN',
		'CDC',
		'NIN'
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		N: '#forge:ingots/copper',
		D: 'minecraft:dropper',
		I: '#forge:storage_blocks/iron'
	})

	event.shaped('cyclic:anvil_magma', [
		'MMM',
		' C ',
		'OFO'
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		M: 'minecraft:magma_block',
		O: 'minecraft:obsidian',
		F: 'cyclic:fireball'
	})

	event.shaped('cyclic:harvester', [
		'EOE',
		'CBC',
		'NNN'
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		B: 'cyclic:biomass',
		E: 'minecraft:emerald',
		O: 'quark:obsidian_pressure_plate',
		N: '#forge:nuggets/copper'
	})

	event.shaped('cyclic:computer_shape', [
		'RCR',
		'IGI',
		'RCR'
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		R: 'minecraft:repeater',
		I: '#forge:storage_blocks/iron',
		G: '#chipped:green_concrete'
	})

	event.shaped('cyclic:user', [
		'GDG',
		'ICI',
		'FFF'
	  ], {
		G: '#forge:ingots/gold',
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		D: 'minecraft:dispenser',
		I: 'minecraft:tripwire_hook',
		F: '#forge:storage_blocks/flint'
	})

	event.shaped('cyclic:solidifier', [
		'LQL',
		'GCG',
		'OOO'
	  ], {
		L: '#forge:storage_blocks/lapis',
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		Q: 'minecraft:quartz',
		G: '#forge:glass/colorless',
		O: 'quark:obsidian_pressure_plate'
	})

	event.shaped('4x cyclic:dice', [
		'CNC',
		'N N',
		'CNC'
	  ], {
		N: '#minecraft:stone_crafting_materials',
		C: 'extrautilitiesrebirth:compressed_cobblestone'
	})

	event.shaped('cyclic:fan_slab', [
		'   ',
		'FFF',
		'CCC'
	  ], {
		F: 'cyclic:fan',
		C: 'extrautilitiesrebirth:compressed_cobblestone'
	})

	event.shaped('cyclic:rotator', [
		' P ',
		'WCW',
		'NNN'
	  ], {
		P: 'minecraft:piston',
		W: '#minecraft:logs',
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		N: '#forge:nuggets/copper'
	})

	event.shaped('cyclic:disenchanter', [
		' P ',
		'WCW',
		'NNN'
	  ], {
		P: 'cyclic:gem_obsidian',
		W: '#forge:storage_blocks/emerald',
		C: 'minecraft:enchanting_table',
		N: 'quark:obsidian_pressure_plate'
	})

	event.shaped(Item.of('patchouli:guide_book', '{"patchouli:book":"cyclic:cyclic_guide_book"}'), [
		'CB ',
		'   ',
		'   '
	  ], {
		C: 'extrautilitiesrebirth:compressed_cobblestone',
		B: 'minecraft:book'
	})
})