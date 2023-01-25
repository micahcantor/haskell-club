# Installing Haskell

Unfortunately, getting the Haskell toolchain correctly installed and set up can be one of the most difficult parts of getting started with Haskell. I'll describe what I believe is the most robust way of installing Haskell on a Linux or MacOS machine. I don't have a Windows machine, so I have limited knowledge there. Although the Haskell compiler GHC does natively support Windows, the tooling is second-class, so if you are using Windows, I recommend installing Haskell on [WSL](https://learn.microsoft.com/en-us/windows/wsl/).

## ghcup

To start, you should install Haskell using [ghcup](https://www.haskell.org/ghcup/). In the terminal, run the following command:

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh 
```

This will download and execute the `ghcup` installation script. Follow the prompts from the script, for now select "No" to any optional installations.

Once the script completes, run `ghcup tui` in the terminal. In the UI, install the `recommended` versions of `hls` and `ghc`. Right now, these are versions `1.9.0.0` and `9.2.5` respectively. Afterwards, make sure those versions are set as in-use (shown by a double green checkmark).

You should now have a working installation of the three most important tools in the Haskell ecosystem: `ghc` is the Haskell compiler, `cabal` is the Haskell build tool, and `hls` is the language server for editor support. 

## VSCode and Project setup

Next we'll install Haskell support for VSCode to improve the ease of development. Install the [Haskell extension](https://marketplace.visualstudio.com/items?itemName=haskell.haskell) from the VSCode marketplace. We'll have to make a few adjustments to the settings to make sure this works properly.

Open you `settings.json` file and add the following item, with your appropriate version numbers:

```json
{
  "haskell.toolchain": {
    "ghc": "9.2.5",
    "hls": "1.9.0.0"
  }
}

```

The Haskell extension can auto-discover which version `ghc` and `hls` to use, but I find this sometimes fails, so this setting tells the extension explicitly which version we want to use.

Next, create a new folder, and within it, a new Haskell project with `cabal init --interactive`. Once you fill out the prompts, run the command `cabal run`. This will build and run the program executable.

## Troubleshooting

Whichever versions of GHC and HLS you choose to install, make sure the version of GHC is listed as `hls-powered` in the `ghcup` TUI. If this is not the case, you may get strange behavior.