override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_START_USER="${BoldRed}${USER}${ResetColor}@${Green}${HOSTNAME%%.*}:${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_START_ROOT="${BoldRed}${USER}${ResetColor}@${Green}${HOSTNAME%%.*}:${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_END_ROOT="#${ResetColor} "
  GIT_PROMPT_END_USER="#${ResetColor} "
  GIT_PROMPT_SYMBOLS_AHEAD="↑"
  GIT_PROMPT_SYMBOLS_BEHIND="↓"
  GIT_PROMPT_CONFLICTS="${Red}✖"
  GIT_PROMPT_CHANGED="${Blue}✚"
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="✭"
}

# load the theme
reload_git_prompt_colors "Custom"
