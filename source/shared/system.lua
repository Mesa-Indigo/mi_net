
-- creation of minet address for item / tool metadata
GenerateMINetAddress = function()
    -- ASCII values for 'A' to 'Z'
    local ASCII = {a = 65, o = 90 }
    local letters = ""
    for i = 1, 3 do
        letters = letters .. string.char(math.random(ASCII.a, ASCII.o))
    end

    local octet = {
        a = math.random(0, 255),
        b = math.random(0, 255),
        c = math.random(0, 255)
    }

    math.randomseed(os.time())

    return string.format("%s.%d.%d.%d", letters, octet.a, octet.b, octet.c)
end

-- creation of user identifiers for minet address trace
-- intake character first, last name & dob for generation

local testuser = {
    fname = "Will",
    lname = "Mercer",
    dob = "08/27/1995"
}

local convertDateString = function(date)
    local month, day, year = date:match("(%d%d)/(%d%d)/(%d%d%d%d)")
    if not (month and day and year) then
        return nil, "Invalid date format"
    end
    local conversion = year..month..day
    return conversion
end

local convertNameString = function(first, last)
    local initial_first = string.sub(first, 1, 1)
    local initial_last = string.sub(last, 1, 1)

    local initials = initial_first .. initial_last
    return initials
end

GenerateMINetUserID = function(date, first, last)
    local userid = ""
    local id_date = convertDateString(date)
    local id_name = convertNameString(first, last)
    if id_date and id_name then
        userid = id_date .. id_name
    end
    return userid
end

GetIG_Time = function()
    local i = {
        sc = GetClockSeconds(), mn = GetClockMinutes(), hr = GetClockHours()
    } return i
end

GetIG_Date = function()
    local i = {
        dy = GetClockDayOfMonth(), wk = GetClockDayOfWeek(), mn = GetClockMonth()
    } return i
end