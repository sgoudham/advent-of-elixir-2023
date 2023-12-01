{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "elixir-shell";
  buildInputs = with pkgs; [
    elixir
  ];
}

