*vi-si-weg.txt* <S-CR> toggles text on/off into tags

====================================================================
CONTENTS                                          *vi-si-weg-contents*

    1. Usage ..................... |vi-si-weg-use|
    2. Changing tag names ........ |vi-si-weg-tags|
    3. Revision history .......... |vi-si-weg-revisions|

====================================================================
Using vi-si-weg tags                                   *vi-si-weg-use*

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

====================================================================
Changing tag names                                    *vi-si-weg-tags*

*g:TagLeader* is set to `.` by default, such that hidden files
`.1`,`.2`,`.3`,... are created. Alternative presets are:

:*TagNumbers* stores tags as sequential numbers (not hidden)
:*TagFolder* Tags are stored in subfolder `tag` as sequential numbers.
:*TagHidden* (default) Tags are stored as hidden files with sequential numbering

The variable can be customised with

  `let g:TagLeader = "myTag"`


====================================================================
Revision history                                 *vi-si-weg-revisions*

| Date      | Ver.  | Author         | Updates         |
| ----      | ----- | ------         | --------        |
| 29 Apr 23 | v1.0  | Phil Grunewald | Sub-folders     |
| 28 Apr 23 | v0.2  | Phil Grunewald | g:TagLabel      |
| 27 Apr 23 | v0.1  | Phil Grunewald | Conceal         |








===================================================================
 vim:tw=78:ts=8:sw=2:et:ft=help:norl:
