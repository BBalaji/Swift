
![platform](https://img.shields.io/badge/Platform-iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)

# PaginationTable
Example of how pagination in a table works

<img width="240" alt="img" src="https://github.com/BBalaji/Swift/assets/1823150/2d1b6af1-649b-40df-bd5b-cbdfe3483791?raw=true">

### Core components:
- rowData: This array will grow on each scroll-ended-event until it has loaded all items from backend-API
- paginationAmount: The amount to fetch on each pagination cycle limit is 10
- paginationIndex: The current amount of cells (this grows as you load more data)
- isFetching: A boolean that lets the code know if data is already loading or not, to avoid double fetching etc
- fetchData: Simulates getting data from remote-api

## Gotchas:
- Async await offers several benefits over asynchronous closures:

Async/await leads to code that is more concise and easier to read, avoiding the “callback hell” problem of nested closures.
With async/await, functions are guaranteed to return a single result, while completion closures might be called multiple times or might not be called at all.
Swift concurrency uses a cooperative thread pool behind the scenes, avoiding thread explosion and excessive context switching. This is done transparently, so developers do not need to worry about threading.

### Requirements:
- Backend-API that can provide the count of Limit


