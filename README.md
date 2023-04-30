# Vi-Si-Weg

Vim plugin to toggle text in and out of files into a tag

Usage
-----

`<S-CR>` or `<<`  toggle the tag under cursor open and shut.

|unnamed-tag| become |closed-tag| with a name.

|closed-tag| toggle with |named-tag|.

The three states:

1. *unnamed-tag*

  `[<`tag content`>]`

  `◁`tag content`▷`       (with Conceal)

2. *named-tag*

  `[name<`tag content`>]`

  `◀`tag content`▷`       (with Conceal)

3. *closed-tag*

  `[name<]`

  `▼`                   (with Conceal)

An |unnamed-tag| is assigned a `name` when closed. The `name` remains inside the |closed-tag|.

A |named-tag| overwrites the `name`-file in the current directory when closed. If such a file does not exist, it is created. Name containing a `/` store inside that subfolder.

A |closed-tag| read the content from the `name`-file and inserts it into the |named-tag| when opened.

Commands
--------

:*TagToggle*  Toggles the tag under cursor.
            |unnamed-tag| and |named-tag| become |closed-tag|.
            |closed-tag| toggles to/from |named-tag|.

        *<<*  mapped to |TagToggle| by default

    *<S-CR>*  mapped to |TagToggle| by default

:*TagConceal* Switches on concealed tags. Tag `name` is hidden in |named-tag|. For `.md` files conceal is enabled by default.

:*TagHelp*    Opens this help file


Tag names
---------

Tags consist of three parts:

|g:TagLeader| + sequential number + |g:TagExtension|

e.g.: `.`1`.md`

TAG LEADER

*g:TagLeader* is set to `.` by default, such that hidden files
`.1`,`.2`,`.3`,... are created locally when closing an |unnamed-tag|.

  :*TagHidden*  (default) Tags are stored as hidden files with sequential numbering

  :*TagFile*    name tags after the current file

  :*TagNumbers* stores tags as sequential numbers (not hidden)

  :*TagFolder*  store tags in subfolder `tags/` as sequential numbers

The name can be customised with

  `let g:TagLeader = "myTag"`

or manually written as a |named-tag|:

  `[myFolder/myTag.txt<`my content`>]`

TAG EXTENSIONS

  *g:TagExtension*   matches the current file by default

  :*TagNoExtension*  no file extension for tags (bless brevity)

The extension can be customised with

  `let g:TagExtension = ".csv"`


Help
----

:*TagHelp* shows helpfile (`:h vi-si-weg`)
