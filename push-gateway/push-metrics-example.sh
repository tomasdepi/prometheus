echo "processing_time_seconds 120" | curl --data-binary @- http://localhost:9091/metrics/job/video_processing

cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/video_processing/instance/mp4_node1
# TYPE processing_time_seconds gauge
processing_time_seconds{quality="hd"} 120
# TYPE processed_videos_total gauge
processed_videos_total{quality="hd"} 10
# TYPE processed_bytes_total gauge
processed_bytes_total{quality="hd"} 4400
EOF

cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/video_processing/instance/mov_node1
# TYPE processing_time_seconds gauge
processing_time_seconds{quality="hd"} 400
# TYPE processed_videos_total gauge
processed_videos_total{quality="hd"} 250
# TYPE processed_bytes_total gauge
processed_bytes_total{quality="hd"} 96000
EOF

# POST Updates the metrics in the group and kept all other metrics in that group in place
cat <<EOF | curl -X POST --data-binary @- http://localhost:9091/metrics/job/video_processing/instance/mp4_node1
# TYPE processing_time_seconds gauge
processing_time_seconds{quality="hd"} 999
EOF

# PUT Replaces all metrics within the specified group with the metrics that were sent in PUT request
cat <<EOF | curl -X PUT --data-binary @- http://localhost:9091/metrics/job/video_processing/instance/mp4_node1
# TYPE processing_time_seconds gauge
processing_time_seconds{quality="hd"} 666
EOF

# DELETE Deletes all metrics within the specified group
curl -X DELETE http://localhost:9091/metrics/job/video_processing/instance/mp4_node1
