Shared, Data = {}, {}
lib.locale()

IGTime = function()
    local i = {
        s = GetClockSeconds(),
        m = GetClockMinutes(),
        h = GetClockHours()
    } return i
end

IGDate = function()
    local i = {
        d = GetClockDayOfMonth(),
        w = GetClockDayOfWeek(),
        m = GetClockMonth()
    } return i
end

-- minet address creation
GenerateMINetAddress = function()
    -- Generate three random uppercase letters for the front
    local letters = ""
    for i = 1, 3 do
        letters = letters .. string.char(math.random(65, 90)) -- ASCII values for 'A' to 'Z'
    end

    -- Generate random numbers for the remaining octets
    local octet1 = math.random(0, 255)
    local octet2 = math.random(0, 255)
    local octet3 = math.random(0, 255)

    -- Concatenate them into a string with the letters at the front
    return string.format("%s.%d.%d.%d", letters, octet1, octet2, octet3)
end

-- Seed the random number generator for better randomness
math.randomseed(os.time())

-- Test the function
print(GenerateMINetAddress())

--------------------------------
----    Helpful Links   ----
-- https://www.w3schools.com/colors/colors_picker.asp For HTML Colors
-- https://fontawesome.com/search?m=free&o=r For Choosing Icons
-- https://overextended.dev/ox_lib/Modules/Interface/Client/notify Notification Documentation

----    Notification Options    ----
NotInfo = {
    position = Shared.Notify.position,
    duration = Shared.Notify.duration,
    showduration = Shared.Notify.showtime,
}

-- blue
Inf = {
    color_bgnd = '#004466',
    color_text = '#ffffff',
    color_desc = '#ffffff',
    color_icon = '#ffffff',
    icon_disp = 'question',
    icon_anim = Shared.Notify.animate
}

-- red
Err = {
    color_bgnd = '#660000',
    color_text = '#ffffff',
    color_desc = '#ffffff',
    color_icon = '#ffffff',
    icon_disp = 'xmark',
    icon_anim = Shared.Notify.animate
}

-- green
Cor = {
    color_bgnd = '#006644',
    color_text = '#ffffff',
    color_desc = '#ffffff',
    color_icon = '#ffffff',
    icon_disp = 'check',
    icon_anim = Shared.Notify.animate
}

-- yellow
War = {
    color_bgnd = '#FF7627',
    color_text = '#ffffff',
    color_desc = '#ffffff',
    color_icon = '#ffffff',
    icon_disp = 'exclamation',
    icon_anim = Shared.Notify.animate
}

Notify = function(d, t)
    if not Shared.Notify.enable then
        if Debug then
            print(d ..', '.. t)
        return end
    end
    if Shared.Notify.enable then
        lib.notify({
            id = d.id,
            title = d.title,
            description = d.description,
            duration = NotInfo.duration,
            showDuration = NotInfo.showduration,
            position = NotInfo.position,
            style = {
                backgroundColor = t.color_bgnd,
                color = t.color_text,
                ['.description'] = {
                    color = t.color_desc
                }
            },
            icon = t.icon_disp,
            iconColor = t.color_icon,
            iconAnimation = t.icon_anim
        })
    end
end