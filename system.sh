#!/bin/bash

#
function dataSystem() {
  # Date and time settings
  export _date=`date '+%Y-%m-%d %H:%M:%S'`
  export _day=`date '+%d'`
  export _month=`date '+%B'`
  export _year=`date '+%Y'`

  # Local folder path
  export _path=$(dirname ${0})

  # system Info
  export _author="Pires <https://github.com/apsantos-dev>"
  export _description="Visual Studio Code Extensions"
  export _license="The MIT License (MIT) <https://opensource.org/licenses/MIT>"
  export _version="1.0.0"

  # global git
  export _userName="Anderson Pires"
  export _userEmail="developer@apsantos.com.br"
  export _coreEditor="vi"
  export _origin="git@github.com:apsantos-dev/vscode-extensions.git"
  export _upstream="git@github.com:apsantos-dev/vscode-extensions.git"

  # colors status: 0 off, 1 on
  local _colorStatus=1

  # this file
  local _thisFile=${0##*/}

  # Set the colors for displaying information
  if [[ ${_colorStatus} != "0" ]]; then
    _bk="\e[5m"         # blink
    _be="\e[38;5;6m"    # blue
    _gy="\e[30;1m"      # gray
    _gn="\e[0;32m"      # green
    _pe="\e[0;35m"      # purple
    _rd="\e[0;31m"      # red
    _we="\e[1;37m"      # white
    _yw="\e[1;33m"      # yellow

    _de="\e[0;34m"      # darkBlue
    _dy="\e[30;1m"      # darkGray

    _lb="\e[34;1m"      # lightBlue
    _lg="\e[37m"        # lightGray
    _ln="\e[32;1m"      # lightGreen
    _lp="\e[1;35m"      # lightPurple
    _lr="\e[1;31m"      # lightRed

    _dm="\e[2m"         # dim
    _ed="\e[m"          # end
    _he="\e[8m"         # hide
    _ic="\e[3m"         # italic
    _ld="\e[2m"         # loading
    _ue="\e[4m"         # underline
  fi

  #
  clear

  #
  viewMessage "${_dm}Processing ... ${_ed}"

  #
  requestNewTask
}

#

#
function inGit() {
  #
  if ( ! inGitStart ); then
    errorFunction "Failed to start Git in project!"
  fi

  #
  requestNewTask

  #
  if ( ! inGitConfigGlobal ); then
    errorFunction "Failed to configure Git globally!"
  fi

  #
  requestNewTask

  #
  if ( ! inGitInitialCommit ); then
    errorFunction "Failed to initial commit Git!"
  fi

  # View message when the task is complete!
  feedbackTask "All tasks were successful!"
}

#
function inGitStart() {
  #
  validateMessage "Starting Git in the project"

  #
  rm -rf .git

  #
  git init

  #
  git remote add origin ${_origin}

  #
  git remote add upstream ${_upstream}

  #
  git checkout -b master

  #
  git fetch upstream

  #
  git merge upstream/master

  # View message when the task is complete!
  feedbackTask "Git has been started successfully!"
}

#
function inGitConfigGlobal() {
  #
  validateMessage "Configuring Git Globally"

  #
  git config --global user.name "${_userName}"
  git config --global user.email "${_userEmail}"
  git config --global core.editor "${_coreEditor}"

  # View message when the task is complete!
  feedbackTask "Git was configured successfully globally!"
}

# Initial commit of the system default files.
function inGitInitialCommit() {
  #
  validateMessage "Initial Commit Git"

  #
  # System Default Files
  defaultFiles=(
    "src/assets/doc/extensions.md"
    ".editorconfig"
    ".gitattributes"
    ".gitignore"
    "CHANGELOG.md"
    "CONTRIBUTING.md"
    "LICENSE"
    "README.md"
    "structure.md"
    "system.sh"
  )

  # Message for each file listed in the above variable: defaultFiles.
  defaultFilesMessage=(
    "These are extensions used in my day to day as a developer."
    "Sets the encoding styles for publishers."
    "Provides attributes for path names."
    "Specifies files that will not be monitored by Git."
    "All changes will be documented in this file."
    "Explain how a participant should do things."
    "Sets the type of license the project will have."
    "Project details have been added."
    "Current structure of files and folders."
    ".sh system for project management."
  )

  # count
  count=( 0 )

  # Commits each item in the array: defaultFiles.
  for x in "${defaultFiles[@]}"
    do
      git add ${x}
      git commit -m "${defaultFilesMessage[$count]}"

      count=$(( count + 1 ))
    done

  # Adds a new TAG to the project.
  git tag -a 1.0.0 -m "Release in: ${_month} ${_day}, ${_year}"

  # Send the new branch to the HOST.
  git push origin master -u

  # Send the TAGS to the HOST.
  git push origin --tags

  # View message when the task is complete!
  feedbackTask "The initial commit of the files was successful!"
}

#

#
function inHelp() {
  #
  validateMessage "General Commands Manual"

  #
  requestNewTask

  #
  cat << EOF

  $(echo -e "${_lg}General Commands Manual - ${_ic}${_lb}${_month} ${_day}, ${_year} ${_ed}")

  $(echo -e "${_lg}USAGE: ${_ed}")
    $(echo -e "$ ${_be}sh ${_thisFile} [options] ${_ed}")

  $(echo -e "${_lg}OPTIONS: ${_ed}")
    $(echo -e "${_be}-s            ${_lg}Start Git in the project and do initial commit${_ed}")
    $(echo -e "${_be}-h            ${_lg}Help System${_ed}")
    $(echo -e "${_be}-i            ${_lg}System Information ${_ed}")
    $(echo -e "${_be}-u            ${_lg}System update${_ed}")

    $(echo -e "${_ic}* The ${_be}'-u'${_ed}${_ic} option has not yet been implemented! ${_ed}")

  $(echo -e "${_lg}*************************************************************** ${_ed}")

EOF
}

#
function inInfo() {
  #
  validateMessage "System Information"

  #
  requestNewTask

  #
  cat << EOF

  $(echo -e "${_lg}System Information - ${_ic}${_lb}${_month} ${_day}, ${_year} ${_ed}")

  $(echo -e "${_be}Author: ${_lg}${_author}${_ed}")
  $(echo -e "${_be}Description: ${_lg}${_description}${_ed}")
  $(echo -e "${_be}License: ${_lg}${_license}${_ed}")
  $(echo -e "${_be}Version: ${_lg}${_version}${_ed}")

  $(echo -e "${_lg}*************************************************************** ${_ed}")

EOF
}

#
function inUpdate() {
  #
  validateMessage "System Update"

  #
  requestNewTask

  #
  cat << EOF

  $(echo -e "${_lg}System Update - ${_ic}${_lb}${_month} ${_day}, ${_year} ${_ed}")

  $(echo -e "${_ic}* The ${_be}'-u'${_ed}${_ic} option has not yet been implemented! ${_ed}")

  $(echo -e "${_lg}*************************************************************** ${_ed}")

EOF
}

#
function inInvalidOption() {
  #
  validateMessage "${_yw}Task Request Failed"

  #
  requestNewTask

  #
  cat << EOF

  $(echo -e "${_ld}${_yw}Task Request Failed - ${_ic}${_lb}${_month} ${_day}, ${_year} ${_ed}")

  $(echo -e "${_rd}The system did not find one of the parameters reported! \n  See the complete list using the ${_be}'-h'${_rd} parameter! ${_ed}")

  $(echo -e "${_lg}*************************************************************** ${_ed}")

EOF
}

#
function errorFunction() {
  #
  clear

  #
  viewMessage "${_rd}${@} ${_ed}"

  #
  exit 1
}

function feedbackTask() {
  #
  requestNewTask

  #
  viewMessage "${_gn}${@} ${_ed}"
}

#
function getColors() {
  viewMessage "${_bk}blink ${_ed}"
  viewMessage "${_be}blue ${_ed}"
  viewMessage "${_lg}gray ${_ed}"
  viewMessage "${_gn}green ${_ed}"
  viewMessage "${_pe}purple ${_ed}"
  viewMessage "${_rd}red ${_ed}"
  viewMessage "${_we}white ${_ed}"
  viewMessage "${_yw}yellow ${_ed}"
  viewMessage "${_de}darkBlue ${_ed}"
  viewMessage "${_dy}darkGray ${_ed}"
  viewMessage "${_lb}lightBlue ${_ed}"
  viewMessage "${_lg}lightGray ${_ed}"
  viewMessage "${_ln}lightGreen ${_ed}"
  viewMessage "${_lp}lightPurple ${_ed}"
  viewMessage "${_lr}lightRed ${_ed}"
  viewMessage "${_dm}dim ${_ed}"
  viewMessage "${_ed}end ${_ed}"
  viewMessage "${_he}hide ${_ed}"
  viewMessage "${_ic}italic ${_ed}"
  viewMessage "${_ld}loading ${_ed}"
  viewMessage "${_ue}underline ${_ed}"
}

#
function requestNewTask() {
  #
  sleep 1.5

  #
  clear
}

#
function validateMessage() {
  #
  if ( ! viewMessage "${_ld}${@} - Loading ... ${_ed}" ); then
    errorFunction "Failed to load task: ${@}!"
  fi
}

#
function viewMessage() {
  #
  echo -e "\n  ${@} \r \n"
}

#

# Configures the system global variables and sets whether there will be color
# in the information display
dataSystem ${@}

# Get options
while getopts ":hisu" flag; do
	case $flag in
    h) inHelp ;;
    i) inInfo ;;
    s) inGit ;;
    u) inUpdate ;;
    *) inInvalidOption ;;
  esac
# shift $(( OPTIND - 1 ))
done

# Checks if any parameter has been passed
[[ -z ${@} ]] && _defaultOption=1

# Performs a default task if no parameter is passed.
if [[ ${_defaultOption} == "1" ]]; then
  inHelp
fi
