module mods.auto_import;

import std.array;
import std.file;
import std.stdio;
import std.string;

/*
This file literally just modified the api.d file.
*/

void main() {
    writeln("AUTO IMPORT: Automating imports.");

    string[] importList = [];

    foreach (filename; dirEntries("mods/", SpanMode.shallow)) {
        if (isDir!string(filename)) {
            // writeln("folder: ", filename);

            string target = filename ~ "/init.d";

            if (isFile!string(target)) {
                // Turn it into a module path and chop the [.d] off it.
                string thisImport = target.replace("/", ".");
                thisImport = thisImport[0 .. (thisImport.length) - 2];

                importList ~= thisImport;

            }
        }
    }
}
