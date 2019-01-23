#!/bin/bash
read -p "Enter source, fold, cold, minTopic, maxTopic:" source fold cold min max
echo 
for ((k = $min; k <= $max; k = k + 10))
do
	./lda --directory ./fits/train_"$fold"/topic_"$k"/ --train_data /zf18/ll5fy/lab/dataset/"$source"/byUser_20k_review/CTR/train_"$fold".txt --num_topics $k --eta 0.01 --alpha 0.1 --max_iter 30  --max_time -1
	cp fits/train_$fold/topic_$k/iter@00030.topics initials/fold"$fold"_"$k".topics
	cp fits/train_$fold/topic_$k/iter@00030.doc.states initials/fold"$fold"_"$k".doc.states
done
