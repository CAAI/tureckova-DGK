sleep 900
python run/run_training.py 3d_fullres nnUNetTrainer Task500_HNC01 0 --ndet --vnet=1
python run/run_training.py 3d_fullres nnUNetTrainer Task500_HNC01 1 --ndet --vnet=1
python run/run_training.py 3d_fullres nnUNetTrainer Task500_HNC01 2 --ndet --vnet=1
python run/run_training.py 3d_fullres nnUNetTrainer Task500_HNC01 3 --ndet --vnet=1
python run/run_training.py 3d_fullres nnUNetTrainer Task500_HNC01 4 --ndet --vnet=1