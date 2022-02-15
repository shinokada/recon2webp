fn_resize(){

    if [[ -z "${DIR}" ]]; then
        echo "Please specify an input directory."
        exit 1
    elif [[ -z "${WIDTH}" ]]; then
        echo "Please specify image width."
        exit 1
    elif [[ "${HEIGHT}" ]]; then
        DIMENSION="${WIDTH}x${HEIGHT}"
    else
        DIMENSION="${WIDTH}x"
    fi

    mkdir "${DIR}/resized"

    # for each webp in the input directory
    for img in $( find ${DIR} -type f -iname "*.webp" );
    do
        # resize first
        convert "${img}" -resize "${DIMENSION}" "${DIR}/resized/${img}"
    done

}