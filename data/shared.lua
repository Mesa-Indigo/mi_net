
-- locale option
Locale = 'en'

-- debug options
Debug = true


-- global options

Shared.Taxes = {
    -- account to send taxes to
    account = 'XXXXXXXXXXXX',

    -- percent rate for set store sales
    rate = {
        { shop = 'general',     tax = 0.04 },
        { shop = 'grocery',     tax = 0.04 },
        { shop = 'liqour',      tax = 0.06 },
        { shop = 'ammunation',  tax = 0.08 }
    }
}


-- items options


-- world options