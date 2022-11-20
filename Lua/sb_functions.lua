SB_include_file_list = {
    "sb_functions/sb_general_functions.lua",
    "sb_functions/sb_textof.lua",
    "sb_functions/sb_pure.lua",
    "sb_functions/sb_define.lua",
    "sb_functions/sb_mine.lua",
    "sb_functions/sb_conditions.lua",
}

function SB_setupmods()
    local world = generaldata.strings[WORLD]

    --MF_alert(world .. ": " .. tostring(#files))

    for i, file in ipairs(SB_include_file_list) do
        print("Added custom levelpack (" .. world .. ") lua file " .. file)
        dofile("Data/Worlds/" .. world .. "/Lua/" .. file)
    end
end

SB_setupmods()
