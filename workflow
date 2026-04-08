#prepare tiles #output tiles (jpgs) will be save in data/processed folder
conda activate samgeo_env
python jp2_to_tiles.py

#train
yolo detect train \
  model=yolov8n.pt \
  data=data.yaml \
  epochs=100 \
  imgsz=640 \
  batch=16 \
  device=0 \
  project=depot_project \
  name=v8_detection_baseline



#prediction
yolo detect predict \
  model=/home/yshao/truck/runs/detect/depot_project/v8_detection_baseline3/weights/best.pt \
  source=./data/processed/e_05191050_06_09600_4bd_2021_tiles \
  conf=0.25 \
  save_txt=True \
  save_conf=False \
  device=0
