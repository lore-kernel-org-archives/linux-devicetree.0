From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: renesas: Add support for Salvator-XS with R-Car M3-W
Date: Mon, 30 Oct 2017 18:29:56 +0100
Message-ID: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series adds support for the version of the Salvator-XS
development board equipped with an R-Car M3-W SiP.

The DT was based on work for the Salvator-X and -XS boards with M3-W
resp. H3 SiPs.

This has been tested on Salvator-X with R-Car M3-W ES1.1.

Thanks!

Geert Uytterhoeven (3):
  ARM: shmobile: Document Renesas M3-W-based Salvator-XS board DT
    bindings
  soc: renesas: Identify R-Car M3-W ES1.1
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W

 Documentation/devicetree/bindings/arm/shmobile.txt |  2 +
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 58 ++++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c                  |  3 ++
 4 files changed, 64 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
