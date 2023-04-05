<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content=
    "width=device-width, initial-scale=1">
    <title>JioTV+</title>
    <link rel="shortcut icon" type="image/x-icon" href=
    "https://i.ibb.co/37fVLxB/f4027915ec9335046755d489a14472f2.png">
    <meta name="robots" content="noindex">
    <link rel="stylesheet" href=
    "https://cdn.jsdelivr.net/npm/bootswatch@5.1.3/dist/simplex/bootstrap.min.css">
    <style>
        .modal-dialog {
        max-width: 80%;
        margin: 0 auto;
        }
        .modal-body {
        padding: 2px;
        }
    </style>
</head>
<body>
    <div class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-floating">
                        <input type="text" class="form-control" id=
                        "channelSearch" placeholder="Search">
                        <label for="channelSearch">Search</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="py-2">
        <div class="container">
            <div class="row" id="channelCards">
                <?php
                $json = json_decode(file_get_contents('assets/channels.json'), true);
                foreach ($json['result'] as $channel) {
                    echo '<div class="card-parent col-6 col-sn-4 col-md-3 col-lg-3 col-xl-2 mb-3">' . PHP_EOL;
                    echo '<div class="card border-primary h-100">' . PHP_EOL;
                    printf("<img class=\"lazyload card-img-top\" alt=\"\" src=\"https://jiotv.catchup.cdn.jio.com/dare_images/images/%s\">" . PHP_EOL, $channel['logoUrl']);
                    echo '<div align="center" class="card-body flex-grow-0 mt-auto">' . PHP_EOL;
                    echo '<p class="card-text">' . PHP_EOL;
                    printf("<span class=\"badge rounded-pill bg-dark\">%s</span>" . PHP_EOL, $channel['channelCategoryId']);
                    printf("<span class=\"badge rounded-pill bg-dark\">%s</span>" . PHP_EOL, $channel['channelLanguageId']);
                    echo '</p>' . PHP_EOL;
                    printf("<a class=\"popup-vide\" href=\"/play.php?c=%s\">" . PHP_EOL, $channel['target']);
                    printf("%s" . PHP_EOL, $channel['channel_name']);
                    echo "</a>\n</div>\n</div>\n</div>" . PHP_EOL;
                }
                ?>
            </div>
        </div>
    </div>
    <script src=
    "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

    <script>
    $(document).ready(function(){
    // Searchbar logic
    $('#channelSearch').on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $(".card-parent").filter(function() {
    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
    });
    </script>

    <script src=
    "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src=
    "https://cdn.jsdelivr.net/npm/lazysizes@5.3.2/lazysizes.min.js"></script>
    <script src=
    "https://cdn.jsdelivr.net/npm/@iconify/iconify@2.1.2/dist/iconify.min.js"></script>
</body>
</html>


