
-- locale option
Locale = 'en'

-- debug options
Debug = true

-- framework choice / 'ox', 'esx', 'qbox'
System = 'ox'

-- Notification Documentation
-- https://overextended.dev/ox_lib/Modules/Interface/Client/notify

-- adjust colors & details in the source/shared/shared.lua file

-- notification options
Shared.Notify = {

    -- enable or disable notifications
    enable = true,

    -- set position of notifications
    position = 'top',

    -- set duration of notifications in ms
    duration = 5000,

    -- show duration on notification
    showtime = false,

    -- set notification icon animation
    animate = 'beat',

    -- sound to play on notification
    sound = { a = 'set', b = 'set' }
}