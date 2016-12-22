override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_${ResetColor}[${BoldRed}${USER}${ResetColor}@${Green}${HOSTNAME%%.*}${ResetColor}:${Yellow}${PathShort}${ResetColor}]"

  GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_${ResetColor}[${BoldRed}${USER}${ResetColor}@${Green}${HOSTNAME%%.*}:${Yellow}${PathShort}${ResetColor}]"
  GIT_PROMPT_END_ROOT="#${ResetColor} "
  GIT_PROMPT_END_USER="#${ResetColor} "
}

# load the theme
reload_git_prompt_colors "Custom"
