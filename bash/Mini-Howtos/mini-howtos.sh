#!/usr/bin/env bash
# This script was written by me and is free for anyone to copy, use, and modify for any purpose.
# No attribution is required, but it is appreciated.
# Enjoy 
# Nathan Morello

set -euo pipefail

# Path to notes folder
NOTES_DIR="$HOME/mini-howtos"
EDITOR_CMD="${EDITOR:-vim}"

# Ensure folder exists
mkdir -p "$NOTES_DIR"

# Colors
RESET="\033[0m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"



# Helper: print a horizontal line
print_line() {
    local char="$1"
    local len="$2"
    printf "%${len}s\n" | tr " " "$char"
}

# ---------------- CREATING ----------------
create_note() {
    read -rp "Enter note title: " title
    # Sanitize filename: replace spaces with underscores and strip slashes
    file_title="${title// /_}"
    file_title="${file_title//\//-}.txt"
    file_path="$NOTES_DIR/$file_title"

    # Collect multiple labels
    labels=()
    while true; do
        read -rp "$(echo -e ${YELLOW}Enter label \(leave empty to finish\): ${RESET})" label
        [[ -z "$label" ]] && break
        labels+=("$label")
    done

    echo "Enter note content (finish with EOF on its own line):"
    content=""
    while IFS= read -r line; do
        [[ $line == "EOF" ]] && break
        content+="$line"$'\n'
    done

    {
	# Two empty lines + the face
        echo
        echo
        echo "＼（〇_ｏ）／"
        # Title with dashes
        print_line "-" "${#title}"
        echo "$title"
        print_line "-" "${#title}"
        for lbl in "${labels[@]}"; do
            echo "Label: $lbl"
        done
        echo
        printf "%s" "$content"
    } > "$file_path"

    echo "Note saved to: $file_path"
}


# ---------------- LISTING ----------------
list_notes() {
    # Collect files (filenames only), sorted
    echo "📋Listing notes..."
    mapfile -t files < <(find "$NOTES_DIR" -maxdepth 1 -type f -printf '%f\n' | sort)
    if [ ${#files[@]} -eq 0 ]; then
        echo "No notes found."
        return 0
    fi

    echo -e "${BLUE}Notes:${RESET}"
    for i in "${!files[@]}"; do
        printf "${BLUE}%2d) %s${RESET}\n" "$((i+1))" "${files[$i]}"
    done

    # Read a whole line so we can parse "2 edit"
    read -r -p "Enter note number (e.g., '2' or '2 edit'): " line
    # Split by IFS
    read -r num action <<<"$line"

    # Validate number
    if ! [[ "${num:-}" =~ ^[0-9]+$ ]] || (( num < 1 || num > ${#files[@]} )); then
        echo "Invalid selection."
        return 1
    fi

    selected="${files[$((num-1))]}"
    if [[ "${action:-}" == "edit" ]]; then
        "$EDITOR_CMD" "$NOTES_DIR/$selected"
    else
        cat "$NOTES_DIR/$selected"
    fi
}

# ---------------- SEARCHING ----------------
search_notes() {
    # Build unique label list
    echo "🔍Here you can search the notes"
    declare -A seen_labels=()
    unique_labels=()

    shopt -s nullglob
    for f in "$NOTES_DIR"/*.txt; do
        while IFS= read -r lbl; do
            lbl="${lbl#Label: }"   # rimuove "Label: "
            lbl="$(echo "$lbl" | xargs)" # trim spazi
            if [[ -n "$lbl" && -z "${seen_labels[$lbl]+x}" ]]; then
                unique_labels+=("$lbl")
                seen_labels[$lbl]=1
            fi
        done < <(grep '^Label:' "$f")
    done

    shopt -u nullglob

    if ((${#unique_labels[@]})); then
        echo -e "${YELLOW}Labels:${RESET}"
        for i in "${!unique_labels[@]}"; do
            printf "${YELLOW}%2d) %s${RESET}\n" "$((i+1))" "${unique_labels[$i]}"
        done
    else
        echo "No labels found yet."
    fi

    read -r -p $'\e[35mSearch by label number or keyword: \e[0m' search_term

    results=()
    if [[ "$search_term" =~ ^[0-9]+$ ]] && (( search_term >= 1 && search_term <= ${#unique_labels[@]} )); then
        label="${unique_labels[$((search_term-1))]}"
        # Fixed-string search for exact "Label: <label>"
        mapfile -t results < <(grep -l -F "Label: $label" "$NOTES_DIR"/*.txt 2>/dev/null | sort)
    else
        # Case-insensitive keyword search anywhere in the note
        mapfile -t results < <(grep -il -- "$search_term" "$NOTES_DIR"/*.txt 2>/dev/null | sort)
    fi

    if ((${#results[@]} == 0)); then
        echo "No results found."
        return 0
    fi

    echo -e "${PINK}Results:${RESET}"
    for i in "${!results[@]}"; do
        printf "%2d) %s\n" "$((i+1))" "$(basename "${results[$i]}")"
    done

    read -r -p "$(echo -e ${PINK}Enter note numbers \(space-separated\), 'all', or 'N edit': ${RESET})" choice_line

    # Detect trailing 'edit'
    edit_mode=0
    # Split tokens
    read -ra tokens <<<"$choice_line"
    if ((${#tokens[@]} >= 1)) && [[ "${tokens[-1]}" == "edit" ]]; then
        edit_mode=1
        unset 'tokens[-1]'
    fi

    # Handle 'all'
    if ((${#tokens[@]} == 1)) && [[ "${tokens[0]}" == "all" ]]; then
        for f in "${results[@]}"; do
            cat "$f"
            echo
        done
        return 0
    fi

    # Collect selected indices
    selections=()
    for t in "${tokens[@]}"; do
        if [[ "$t" =~ ^[0-9]+$ ]] && (( t >= 1 && t <= ${#results[@]} )); then
            selections+=("$t")
        else
            echo "Skipping invalid selection: $t"
        fi
    done

    if ((${#selections[@]} == 0)); then
        echo "Nothing to show."
        return 0
    fi

    if (( edit_mode == 1 && ${#selections[@]} == 1 )); then
        f="${results[$((${selections[0]}-1))]}"
        "$EDITOR_CMD" "$f"
        return 0
    fi

    # Default: cat selected notes
    for s in "${selections[@]}"; do
        f="${results[$((s-1))]}"
        cat "$f"
        echo
    done
}



# ---------------- MAIN ----------------
case "${1:-}" in
    create) create_note ;;
    list)   list_notes ;;
    search) search_notes ;;
    *)
        echo "
      ＼（〇_ｏ）／   
 Welcome to mini-howtos!

Usage:  📝create
        📋list
        🔍search

        "

        ;;
esac



