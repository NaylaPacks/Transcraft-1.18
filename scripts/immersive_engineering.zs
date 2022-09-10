# = = = = = = = = = = = = = =
#           Transcraft
#     Developed by Nayla    
# = = = = = = = = = = = = = =

print("Initializing 'immersive_engineering.zs'...");

craftingTable.remove(<item:immersiveengineering:manual>);
craftingTable.addShapeless("patchouli_ie_book", <item:patchouli:guide_book>.withTag({"patchouli:book": "patchouli:engineers_manual" as string}), [<item:minecraft:book>, <item:minecraft:lever>]);

print("Initialized 'immersive_engineering.zs'...");