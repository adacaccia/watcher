# watcher

Mette sotto monitoraggio una lista di directory specificate in "inotify_watched.lst"
per eventi di creazione e modifica di qualunque file in esse contenuto (senza ricorsione).
Intercetta quindi gli eventi generati da inotifywait e li decodifica per stabilire
un opportuno trattamento per ogni tipo di file in ciascuna directory.
