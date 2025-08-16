<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lido Elisa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>

<body>

    <h1 class="text-center my-4">Ombrelloni</h1>
    <div class="container d-flex justify-content-center">
        <div class="table-responsive">
            <table id="ombrelloni" class="table table-bordered text-center">
                <tbody> </tbody>
            </table>
        </div>
    </div>

    <script>
        const rows = 7;
        const columns = 17;
        const emptyCol = 9;

        const tbody = document.querySelector("#ombrelloni tbody");

        let counter = 1;

        for (let r = 0; r < rows; r++) {
            const tr = document.createElement('tr');
            for (let c = 1; c <= columns; c++) {
                const td = document.createElement('td');
                if (c === emptyCol) {
                    td.textContent = "";
                } else {
                    td.textContent = counter;
                    td.id = counter;
                    td.setAttribute("onclick", "add_remove(" + counter + ")");
                    counter++;
                    console.log(td);
                }
                tr.appendChild(td);
            }
            tbody.appendChild(tr);
        }

        function add_remove(counter) {
            const td = document.getElementById(counter);
            td.classList.value = bg
            text = td.textContent;
            if (text == '') {
                td.textContent = counter
            } else {
                td.textContent = '';
            }
        }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>

</body>

</html>