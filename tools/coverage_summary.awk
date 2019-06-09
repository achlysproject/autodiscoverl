#! /usr/bin/env awk

# For further information about the original skeleton template please visit https://github.com/Pouriya-Jahanbakhsh/estuff

BEGIN {

    FS    = "[<>]"
    total = -1

    if (colorize) {
        pre_name  = "\033[1;34m" # Light blue
        post_name = "\033[0m"

        pre_no_test_percentage = "\033[1;30m" # Dark gray
        post_not_test_percentage = "\033[0m"

        pre_low_percentage  = "\033[0;31m" # Red
        post_low_percentage = "\033[0m"

        pre_normal_percentage  = "\033[0;33m" # Orange
        post_normal_percentage = "\033[0m"

        pre_high_percentage  = "\033[0;32m" # Green
        post_high_percentage = "\033[0m"
    }

}


$2 == "tr" && $7 ~ /^autodiscoverl/ && $13 ~ /%$$/ {
    do_print($7, trim_number($13))
}

$2 == "tr" && $7 == "Total" && $13 ~ /%$$/ {
    total = trim_number($13)
}

$2 == "/table" {
    if (total > -1) {
        do_print("Total", total)
    }
    exit
}


function do_print(name, percentage) {
    if (percentage < 15) {
        pre_percentage  = pre_no_test_percentage
        post_percentage = post_no_test_percentage
    } else if (percentage < 50) {
        pre_percentage  = pre_low_percentage
        post_percentage = post_low_percentage
    } else if (percentage < 75) {
        pre_percentage  = pre_normal_percentage
        post_percentage = post_normal_percentage
    } else {
        pre_percentage  = pre_high_percentage
        post_percentage = post_high_percentage
    }
    print sprintf("%s%s%-40s%s%s%-3s%s %s%%%s",
                  indent,
                  pre_name,
                  name,
                  post_name,
                  pre_percentage,
                  percentage,
                  post_percentage,
                  pre_name,
                  post_name)
}


# remove % at the end of string 'item' and convert it to integer
function trim_number(item) {
    return int(substr(item, 1, length(item)-1))
}
