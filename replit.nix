{ pkgs }: {
  deps = [
    pkgs.libGLU
    pkgs.libGL
    pkgs.tesseract
    pkgs.poppler_utils
    pkgs.python38Full
  ];
  env = {
    PYTHON_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      # Neded for pandas / numpy
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
      # Needed for pygame
      pkgs.glib
      # Needed for matplotlib
      pkgs.xorg.libX11
      # Needed for opencv-python
      pkgs.libGL
    ];
    PYTHONBIN = "${pkgs.python38Full}/bin/python3.8";
    LANG = "en_US.UTF-8";
  };
}