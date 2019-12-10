REPO_DIR="/work/luisfelipehsr/DT/deconstructing-bias-skin-lesion"
OUTPUT_DIR="with_annotation"

for image in '0174c4bb-28f5-41e3-a13f-a396badc18bd' '01fa0f5e-00c3-41cb-b5c7-10600c8633ae' '040a0743-f663-4746-8224-f0e3bacc7ba5' '0499513a-5d48-4cf9-aac8-115e2a52fe1a' '0587782c-ac6b-4ae1-8ffb-ce894d09f75e' '05bb6f8d-453b-4e56-ae92-2600e058ba65' '05fe7d73-5c8c-4349-88c4-2071a00d6d81' '0637b804-e693-48d1-8716-f7c63ce6162a' '06d5a58d-baf1-4937-bfc3-00db1fb2b1be' '06e09ebb-cb5b-4c30-8d3a-67a6ec34692b' '06f5a38a-e4b1-4e5f-8c62-f48630a52504' '077780cb-eb05-478f-a7d7-f0576e4c34df' '0808c4af-9ed6-46e3-a936-2cafb0004e6a' '08307845-ccbd-4616-b8e9-58532a766dbe' '08f17660-dc61-4a5d-b6fb-10dacc1e20a2' '091cc2b7-8ba6-4fce-8ae2-7547117dbddf' '091d75a8-e23e-4cb8-af67-10cb314077ec' '0927e819-9640-487d-a04e-f5d4732dbe0a' '0a8d486f-1aa6-4fcf-b7be-4bf04fc8628b' '0a8efdc1-1dff-4d65-8948-c56a5d74a906';
do
    for dir in 'pneumonia-bbox70-double' 'pneumonia-bbox70-single' 'pneumonia-masks' 'pneumonia-masks-combined';
    do
        mkdir -p $dir;
        cp "${REPO_DIR}/${dir}/${image}.png" "${OUTPUT_DIR}/${dir}";
    done;

    mkdir -p train;
    cp "${REPO_DIR}/pneumonia/images/train/${image}.jpg" "${OUTPUT_DIR}/train/${image}.jpg";

    only_masks='pneumonia/images/only_masks'
    for dir in 'single_box' 'double_box';
    do
        mkdir -p "${dir}"
        cp "${REPO_DIR}/${only_masks}/${dir}/${image}.png" "${OUTPUT_DIR}/${dir}/${image}.png"
    done;
done;
