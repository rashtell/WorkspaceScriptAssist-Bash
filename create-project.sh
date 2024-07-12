#!/bin/bash

# Dependencies - pascal-case.sh

# Elevate the current console window to admin (Linux/MacOS require sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exec sudo "$0" "$@"
fi

# Set the current directory to the script's directory
cd "$(dirname "$0")"

# Change directory to the root of the current drive
cd /

# Get Inputs
workspace_path="/workspace"

# Project Inputs
projects_path="${workspace_path}/projects"
mkdir -p "$projects_path"

# Check if the projects path is empty
if [ -z "$(ls -A "$projects_path")" ]; then
  is_projects_path_empty=true
else
  is_projects_path_empty=false
fi

project_name=""

# Project input
input_project_name() {
  while [ -z "$project_name" ]; do
    read -rp "Enter project name: " project_name
    if [ -z "$project_name" ]; then
      echo "Project name cannot be empty. Please try again."
      echo
      if [ "$is_projects_path_empty" = true ]; then
        continue
      else
        list_projects
      fi
    fi

    project_name=$(./pascal-case.sh "$project_name")
  done
}

# List projects with indexes
list_projects() {
  echo "0. New Project"
  index=0
  for dir in "$projects_path"/*; do
    [ -d "$dir" ] && echo "$((++index)). $(basename "$dir")"
  done
  echo

  read -rp "Input the index of the project you want to select: " choice

  if [ "$choice" -eq 0 ]; then
    input_project_name
  elif [ "$choice" -ge 1 ]; then
    current_index=0
    for dir in "$projects_path"/*; do
      [ -d "$dir" ] && ((current_index++))
      if [ "$current_index" -eq "$choice" ]; then
        project_name=$(basename "$dir")
        break
      fi
    done
  else
    list_projects
  fi
}

if [ "$is_projects_path_empty" = true ]; then
  input_project_name
else
  list_projects
fi

if [ -z "$project_name" ]; then
  echo "Invalid project index. Please enter a valid index."
  echo
  input_project_name
fi

# Sub-project Inputs
sub_projects_path="${projects_path}/${project_name}"
mkdir -p "$sub_projects_path"

# Check if the sub-projects path is empty
if [ -z "$(ls -A "$sub_projects_path")" ]; then
  is_sub_projects_path_empty=true
else
  is_sub_projects_path_empty=false
fi

sub_project_name=""

# Sub-project input
input_sub_project_name() {
  while [ -z "$sub_project_name" ]; do
    read -rp "Enter sub-project name: " sub_project_name
    if [ -z "$sub_project_name" ]; then
      echo "Sub-project name cannot be empty. Please try again."
      echo
      if [ "$is_sub_projects_path_empty" = true ]; then
        continue
      else
        list_sub_projects
      fi
    fi

    sub_project_name=$(./pascal-case.sh "$sub_project_name")
  done
}

# List sub-projects with indexes
list_sub_projects() {
  echo "0. New Sub-project"
  index=0
  for dir in "$sub_projects_path"/*; do
    [ -d "$dir" ] && echo "$((++index)). $(basename "$dir")"
  done
  echo

  read -rp "Input the index of the sub-project you want to select: " choice

  if [ "$choice" -eq 0 ]; then
    input_sub_project_name
  elif [ "$choice" -ge 1 ]; then
    current_index=0
    for dir in "$sub_projects_path"/*; do
      [ -d "$dir" ] && ((current_index++))
      if [ "$current_index" -eq "$choice" ]; then
        sub_project_name=$(basename "$dir")
        break
      fi
    done
  else
    list_sub_projects
  fi
}

if [ "$is_sub_projects_path_empty" = true ]; then
  input_sub_project_name
else
  list_sub_projects
fi

if [ -z "$sub_project_name" ]; then
  echo "Invalid sub-project index. Please enter a valid index."
  echo
  input_sub_project_name
fi

# Organization Inputs
organizations_path="${workspace_path}/organizations"
mkdir -p "$organizations_path"

# Check if the organizations path is empty
if [ -z "$(ls -A "$organizations_path")" ]; then
  is_organizations_path_empty=true
else
  is_organizations_path_empty=false
fi

organization_name=""

# Organization input
input_organization_name() {
  while [ -z "$organization_name" ]; do
    read -rp "Enter organization name: " organization_name
    if [ -z "$organization_name" ]; then
      echo "Organization name cannot be empty. Please try again."
      echo
      if [ "$is_organizations_path_empty" = true ]; then
        continue
      else
        list_organizations
      fi
    fi

    organization_name=$(./pascal-case.sh "$organization_name")
  done
}

# List organizations with indexes
list_organizations() {
  echo "0. New Organization"
  index=0
  for dir in "$organizations_path"/*; do
    [ -d "$dir" ] && echo "$((++index)). $(basename "$dir")"
  done
  echo

  read -rp "Input the index of the organization you want to select: " choice

  if [ "$choice" -eq 0 ]; then
    input_organization_name
  elif [ "$choice" -ge 1 ]; then
    current_index=0
    for dir in "$organizations_path"/*; do
      [ -d "$dir" ] && ((current_index++))
      if [ "$current_index" -eq "$choice" ]; then
        organization_name=$(basename "$dir")
        break
      fi
    done
  else
    list_organizations
  fi
}

if [ "$is_organizations_path_empty" = true ]; then
  input_organization_name
else
  list_organizations
fi

if [ -z "$organization_name" ]; then
  echo "Invalid organization index. Please enter a valid index."
  echo
  input_organization_name
fi

# Platform Inputs
platforms_path="${workspace_path}/platforms"
mkdir -p "$platforms_path"

# Check if the platforms path is empty
if [ -z "$(ls -A "$platforms_path")" ]; then
  is_platforms_path_empty=true
else
  is_platforms_path_empty=false
fi

platform=""

# Platform input
input_platform() {
  while [ -z "$platform" ]; do
    read -rp "Enter platform name: " platform
    if [ -z "$platform" ]; then
      echo "Platform name cannot be empty. Please try again."
      echo
      if [ "$is_platforms_path_empty" = true ]; then
        continue
      else
        list_platforms
      fi
    fi

    platform=$(./pascal-case.sh "$platform")
  done
}

# List platforms with indexes
list_platforms() {
  echo "0. New Platform"
  index=0
  for dir in "$platforms_path"/*; do
    [ -d "$dir" ] && echo "$((++index)). $(basename "$dir")"
  done
  echo

  read -rp "Input the index of the platform you want to select: " choice

  if [ "$choice" -eq 0 ]; then
    input_platform
  elif [ "$choice" -ge 1 ]; then
    current_index=0
    for dir in "$platforms_path"/*; do
      [ -d "$dir" ] && ((current_index++))
      if [ "$current_index" -eq "$choice" ]; then
        platform=$(basename "$dir")
        break
      fi
    done
  else
    list_platforms
  fi
}

if [ "$is_platforms_path_empty" = true ]; then
  input_platform
else
  list_platforms
fi

if [ -z "$platform" ]; then
  echo "Invalid platform index. Please enter a valid index."
  echo
  input_platform
fi

# Language Inputs
languages_path="${workspace_path}/languages"
mkdir -p "$languages_path"

# Check if the languages path is empty
if [ -z "$(ls -A "$languages_path")" ]; then
  is_languages_path_empty=true
else
  is_languages_path_empty=false
fi

language=""

# Language input
input_language() {
  while [ -z "$language" ]; do
    read -rp "Enter language name: " language
    if [ -z "$language" ]; then
      echo "Language name cannot be empty. Please try again."
      echo
      if [ "$is_languages_path_empty" = true ]; then
        continue
      else
        list_languages
      fi
    fi

    language=$(./pascal-case.sh "$language")
  done
}

# List languages with indexes
list_languages() {
  echo "0. New Language"
  index=0
  for dir in "$languages_path"/*; do
    [ -d "$dir" ] && echo "$((++index)). $(basename "$dir")"
  done
  echo

  read -rp "Input the index of the language you want to select: " choice

  if [ "$choice" -eq 0 ]; then
    input_language
  elif [ "$choice" -ge 1 ]; then
    current_index=0
    for dir in "$languages_path"/*; do
      [ -d "$dir" ] && ((current_index++))
      if [ "$current_index" -eq "$choice" ]; then
        language=$(basename "$dir")
        break
      fi
    done
  else
    list_languages
  fi
}

if [ "$is_languages_path_empty" = true ]; then
  input_language
else
  list_languages
fi

if [ -z "$language" ]; then
  echo "Invalid language index. Please enter a valid index."
  echo
  input_language
fi

# Workspace structure
project_path="${projects_path}/${project_name}"
sub_project_path="${sub_projects_path}/${sub_project_name}"
organization_path="${organizations_path}/${organization_name}"
platform_path="${platforms_path}/${platform}"
language_path="${languages_path}/${language}"

# Output the final paths
echo "Project Path: $project_path"
echo "Sub-Project Path: $sub_project_path"
echo "Organization Path: $organization_path"
echo "Platform Path: $platform_path"
echo "Language Path: $language_path"
