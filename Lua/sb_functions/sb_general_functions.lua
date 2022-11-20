function SB_samename_object(name, name2)
    return name == name2
end

function SB_is_metatext(name)
    return string.sub(name, 1, 5) == "text_"
end

function SB_is_targetof_condition(pname, unitid, pnot)
    local unit = mmf.newObject(unitid)
    local name = unit.strings[UNITNAME]
    pnot = pnot or false
    if (SB_is_metatext(pname) == true) then
        if (pnot == true) then
            return (pname ~= name) and (SB_is_metatext(name) == true)
        else
            return pname == name
        end
    elseif (pname == "text") then
        return SB_is_metatext(name) ~= pnot
    else
        if (pnot == true) then
            return (pname ~= name) and (SB_is_metatext(name) == false)
        else
            return pname == name
        end
    end
end

function SB_init()
    nocodeunits = {}
end

function SB_clear_units()
    nocodeunits = {}
end

function SB_convert_visual_option(rule_)
    local rule = {}

    for i, j in ipairs(rule_) do rule[i] = j end

    rule[1] = SB_convert_name(rule[1])
    rule[3] = SB_convert_name(rule[3])

    return rule[1], rule[2], rule[3]
end

function SB_convert_name(name)
    local name_ = name
    local isnot = string.sub(name_, 1, 4)
    if (isnot == "not ") then
        name_ = string.sub(name_, 5)
    else
        isnot = ""
    end
    if (string.sub(name_, 0, 5) == "text_") then
        name_ = "textof " .. string.sub(name_, 6)
    end

    if (word_names[name_] ~= nil) then
        name_ = isnot .. word_names[name_]
    else
        name_ = isnot .. name_
    end

    return name_, isnot
end
