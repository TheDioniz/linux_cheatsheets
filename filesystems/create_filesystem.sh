#!/usr/bin/env bash
: << 'EOC'
vgs
lvcreate -L 2 G -n new_logical_volume vol_group
mkfs.ext4 new_logical_volume
mkdir -p mount_dir
mount /dev/vol_group/new_logical_volume mount_dir
save in /etc/fstab

EOC


# Create hash table for jboss filesystems
declare -A jboss_filesystems
jboss_filesystems=( ["var_log_jbosslv"]="2048" ["var_log_javadumplv"]="512" ["opt_jbosslv"]="5120" ["opt_jboss_instanceslv"]="10240" )

# Name of volume group from which place will be taken for FS creation
VGS_NAME="appvg"


function check_vgs_space() {
	
	# Check how much space is available on volume group
	local VGS_SPACE=$( $(vgs "$VGS_NAME") awk '{ print $6 }' | grep -vi "vfree" )
	echo "Found ${VGS_SPACE} of place in ${VGS_NAME}"

	# Scale down to MB
	VGS_SPACE=$(( ${VGS_SPACE} * 1024 ))

	# Will have to return the value in MB
	return ${VGS_SPACE}
}

function count_needed_space_for_filesystems() {
	# As a parameter takes hash table of filesystems
	# Will return sum of necessary space in MB
	local sum=0

	for lv_space in "${jboss_filesystems[@]}"
	do
		sum=$(( $sum+${lv_space} ))
	done
	echo "Sum is $sum"
	return ${sum}

}

function is_enough_space_in_vgs() {
	local NEEDED_FOR_FS=count_needed_space_for_filesystems
	local VGS_SPACE=check_vgs_space

    local SPACE_LEFT=$(( ${VGS_SPACE} - ${NEEDED_FOR_FS} ))	

	if [[ "${SPACE_LEFT}" -le "0" ]]; then
		echo "There is NOT enough space in ${VGS_NAME}"
		echo "You need at least ${NEEDED_FOR_FS} MB of free space on vgroup"
		return 1 # or exit 1 ??
	fi
	
	return 0
	# return 0 if enough, 1 if not enough
}

function save_to_etc_fstab() {
	:
}

# Main part of the script

ENOUGH=is_enough_space_in_vgs

if [[ "${ENOUGH}" -ne "0" ]]; then
	echo "There is NOT enough space in ${VGS_NAME}"
	echo "You need at least ${NEEDED_FOR_FS} MB of free space on vgroup"
	exit 1
elif [[ "${ENOUGH}" -eq "0" ]]; then
	
	# iterate over lv names (keys) in hash table
	for lv_name in "${!jboss_filesystems[@]}"
	do
		#echo "LV name: $lv_name, FS capacity: ${jboss_filesystems[$lv_name]}"
		#lvcreate -L "${jboss_filesystems[$lv_name]}" -n "${lv_name}" "${VGS_NAME}"
		#mkfs.ext4 "${lv_name}"
		lv_name_dir="${lv_name%lv}"
		lv_name_dir="/${lv_name_dir//_//}"
		#mkdir -p ${lv_name_dir}
		#mount /dev/${VGS_NAME}/${lv_name} ${lv_name_dir}
		#save_to_etc_fstab
	done
	
fi



