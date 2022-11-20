function SB_execute_mine(removalshort_, removalsound_, doremovalsound_, delthese_)
    local delthese = {}
    if (delthese_ ~= nil) then
        for i, v in ipairs(delthese_) do
            table.insert(delthese, v)
        end
    end
    local ismine = getunitswitheffect("mine", false, delthese)

    local removalshort = removalshort_ or ""
    local removalsound = removalsound_ or 0
    local doremovalsound = doremovalsound_ or false

    for id, unit in ipairs(ismine) do
        if (issafe(unit.fixed) == false) and (unit.new == false) then
            local x, y = unit.values[XPOS], unit.values[YPOS]
            local stuff = findallhere(x, y)

            if (#stuff > 0) then
                for i, v in ipairs(stuff) do
                    if floating(v, unit.fixed, x, y) then
                        local vunit = mmf.newObject(v)
                        local thistype = vunit.strings[UNITTYPE]
                        if (v ~= unit.fixed) then
                            delthese, removalshort, removalsound, doremovalsound = SB_do_boom(delthese, unit.fixed,
                                doremovalsound)
                            break
                        end
                    end
                end
            end
        end
    end

    return delthese, removalshort, removalsound, doremovalsound
end

function SB_do_boom(delthese_, unit_id, doremovalsound_)
    local delthese = {}
    if (delthese_ ~= nil) then
        for i, v in ipairs(delthese_) do
            table.insert(delthese, v)
        end
    end
    local unit = mmf.newObject(unit_id)
    local ux, uy = unit.values[XPOS], unit.values[YPOS]
    local sunk = false
    local doeffect = true
    local doremovalsound = doremovalsound_ or false
    local removalshort = ""
    local removalsound = 0

    if (issafe(unit.fixed) == false) then
        sunk = true
    else
        doremovalsound = true
    end

    local name = unit.strings[UNITNAME]
    local count = hasfeature_count(name, "is", "mine", unit.fixed, ux, uy)
    if (SB_is_metatext(name) == true) then
        count = count + hasfeature_count("text", "is", "mine", unit.fixed, ux, uy)
    end
    print("boom count = " .. count)
    local dim = math.min(count - 1, math.max(roomsizex, roomsizey))

    local locs = {}
    if (dim <= 0) then
        table.insert(locs, { 0, 0 })
    else
        for g = -dim, dim do
            for h = -dim, dim do
                table.insert(locs, { g, h })
            end
        end
    end

    for a, b in ipairs(locs) do
        local g = b[1]
        local h = b[2]
        local x = ux + g
        local y = uy + h
        local tileid = x + y * roomsizex

        if (unitmap[tileid] ~= nil) and inbounds(x, y, 1) then
            local water = findallhere(x, y)

            if (#water > 0) then
                for e, f in ipairs(water) do
                    if floating(f, unit.fixed, x, y) then
                        if (f ~= unit.fixed) then
                            local doboom = true

                            for c, d in ipairs(delthese) do
                                if (d == f) then
                                    doboom = false
                                elseif (d == unit.fixed) then
                                    sunk = false
                                end
                            end

                            if doboom and (issafe(f) == false) then
                                table.insert(delthese, f)
                                MF_particles("smoke", x, y, 4, 0, 2, 1, 1)
                            end
                        end
                    end
                end
            end
        end
    end

    if doeffect then
        generaldata.values[SHAKE] = 6
        local pmult, sound = checkeffecthistory("boom")
        removalshort = sound
        removalsound = 1
        local c1, c2 = getcolour(unit.fixed)
        MF_particles("smoke", ux, uy, 15 * pmult, c1, c2, 1, 1)
    end

    if sunk then
        table.insert(delthese, unit.fixed)
    end

    return delthese, removalshort, removalsound, doremovalsound
end
