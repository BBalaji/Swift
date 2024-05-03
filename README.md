

https://github.com/BBalaji/Swift/assets/1823150/986f2c14-6c19-4cc9-9c1e-a342e914075f



# PaginationTable
Example of how pagination in a table works

<img width="240" alt="img" src="https://github.com/BBalaji/Swift/assets/1823150/986f2c14-6c19-4cc9-9c1e-a342e914075f">

### Core components:
- rowData: This array will grow on each scroll-ended-event until it has loaded all items from backend-API
- paginationAmount: The amount to fetch on each pagination cycle
- paginationIndex: The current amount of cells (this grows as you load more data
- isFetching: A boolean that lets the code know if data is already loading or not, to avoid double fetching etc
- fetchData: Simulates getting data from remote-api

## Gotchas:
- The example code is not reliant on a backend. It simply tests with data from a file and simulates network calls by sleeping for some seconds
- The example uses some dependencies in order to speed up the creation of this example. But its basic stuff like Asyn Await

### Requirements:
- Backend-API that can provide the count of Limit


