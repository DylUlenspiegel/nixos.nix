let
  common = import ../common;
in
[
  ./launcher
  ./notice
  #./mpv
  ./wpaperd
] ++ common
