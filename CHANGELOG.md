# Changelog

All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

---
## [1.1.0](https://github.com/malanius/tmux-spotify-linux/compare/v1.0.0..v1.1.0) - 2026-02-07

### Bug Fixes

- make copy script executable - ([10932d8](https://github.com/malanius/tmux-spotify-linux/commit/10932d83ac2140d67f2ef526e57ec6e9a13f62f8)) - Michal Slota
- add mising single quote - ([5125a5f](https://github.com/malanius/tmux-spotify-linux/commit/5125a5f03a2dda9942f95889411122d643129364)) - Michal Slota
- use only one copy command - ([75be868](https://github.com/malanius/tmux-spotify-linux/commit/75be868e24aa8016d5d2804aa13fbf2f25d37bf9)) - Michal Slota
- return bus operations directly - ([74bbb17](https://github.com/malanius/tmux-spotify-linux/commit/74bbb17000c491835b5aaaa0d2071bc31798e3d6)) - Michal Slota
- use correct copy commands - ([1cdd85a](https://github.com/malanius/tmux-spotify-linux/commit/1cdd85a17948c1fdb2fbae05f0ac686ccf950227)) - Michal Slota
- fix artist line not showing up - ([141c58a](https://github.com/malanius/tmux-spotify-linux/commit/141c58a7910b958f41fb0228f3293a7469c513d7)) - Michal Slota

### Documentation

- update acknowledgements - ([7fd05fe](https://github.com/malanius/tmux-spotify-linux/commit/7fd05fe7dc759aed2a679ef03344eb98b439da0c)) - Malanius Privierre
- update changelog - ([5266d40](https://github.com/malanius/tmux-spotify-linux/commit/5266d405f0d146dd31de7795185d011483378edb)) - Michal Slota
- switch to cocogitto template for CHANGELOG - ([3db51a0](https://github.com/malanius/tmux-spotify-linux/commit/3db51a05dee549e31b0bea468decf2cf10d16503)) - Michal Slota
- update changelog - ([44cc4ba](https://github.com/malanius/tmux-spotify-linux/commit/44cc4ba247b469f77513e96d78a6f2656a4723dd)) - Michal Slota
- fix links in CHANGELOG - ([1abdc14](https://github.com/malanius/tmux-spotify-linux/commit/1abdc14ae49e045d0a2fe040cead17c545327669)) - Michal Slota

### Features

- add support for wl-copy - ([4d8b924](https://github.com/malanius/tmux-spotify-linux/commit/4d8b924f15d37e7e786a1d04eed7fbd40ae0b745)) - Michal Slota

### Miscellaneous Chores

- add missing shebangs - ([cc50e86](https://github.com/malanius/tmux-spotify-linux/commit/cc50e86f156fa3ff88e66fd2e0445c329bb7d10e)) - Michal Slota
- fix shellcheck issues - ([e9e6ed3](https://github.com/malanius/tmux-spotify-linux/commit/e9e6ed321c323dab849c129db71f2a06cfa9cfc2)) - Michal Slota
- format scripts with shfmt - ([afc7c18](https://github.com/malanius/tmux-spotify-linux/commit/afc7c189d7d5fc6c93ebef757fac1c396475ce23)) - Michal Slota

---
## [1.0.0] - 2024-03-16

### Bug Fixes

- get rid of 127 return code - ([94c8e69](https://github.com/malanius/tmux-spotify-linux/commit/94c8e699c1aee1f53898367e9c92a945f9a22f48)) - Malanius Privierre

### Documentation

- update README - ([d0ce282](https://github.com/malanius/tmux-spotify-linux/commit/d0ce2823e45e0024366bab74c421e18462d79cff)) - Malanius Privierre
- fix music menu image in README - ([66dba8b](https://github.com/malanius/tmux-spotify-linux/commit/66dba8be063a49078df0dcd7c6d66101e80b0bed)) - Malanius Privierre
- add correct branch to install with TPM - ([6434f7e](https://github.com/malanius/tmux-spotify-linux/commit/6434f7e17c257a95854cdf9d28714cd2ce4582a2)) - Malanius Privierre

### Features

- remove apple scripts - ([04b0ad4](https://github.com/malanius/tmux-spotify-linux/commit/04b0ad4ff2f9f31990a850246281cf1823828871)) - Malanius Privierre
- do not change PATH - ([2ea95ec](https://github.com/malanius/tmux-spotify-linux/commit/2ea95ecc9256ea000ac8a775cfa144f413f97d01)) - Malanius Privierre
- bind to empty 'S' instead of overwriting existing tmux binding - ([8cf4879](https://github.com/malanius/tmux-spotify-linux/commit/8cf4879d6702d312769a004bac932ea4e753b8bf)) - Malanius Privierre
- check if Spotify is running - ([cc22a45](https://github.com/malanius/tmux-spotify-linux/commit/cc22a45adc4812d0dedade48792a76b130303f40)) - Malanius Privierre
- read song metadata from d-bus - ([8a33f73](https://github.com/malanius/tmux-spotify-linux/commit/8a33f73bfbf1f6e95339f30b3b1fd0dd7676d889)) - Malanius Privierre
- add some space around menu title - ([aba2ef6](https://github.com/malanius/tmux-spotify-linux/commit/aba2ef6fb9480f1c7abe1eae3175212ac56e0371)) - Malanius Privierre
- get shuffle status from d-bus - ([990bad3](https://github.com/malanius/tmux-spotify-linux/commit/990bad3007d2cf61c693c0fa2452026e69012002)) - Malanius Privierre
- make toggle play/pause work - ([e26db72](https://github.com/malanius/tmux-spotify-linux/commit/e26db72dd93a4ed3f6a8c3236b0f6b895a449329)) - Malanius Privierre
- make track switching work - ([3d0be4c](https://github.com/malanius/tmux-spotify-linux/commit/3d0be4c0de9d6cebf6f61718bf784f08078a33a8)) - Malanius Privierre
- make shuffle toggle work - ([07365b8](https://github.com/malanius/tmux-spotify-linux/commit/07365b805a4d78340b620548dbf29f264cf189ea)) - Malanius Privierre
- display correct loop status - ([ab92c08](https://github.com/malanius/tmux-spotify-linux/commit/ab92c08744d5457abd3b166efda9fd90a0773902)) - Malanius Privierre
- make loop control work - ([a914dce](https://github.com/malanius/tmux-spotify-linux/commit/a914dce310d6d55833ecb23af80bddad1d08a8ba)) - Malanius Privierre
- make copy track URL work - ([79be2d4](https://github.com/malanius/tmux-spotify-linux/commit/79be2d41c1fab529caf41fe7d4d8cfd8ea6073aa)) - Malanius Privierre
- display non-supported podcasts in menu - ([ddffd1c](https://github.com/malanius/tmux-spotify-linux/commit/ddffd1ca3d515e94c87b90dd076adbf000d6f1dc)) - Malanius Privierre
- create podcasts-specific menu and controls - ([b4aece2](https://github.com/malanius/tmux-spotify-linux/commit/b4aece2bf54590cbea3e50456233a4cefdbbae47)) - Malanius Privierre

### Miscellaneous Chores

- **(main)** release 1.0.0 - ([3fb5f73](https://github.com/malanius/tmux-spotify-linux/commit/3fb5f7348ae37ae9237e20a3731c03a88c2d191c)) - github-actions[bot]
- setup linting and release - ([a805441](https://github.com/malanius/tmux-spotify-linux/commit/a805441c2b7b16f9abaca24e0f5b76686f582841)) - Malanius Privierre

### Refactoring

- extract not running menu to function - ([b4b0ab4](https://github.com/malanius/tmux-spotify-linux/commit/b4b0ab40200ee38e1d0b96d667fc12179f05d3c2)) - Malanius Privierre
- extract track menu to function - ([9f0383a](https://github.com/malanius/tmux-spotify-linux/commit/9f0383a65e400871f170f0198097283e068a2c1a)) - Malanius Privierre

### Ci

- try out release-please for a size - ([3ce4799](https://github.com/malanius/tmux-spotify-linux/commit/3ce47997526e925f442232cff35d2a96a8c8c9d0)) - Malanius Privierre

<!-- generated by git-cliff -->
