{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "elixir";
  buildInputs = with pkgs; [
    elixir
  ];
}

