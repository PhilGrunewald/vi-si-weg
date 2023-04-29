# Vi-Si-Weg

Toggles text on/off with <S-CR>

Usage
-----

*<S-CR>*   Toggles the tag under cursor (normal mode). |unnamed-tag| and
|named-tag| become |closed-tag|. |closed-tag| toggles with |named-tag|.

Tags come in three states:

1. *unnamed-tag*
  `[<`tag content`>]`
  `◁`tag content`▷`       (with Conceal)

2. *named-tag*
  `[name<`tag content`>]`
  `◀`tag content`▷`       (with Conceal)

3. *closed-tag*
  `[name<]`
  `▼`                   (with Conceal)

An |unnamed-tag| is assigned a `name` when closed with <S-CR>. The `name` consists of the |g:TagLeader| and the lowest unused sequential number. The `name` remains inside the |closed-tag|.

A |named-tag| overwrites the `name`-file in the current directory when closed with <S-CR>. If such a file does not exist, it is created. Name containing a `/` store inside that subfolder.

A |closed-tag| gets the content from the `name`-file and inserts it into the |named-tag| when opened with <S-CR>

Tag names
---------

*g:TagLeader* is set to `.` by default, such that hidden files `.1`,`.2`,`.3`,... are created. Alternative presets are:

:*TagNumbers* stores tags as sequential numbers (not hidden)

:*TagFolder* Tags are stored in subfolder `tag` as sequential numbers.

:*TagHidden* (default) Tags are stored as hidden files with sequential numbering

The variable can be customised with

  `let g:TagLeader = "myTag"`

Help
----

:*TagHelp* shows helpfile (`:h vi-si-weg`)
