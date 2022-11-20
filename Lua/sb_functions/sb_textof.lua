function SB_is_group_of_text(unit)
    return (unit.strings[UNITTYPE] == "text") and (nocodeunits[name] == nil) and
        (featureindex[unit.strings[UNITNAME]] == nil)
end

function SB_can_convert_text(target, verb, object)
    return (
        (string.sub(target, 0, 5) == "text_") and (verb == "is") and ((object ~= "text") and (target ~= object)
            ))
end

function SB_text_protected(rule)
    return (string.sub(rule[1], 0, 5) == "text_") and (rule[2] == "is") and (rule[3] == "text")
end

function SB_add_nocodeunits()
    local name_list = {}
    print("-- nocodeunits --")
    for i, unit in ipairs(unitlists["text"]) do
        local name = mmf.newObject(unit).strings[UNITNAME]
        --print(name .. " " .. tostring((featureindex[name] ~= nil) and (name_list[name] == nil)))
        if (featureindex[name] ~= nil) and (name_list[name] == nil) then
            name_list[name] = 1
        end
    end
    for name, dummy in pairs(name_list) do
        nocodeunits[name] = 1
        print("(uncode)" .. name .. ", " .. tostring(unitlists[name] == nil))
        if (unitlists[name] ~= nil) then
            for i, v in ipairs(unitlists[name]) do
                print(name)
            end
        end
        local remove_list = {}
        for m, v in ipairs(unitlists["text"]) do
            if (mmf.newObject(v).strings[UNITNAME] == name) then
                if (unitlists[name] == nil) then
                    unitlists[name] = {}
                end
                print("insert")
                --table.insert(unitlists[name], v)
                table.insert(remove_list, m)
            end
        end
        table.sort(remove_list, function(a, b) return a > b end)
        for m, v in ipairs(remove_list) do
            print("remove")
            table.remove(unitlists["text"], v)
        end
    end
    print("--end of nocodeunits --")
end

function SB_remove_nocodeunits()
    local name_list = {}
    print("-- remove nocodeunits --")
    for name, i in pairs(nocodeunits) do
        table.insert(name_list, name)
    end
    for i, name in ipairs(name_list) do
        print("removing " .. name)
        for m, v in ipairs(unitlists[name]) do
            print("remove")
            table.insert(unitlists["text"], v)
        end
        --unitlists[name] = nil
        nocodeunits[name] = nil
    end
    print("-- end --")
end
