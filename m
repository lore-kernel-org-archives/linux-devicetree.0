From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] arm64: dts: renesas: Break out R-Car H3 and M3-W SiP
Date: Wed, 19 Apr 2017 11:15:43 +0200
Message-ID: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi all,

Renesas R-Car H3 and M3-W are available as SoC (r8a779[56]) or SiP
(r8j779[56]).  The latter is an integrated package
("System-in-Package"), containing an SoC, RAM, and HyperFlash.

This patch series adds DT bindings for the SiPs, breaks out hardware
descriptions for the SiPs into separate .dtsi files, and migrates the
board-specific DTSes from the SoC-specific to the SiP-specific .dtsi
files.

The motivations for this are:
  - Provide a better description of the hardware hierarchy,
  - Share more DTS fragments (not that visible due to boilerplate and
    limited number of boards),
  - Some quirks may be SiP-specific.
    I believe this is the case for the limitation of RAVB Ethernet to
    10/100 Mbps on H3 ES1.0.

Questions (reiterated in the individual patches):
  - Do we need more compatible values, for different configurations?
    At least r8j7796 is available with either 2 GiB or 4 GiB of RAM,
    possibly using RAM parts from different vendors.
  - How are the different SiP versions named officially?
  - How should the .dtsi files be named?
  - Should the board-specific files be renamed from <soc>-<board>.dts to
    <sip>-<board>.dts?
    Probably not, as this would inconvenience downstream developers even
    more than the H3 ES1.x rename, and <soc> is not that incorrect.

DTB changes have been inspected using scripts/dtc/dtx_diff.
This has been tested on Salvator-X (both H3 and M3-W).

Thanks for your comments!

Geert Uytterhoeven (8):
  [RFC] dt-bindings: renesas: Document R-Car H3 and M3-W SiP DT bindings
  [RFC] arm64: dts: renesas: Add R-Car H3 SiP (4 x 1 GiB) support
  [RFC] arm64: dts: renesas: Add R-Car M3-W SiP (2 x 1 GiB) support
  [RFC] arm64: dts: renesas: Add R-Car M3-W SiP (2 x 2 GiB) support
  [RFC] arm64: dts: renesas: Migrate R-Car H3 Salvator-X to
    r8j7795-4x1g.dtsi
  [RFC] arm64: dts: renesas: Migrate R-Car M3-W Salvator-X to
    r8j7796-2x2g.dtsi
  [RFC] arm64: dts: renesas: Migrate H3ULCB to r8j7795-4x1g.dtsi
  [RFC] arm64: dts: renesas: Migrate M3ULCB to r8j7796-2x1g.dtsi

 Documentation/devicetree/bindings/arm/shmobile.txt | 16 +++++++---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 27 ++--------------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 27 ++--------------
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     | 17 ++--------
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 17 ++--------
 arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi      | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8j7796-2x1g.dtsi      | 26 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi      | 26 ++++++++++++++++
 8 files changed, 112 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8j7796-2x1g.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
