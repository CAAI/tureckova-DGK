# be in folder 
# ~/project_scripts/hnc_segmentation/tureckova_vnet/Abdomen-CT-Image-Segmentation/nnunet
# or
# ~/project_scripts/hnc_segmentation/tureckova/Abdomen-CT-Image-Segmentation/nnunet


python inference/predict_simple.py -i INPUT_FOLDER -o OUTPUT_FOLDER_lowres_vnet0 -t Task500_HNC01 -tr nnUNetTrainer -m 3d_lowres --vnet=0
python inference/predict_simple.py -i INPUT_FOLDER -o OUTPUT_FOLDER_lowres_vnet1 -t Task500_HNC01 -tr nnUNetTrainer -m 3d_lowres --vnet=1
python inference/predict_simple.py -i INPUT_FOLDER -o OUTPUT_FOLDER_fullres_vnet0 -t Task500_HNC01 -tr nnUNetTrainer -m 3d_fullres --vnet=0
python inference/predict_simple.py -i INPUT_FOLDER -o OUTPUT_FOLDER_fullres_vnet1 -t Task500_HNC01 -tr nnUNetTrainer -m 3d_fullres --vnet=1

INPUT_FOLDER='/homes/kovacs/project_data/hnc-auto-contouring/nnUNet/nnUNet_raw_data_base/nnUNet_raw_data/Task500_HNC01/imagesTr'
OUTPUT_FOLDER_lowres_vnet0 ='/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models/nnUNet/3d_lowres/Task500_HNC01/nnUNetTrainer__nnUNetPlans/pred_niftis_dgk'
OUTPUT_FOLDER_fullres_vnet0 ='/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models/nnUNet/3d_fullres/Task500_HNC01/nnUNetTrainer__nnUNetPlans/pred_niftis_dgk'

OUTPUT_FOLDER_lowres_vnet1 ='/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models_vnet/nnUNet/3d_lowres/Task500_HNC01/nnUNetTrainer__nnUNetPlans/pred_niftis_dgk'
OUTPUT_FOLDER_fullres_vnet1 ='/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models_vnet/nnUNet/3d_fullres/Task500_HNC01/nnUNetTrainer__nnUNetPlans/pred_niftis_dgk'

# then do the ensemble models of tureckova
# python inference/ensemble_predictions.py -f FOLDER1 FODLER2 ... -o OUTPUT_FOLDER 
# becomes the following to run
python inference/ensemble_predictions.py -f OUTPUT_FOLDER_lowres_vnet0 OUTPUT_FOLDER_fullres_vnet0 ... -o OUTPUT_FOLDER_vnet0
python inference/ensemble_predictions.py -f OUTPUT_FOLDER_lowres_vnet1 OUTPUT_FOLDER_fullres_vnet1 ... -o OUTPUT_FOLDER_vnet1
OUTPUT_FOLDER_vnet0 = '/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models/nnUNet/ensemble/pred_niftis_dgk'
OUTPUT_FOLDER_vnet1 = '/homes/kovacs/project_data/hnc-auto-contouring/tureckova/nnUNet_trained_models_vnet/nnUNet/ensemble/pred_niftis_dgk'

# then get which ever has the best performing dice score and use on the testdataset to compare against nnUNet, deepmedic and the others.
