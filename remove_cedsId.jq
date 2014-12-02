(.. | objects | select(has("value")) | select(has("cedsdisambig")))  |=  ( .value ) |
(.. | objects | select(has("value")))  |=  ( .value )

