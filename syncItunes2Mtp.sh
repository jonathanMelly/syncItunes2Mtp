#/bin/bash
VOLUME="fairphone" #volume name for MTP mount (label of disk)
MOUNT_POINT="/mnt/mtp" #place to mount the MTP enabled device

OUTPUT="${MOUNT_POINT}/FAIREXT16/audio/" #target root folder on MTP device
OUTPUT_MUSIC="${OUTPUT}Music/"
OUTPUT_OTHER="${OUTPUT}specialAudioContent/"

INPUT_MUSIC="/Users/${USER}/Music/music/" # iTunes Media/Music folder (here I used a symlink)
INPUT_OTHER="/Users/${USER}/Music/specialAudioContent/" # Other audio folder

#force ctr-c to stop ALL
trap "exit" INT

if [ ! -e "${OUTPUT}" ]
then
	echo "Mounting MTP with osxFuse and mtpfs"
	simple-mtpfs -f -o volname="${VOLUME}" "${MOUNT_POINT}" &
fi

read -p "Press enter to start RSYNC"
if [ -e "${OUTPUT_MUSIC}" ]
then
	#put/refresh to avoid android scan because it would be inconsistent without M4a support...
	touch "${OUTPUT}.nomedia"
	
	echo "Sync started $(date)"
	echo "Task: music"
	rsync -rh --size-only --progress --delete-after "${INPUT_MUSIC}" "${OUTPUT_MUSIC}"
	
	echo "Task: playlist"
	java -jar /Applications/iTunesExportScala-2.2.2/itunesexport.jar -fileTypes=ALL -musicPath=../ -outputDir="${OUTPUT_MUSIC}"
	
	echo "Task: other"
	rsync -rh --size-only --progress --delete-after "${INPUT_OTHER}" "${OUTPUT_OTHER}"
else
	echo "Error : ${OUTPUT_MUSIC} does not exist (check mounted volume content...)"
fi

echo "Sync done $(date)"
#umount "${MOUNT_POINT}"