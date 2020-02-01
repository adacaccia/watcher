# watcher

It watches for changes happening into a list of folders, as specified in the
included "inotify_watched.lst" file.
The main event being watched is CLOSE_WRITE, which fires as soon as anything
is closing a file which had been open for writing.
Recursion in the watched directories is currently not supported, as to avoid
requiring too much resources!
A (possibly) large block of code in a 'while' loop, conveniently made in the
form of a 'switch ... case' will then match the directory, where another one
inside will match for the individual filenames, should that be of interest. 
The inner blocks of code will then represent the actual actions to craft on
the given files and/or directories.

Minecraft 1.15.2 branch:
The game launcher downloads the "natives" collection of libraries, but they're
pre-built for linux-amd64, so they can't work on ARM devices such as the RPI4.
Moreover, the exact name of the directory for the natives libraries being
downloaded by the launcher can't be predicted, since it has the form:
"VERSION-natives-" followed by a random big number, like:

[19:36:46 INFO]: Unpacking natives to /home/pi/.minecraft/versions/1.15.2/1.15.2-natives-1321734455105

So, in this branch, the watcher will try to intercept the creation of that
folder, overwriting the downloaded libraries with the version here included,
precompiled for the ARM platform.
A second try will also be done, intercepting the events inside the "native-*"
folder itself, so as to overwrite each and every file just after it has been
downloaded.