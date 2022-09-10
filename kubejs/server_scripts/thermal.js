// priority: 0

settings.logAddedRecipes = true
settings.logRemovedRecipes = true
settings.logSkippedRecipes = false
settings.logErroringRecipes = true

onEvent('recipes', (event) => {
    event.recipes.thermal.magmatic_fuel({
        type: 'thermal.magmatic_fuel',
        ingredient: { fluid: 'tconstruct:blazing_blood', amount: 1000 },
        energy: 10000000

    });
});