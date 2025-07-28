local i = require("neogen.types.template").item

local annotation = {
    { i.Parameter, "%s: $1", { before_first_item = { "# Parameters" } } },
    { i.Return, "%s: $1", { before_first_item = { "# Returns" } },no_results = false },
}
return annotation
