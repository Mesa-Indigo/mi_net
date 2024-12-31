
-- do not mess with unless you know what you are doing
-- or you are autistic as fuck like me

--- network
--- id - used for tracing
--- signal - connection speed
--- security - difficulty to access
--- access - groups with access

return {

    ['zn_ls_1'] = {
        label = "South Los Santos Port",
        network = {
            id = "minet.lsco.south.port",
            signal = { min = 3, max = 8 },
            security = 3,
            access = { "government" }

        },
        zone = {
            vec(0,0,0),
            vec(0,0,0),
            vec(0,0,0),
            vec(0,0,0),
            vec(0,0,0),
            vec(0,0,0),
        }
    }

}