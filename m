From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/19] ARM: dts: renesas: Name pfc subnodes after device names
Date: Fri, 10 Jun 2016 15:00:46 +0200
Message-ID: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

Currently board DTS files use various naming conventions for the Pin
Function Controller subnodes.  This may cause conflicts when enabling
support for more instances later, either directly in board DT files, or
in DT overlays.  These conflicts are most likely to happen for devices
that use/require aliases (e.g. "serial1"), or when using generic and
indexless names (e.g. "mmc").  Hence this series changes the names of
(most of) the submodes, to match the corresponding device names, which
are unique on a specific SoC.

I did not change the following node names:
  - "sdX", as they always matched the corresponding "sdhiX" name,
  - "touchscreen", as there's not much opportunity for conflicts,
  - "mmc", for "mmcif_pins" on sh73a0/kzm9g (which has a single mmc
    instance),
  - "sounda" for fsia_pins on SH-Mobile,
If you think these should be changed too, please let me know.

This series is against renesas-devel-20160606-v4.7-rc2.

Thanks!

Geert Uytterhoeven (19):
  ARM: dts: ape6evm: Name serial port pfc subnode after device name
  ARM: dts: ape6evm: Name mmc pfc subnode after device name
  ARM: dts: armadillo800eva: Name serial port pfc subnode after device
    name
  ARM: dts: bockw: Name serial port pfc subnode after device name
  ARM: dts: marzen: Name serial port pfc subnodes after device names
  ARM: dts: lager: Name serial port pfc subnodes after device names
  ARM: dts: lager: Name spi pfc subnodes after device names
  ARM: dts: lager: Name vin pfc subnode after device name
  ARM: dts: koelsch: Name serial port pfc subnodes after device names
  ARM: dts: koelsch: Name spi pfc subnodes after device names
  ARM: dts: porter: Name serial port pfc subnode after device name
  ARM: dts: porter: Name spi pfc subnode after device name
  ARM: dts: gose: Name serial port pfc subnodes after device names
  ARM: dts: gose: Name spi pfc subnode after device name
  ARM: dts: alt: Name serial port pfc subnode after device name
  ARM: dts: alt: Name spi pfc subnode after device name
  ARM: dts: silk: Name serial port pfc subnode after device name
  ARM: dts: silk: Name spi pfc subnode after device name
  ARM: dts: kzm9g: Name serial port pfc subnode after device name

 arch/arm/boot/dts/r8a73a4-ape6evm.dts         |  4 ++--
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts |  2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           |  2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          |  4 ++--
 arch/arm/boot/dts/r8a7790-lager.dts           | 10 +++++-----
 arch/arm/boot/dts/r8a7791-koelsch.dts         |  8 ++++----
 arch/arm/boot/dts/r8a7791-porter.dts          |  4 ++--
 arch/arm/boot/dts/r8a7793-gose.dts            |  6 +++---
 arch/arm/boot/dts/r8a7794-alt.dts             |  4 ++--
 arch/arm/boot/dts/r8a7794-silk.dts            |  4 ++--
 arch/arm/boot/dts/sh73a0-kzm9g.dts            |  2 +-
 11 files changed, 25 insertions(+), 25 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
