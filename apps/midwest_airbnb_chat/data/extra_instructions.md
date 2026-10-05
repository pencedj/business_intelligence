# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

<!-- Add more rules below (Assignment 05 asks for at least three). Good candidates:
     `host_is_superhost` and `instant_bookable` are the text values 't' and 'f',
     not booleans; how to match a city name the user types; how to search `name`
     case-insensitively; and whether to ignore rows whose `review_scores_rating`
     is NULL when averaging ratings. -->
- `host_is_superhost` and `instant_bookable` are stored as text values: `'t'` means true and `'f'` means false. Use quoted values when filtering these columns.

- `city` contains exactly three region names: `'Chicago'`, `'Columbus'`, and `'Twin Cities'`. Match the user's city request to these exact values.

- When searching listing names in `name`, use a case-insensitive search with `LOWER(name)` and `LIKE` so that capitalization does not affect the results.