{
  stdenv
}:

stdenv.mkDerivation {
  pname = "plymouth-theme-nix";
  version = "0.0.1";
  src = ./.;

  installPhase = ''
    install -Dm644 usr/share/plymouth/themes/nix-splash/nix-splash.plymouth    $out/share/plymouth/themes/nix-splash/nix-splash.plymouth
    install -Dm644 usr/share/plymouth/themes/nix-splash/nix-splash.script      $out/share/plymouth/themes/nix-splash/nix-splash.script

    for img in usr/share/plymouth/themes/nix-splash/resources/*.png; do
      install -Dm644 "$img" $out/share/plymouth/themes/nix-splash/resources/$(basename "$img")
    done
  '';
}
