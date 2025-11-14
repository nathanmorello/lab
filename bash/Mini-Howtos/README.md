Mini-Howtos is a small bash script for fast sysadmin notes.
You can read everything about it in my blog article [Mini Howtos '＼（〇\_ｏ）／'](https://nathanmorello.com/posts/mini-howtos/).
Beside the code, here you will find a bunch of ready-made notes that you might find useful to strat, or not. Just download the folder's content and put it in your NOTES_DIR.
 
#The script has three main funcionts: CREATING, LISTING and SEARCHING.

#CREATING: This script can create a note: it prompts you for the title of the note; the title that you type will become the title of a .txt file stored in a folder named "nat-notes" stored in a NOTES_DIR folder of your choice.

The title that you type will also become the first line of that file with as many hyphens above and below as the number of characters of the title.
Spaces in the name of the title will be substituted by underscores in the name of the file (not in the file's title).

Then the script prompts you for one or more labels for the note that you are creating.
Then it prompts for the text of the note.
Finally, you can end the note by writing "EOF."

LISTING: When typing "list" in position $1, the script lists all the files in your NOTES_DIR folder and assigns a number to each note. By typing the number of the note the correspondent note appears on the screen (command cat); when adding "edit" on position $2, the note is opened with vim (or your favoirte editor, according to what you chose to put in the correspondent variable).

SEARCHING: when typing "search" you are given a list of labels (the same labels that you created during the CREATING), with assigned numbers. You are prompted to type a number correspondent to a label or a word.
When you type a number, you get a list of all the files within the folder "nat-notes" that contain the correspondent label. Each title is also numbered. When typing one or more numbers you get a cat of all the titles that you typed, when typing "all" you get a cat of all the titles included in the list, when typing one number and "edit" in position $2 the correspondent file is opened in vim.
When you type a word you get a list of all the files within the folder "nat-notes" that contain that word. Each title is numbered. When typing one or more numbers you get a cat of all the titles that you typed, when typing "all" you get a cat of all the titles included in the list, when typing one number and "edit" in position $2 the correspondent file is opened in vim.
