data remove storage dilib:data temp

execute unless score damage dilib..temp matches -2147483648..2147483647 run scoreboard players set damage dilib..temp 1
execute unless data storage dilib:data temp.id run data modify storage dilib:data temp.id set value "minecraft:air"
execute unless data storage dilib:data temp.tag run data modify storage dilib:data temp.tag set value ""
execute unless data storage dilib:data temp.Count run data modify storage dilib:data temp.Count set value 1b
execute unless data storage dilib:data temp.slot run return fail


data modify entity 94a5e3be-355b-ee03-8f48-70c43c0025f9 HandItems[0] set from storage dilib:data temp
execute store result storage dilib:data temp.result byte 1 as 94a5e3be-355b-ee03-8f48-70c43c0025f9 if predicate dilib:mainhand/durability/0 run data modify storage dilib:data temp merge value {id:"minecraft:air",tag:"",Count:1b}
execute as 94a5e3be-355b-ee03-8f48-70c43c0025f9 if predicate dilib:mainhand/tag/armor run data modify storage dilib:data temp.type set value 1b

execute if score damage dilib..temp matches 1.. unless data storage dilib:data temp{result:1b} run function dilib:presets/durability/check


function dilib:presets/durability/replace with storage dilib:data temp

scoreboard players reset unbreaking dilib..temp
scoreboard players reset damage dilib..temp
scoreboard players reset loop dilib..temp
scoreboard players reset random dilib..temp
scoreboard players reset 0 dilib..temp
data remove storage dilib:data temp