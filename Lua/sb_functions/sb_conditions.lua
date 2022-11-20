condlist["changed"] = function(params, checkedconds, checkedconds_, cdata)
    local unit = mmf.newObject(cdata.unitid)
    return unit.strings[UNITNAME] ~= unit.originalname
end
