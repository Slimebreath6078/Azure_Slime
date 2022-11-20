function SB_create_pure_list()
    local result = {}

    if (featureindex["pure"] ~= nil) then
        for i, rules in ipairs(featureindex["pure"]) do
            local rule = rules[1]
            if (rule[3] == "pure") then
                local conds = rules[2]
                local newconds = {}
                local crashy = false

                if (conds[1] ~= "never") then
                    newconds, crashy = invertconds(conds, nil, rules[3])
                    if (crashy == true) then
                        addoption({ rule[1], "is", "crash" }, newconds, rules[3], false, nil, rules[4])
                    end
                else
                    newconds = { "never", {} }
                end

                table.insert(result, { i, newconds })
            end
        end
    end

    return result
end

function SB_execute_pures(list)
    local function insert_newconds(list, new_conds)
        if (list[1] ~= "never") then
            for dummy_i, new_cond in ipairs(new_conds) do
                table.insert(list, new_cond)
            end
        end
    end

    for i, v in pairs(list) do
        local rules = featureindex["pure"][v[1]]
        local rule = rules[1]
        local pure_object = rule[1]
        if (featureindex["pure"] ~= nil) then
            if (SB_is_metatext(pure_object) == true) then
                local object_name = string.sub(pure_object, 6)
                if (featureindex[object_name] ~= nil) then
                    for dummy_i, rules2 in ipairs(featureindex[object_name]) do
                        local rule2 = rules2[1]
                        print("write purify target " .. rule2[3])
                        if (rule2[2] == "write" and rule2[3] == object_name) then
                            insert_newconds(rules2[2], v[2])
                        end
                    end
                end
            end
            for dummy_i, rules2 in ipairs(featureindex[pure_object]) do
                local rule2 = rules2[1]
                if (rule2[3] == pure_object and rule2[1] ~= pure_object) then
                    if (rule2[2] == "is") then
                        insert_newconds(rules2[2], v[2])
                    end
                end
            end
        end
    end
end
