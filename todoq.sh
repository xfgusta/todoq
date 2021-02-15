#!/bin/bash

QUEUE="$HOME/.todo_queue"

main() {
    if [ ! -f $QUEUE ]; then
        >> $QUEUE
    fi
    
    while getopts ":a:dlch" opt ; do
        case $opt in
            h)
                usage
                exit
                ;;
            a)
                shift
                add_task "$*"
                exit
                ;;
            d)
                remove_task
                exit
                ;;
            l)
                list_all
                exit
                ;;
            c)
                clear_queue
                exit
                ;;
            \?)
                echo "Invalid option: $OPTARG" 1>&2
                exit
                ;;
            :)
                echo "Invalid option: $OPTARG requires an argument" 1>&2
                exit
                ;;
        esac
    done
    get_first
}

usage() {
cat << EOF
Usage: todoq [-a NAME] [-d] [-l] [-c] [-h]

-a NAME        enqueue a task
-d             dequeue a task
-l             list all tasks
-c             clear the queue
-h             display this message

When no arguments are passed, print the first task to do
EOF
}

add_task() {
    # newlines to spaces
    name="${*//$'\n'/ }"
    echo $name >> $QUEUE
}

remove_task() {
    sed -i '1d' $QUEUE
}

list_all() {
    cat $QUEUE
}

get_first() {
    head -1 $QUEUE
}

clear_queue() {
    > $QUEUE
}

main "$@"
exit
