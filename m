From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: renesas: Add support for Salvator-XS
Date: Fri,  9 Jun 2017 13:43:45 +0200
Message-ID: <1497008629-3974-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

The Renesas Salvator-XS (Salvator-X 2nd version) development board can
be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
pin-compatible.

This patch series adds initial support for the Renesas Salvator-XS
development board equipped with an R-Car H3 ES2.0 SiP.  The support
level is similar to the existing support for Salvator-X with the same
SiP.  See below for exceptions.

The Salvator-XS board is similar but not identical to the already
supported Salvator-X board.  To avoid duplication, the common parts are
extracted first into its own .dtsi file.
Noteworthy differences are:
  - The main clock crystal ticks at a slightly different rate.
  - On R-Car H3 ES2.0, SATA no longer uses dedicated pins, but shares
    them with the second PCIe channel.  To cater for this, a MAX4888B
    multiplexer has been added to Salvator-XS.  As the default hardware
    configuration enables PCIe, I disabled SATA.
  - The Versaclock5 clock generator has been replaced by a similar
    member of the Versaclock6 family.  As the latter is not supported by
    Linux yet, I left it out.
  - The USB3.0 micro-B connector is replaced by a USB2.0 micro-AB
    connector (both are not yet supported, so no change is needed now).

Dependencies:
  - renesas-devel-20170608-v4.12-rc4,
  - "arm64: dts: salvator-x: Add missing index to PWM pinctrl subnode
    name".

For your convenience, I've pushed this series, its dependencies, and a
few related driver changes to the topic/r8a7795-salvator-xs branch of
the git repository at
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This has been tested on Salvator-XS with R-Car H3 ES2.0, and Salvator-X
with R-Car H3 ES1.0.

Thanks!

Geert Uytterhoeven (4):
  ARM: shmobile: Document Renesas H3-based Salvator-XS board DT bindings
  arm64: dts: renesas: Extract common Salvator-X/XS board support
  arm64: dts: renesas: Add common Salvator-XS board support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3 ES2.0

 Documentation/devicetree/bindings/arm/shmobile.txt |   2 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 109 ++++
 .../{salvator-x.dtsi => salvator-common.dtsi}      |  17 +-
 arch/arm64/boot/dts/renesas/salvator-x.dtsi        | 616 +--------------------
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |  20 +
 6 files changed, 134 insertions(+), 631 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
 copy arch/arm64/boot/dts/renesas/{salvator-x.dtsi => salvator-common.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-xs.dtsi

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
