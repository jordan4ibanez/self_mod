module mods.auto_import;

import std.file;
import std.stdio;

/*
This file literally just modified the api.d file.
*/

void main() {
    writeln("AUTO IMPORT: Automating imports.");

    foreach (filename; dirEntries("mods/", SpanMode.shallow)) {
        if (isDir!string(filename)) {
            writeln("folder: ", filename);
        }
    }
}
