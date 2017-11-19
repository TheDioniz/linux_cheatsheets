shopt -s extglob        # extend comparision functionalities in if statements - [[ ]]
shopt -s nocasematch    # ignore case of the letters in case and if statements

# Exit from the script immediately when command exit with ANY command
# finishes with exit code different than 0 - except loops and if statements
set -e

# multi line comment
: << EOC
All of these lines
are commented out
till the eoc - end of comment statement
EOC

# Variable mangling

# First arg which have to be setup - construct: ${1:-""}
MUST_HAVE_ARG=${1:?"If you didn't set 1st parameter, you would see this comment and program will exit immediately"}

# Default values, if second and third args not passed, construct: ${2:-""}
DEF_VAL1=${2:-"aliens will come for you soon"}
DEF_VAL2=${3:-"123456789"}

# Print if for testing purpose after launching the script
printf "\nFirst arg - MUST_HAVE_VAR=${MUST_HAVE_ARG}, Second arg DEF_VAL1=${DEF_VAL1}, Third arg DEF_VAL2=${DEF_VAL2}\n" $MUST_HAVE_ARG $DEF_VAL1 $DEF_VAL2


# Shortcut for if statements
# Take a look on the command separation wiht '\', this is how proper cut should look like (well, maybe without so long printf ;))
# Depending on your readibility of code choose test statements (only [[ ]]) or if statements (commented out)
[[ $DEF_VAL1 == "aliens will come for you soon" ]] \
		&& [[ $DEF_VAL2 ]] \
		&& printf "\n-------------\nYou lazy boy!, you did not even cahnged first and second argument..\n-------------\n" \
		|| printf "\n-------------\nWow, you are managed to pass all threearguments?!?! LEVEL UP!\n-------------\n"

: << 'EOC'
The same can be accomplished with following code
if [[ $DEF_VAL1 == "aliens will come for you soon" ]] && [[ $DEF_VAL2 ]]; then
	printf "\n-------------\nYou lazy boy!, you did not even cahnged first and second argument..\n-------------\n"
else
	printf "\n-------------\nWow, you are managed to pass all threearguments?!?! LEVEL UP!\n-------------\n"
fi
EOC

# Change suffix of the filename
# mv "${FILE_NAME}" "${FILE_NAME%.txt}.ascii"

read -p "Hello there, how are you? " MOOD
echo "You have entered: ${#MOOD} characters"

# Check count of the string in the MOOD variable

if [[ ${#MOOD} -ge 15 ]]; then
	echo -e "Seems like your talkative :)\n"

fi

# Below two if statements are checking the same - if val of MOOD variable is empty or white char
if [[ ! $MOOD ]]; then
	echo "! seems like MOOD variable is empty"
fi
if [[ -z $MOOD ]]; then
	echo "-z MOOD I confirm, it's empty"
fi


TEST_STRING="Some really useful data, yeah, it's very useful"
echo -e '--------------\n'
echo "Changing useful to awesome at first occurance: ${TEST_STRING/useful/awesome}"
echo '--------------'
echo '--------------'
echo "Changing useful to awesome at whole string: ${TEST_STRING//useful/awesome}"
echo '--------------'

TEST_STRING="shit shit fuck"
TEST_STRING=${TEST_STRING//shit/I love the world ohh...}
echo '--------------'
echo '--------------'
TEST_STRING=${TEST_STRING//fuck/and I am going to be a priest}
echo "${TEST_STRING}"
echo '--------------'


read -p "Ready to go further? [y/n] : " ANSWER

function check_answer() {
	local ANSWER=$1

	[[ $ANSWER == 'y' ]] || [[ $ANSWER == 'Y' ]] && echo "GREAT, LET'S GO!"
	[[ $ANSWER == 'n' ]] || [[ $ANSWER == 'N' ]] && echo "OK then... exitting." && exit 1

# More efficient way of checking the answer in case statement
: << 'EOC'
	case $ANSWER in
		[yY|yes|"yes sir"] ) echo "Let's get it started!" 
			;;
		[nN|no|"no sir"] ) echo "Understand. Exitting" 
			exit 1
			;;
		* ) echo "I have no idea what do you mean. I am closing the program." 
			exit 1 
			;;
	esac
EOC

}

check_answer $ANSWER
echo "Your answer is: $ANSWER"







