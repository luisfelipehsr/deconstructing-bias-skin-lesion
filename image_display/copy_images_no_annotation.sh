REPO_DIR="/work/luisfelipehsr/DT/deconstructing-bias-skin-lesion"
OUTPUT_DIR="without_annotation"

for image in '006cec2e-6ce2-4549-bffa-eadfcd1e9970' '008c19e8-a820-403a-930a-bc74a4053664' '01b56434-4dd9-4994-bcc5-0b70a36e415a' '01cc7c75-4498-43ab-b650-5553d0507f76' '0385fdea-9b37-4039-b10c-d3094f6afdfa' '03d00867-fe6d-47b5-9a14-3f03f736e69a' '041bf0ac-a841-4c4a-9f91-45f4b3b34671' '052e09c0-6747-4f72-8e71-96fcc489043a' '05d16b06-ffb2-40ab-b64a-299448999f72' '05f42ea0-fa18-47ba-80a7-e070307300bf' '062374a3-6ca1-48d2-aa3c-820053773b54' '0638126f-126f-4f53-befe-538ff87597c6' '065b3a2f-1af3-4ebd-a740-9e49f9c685db' '068ae297-8397-463e-927e-cb6693aeb8b5' '0693cf18-a4e1-408a-a5b2-f4cabfe169d3' '06bc1cfe-23a0-43a4-a01b-dfa10314bbb0' '06e1a29a-6307-4ec2-902e-b379d39d2101' '0716e0cf-3822-406e-bfb2-c064cd471019' '0717d112-a8e5-46c0-9ba5-902cd9fe8fe1' '07444c7a-580b-4494-a883-3b33361a24ac';
do
    for dir in 'pneumonia-bbox70-double' 'pneumonia-bbox70-single' 'pneumonia-masks' 'pneumonia-masks-combined';
    do
        mkdir -p "${OUTPUT_DIR}/${dir}";
        cp "${REPO_DIR}/${dir}/${image}.png" "${OUTPUT_DIR}/${dir}";
    done;

    mkdir -p "${OUTPUT_DIR}/train";
    cp "${REPO_DIR}/pneumonia/images/train/${image}.jpg" "${OUTPUT_DIR}/train/${image}.jpg";

    only_masks='pneumonia/images/only_masks'
    for dir in 'single_box' 'double_box';
    do
        mkdir -p "${OUTPUT_DIR}/${dir}"
        cp "${REPO_DIR}/${only_masks}/${dir}/${image}.png" "${OUTPUT_DIR}/${dir}/${image}.png"
    done;

    only_masks='pneumonia/images/center'
    for dir in '0.7' '0.9';
    do
        mkdir -p "${OUTPUT_DIR}/${dir}"
        cp "${REPO_DIR}/${only_masks}/${dir}/${image}.png" "${OUTPUT_DIR}/${dir}/${image}.png"
    done;

done;
