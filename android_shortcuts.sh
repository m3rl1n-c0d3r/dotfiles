alias lc="adb logcat"
alias android_installed='adb shell "pm list packages -f" | cut -f 2 -d "=" | sort'
alias adb_refresh='adb shell am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///sdcard'

alias adb_home='adb shell input keyevent 3'
alias adb_back='adb shell input keyevent 4'
alias adb_power='adb shell input keyevent 26'
alias adb_recents='adb shell input keyevent KEYCODE_APP_SWITCH'
alias adb_notification_open='adb shell service call statusbar 1'
alias adb_notification_close='adb shell service call statusbar 2'
shot()
{
  adb shell screencap -p /sdcard/screen.png
  adb pull /sdcard/screen.png
  adb shell rm /sdcard/screen.png
  if [ $# -eq 1 ]; then
    mv screen.png $1.png
  else
    open screen.png
  fi
}

pull()
{
  adb pull "$1"
}

push()
{
  adb push "$1" "/sdcard/$(basename "$1")"
}

kbd()
{
  adb shell input text "'$@'"
}

adb_launch()
{
  for a in "$@"; do
    adb shell monkey -p $a -c android.intent.category.LAUNCHER 1
  done
}
export ANDROID_HOME=~/Library/Android/sdk
