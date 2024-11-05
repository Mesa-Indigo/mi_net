
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