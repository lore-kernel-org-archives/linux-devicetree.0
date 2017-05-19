From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM: dts: rcar-gen2: Stop grouping clocks under a "clocks" subnode
Date: Fri, 19 May 2017 11:14:12 +0200
Message-ID: <1495185256-26674-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

The current practice is to not group clocks under a "clocks" subnode,
but just put them together with the other on-SoC devices.

Hence this patch series implements this for the various R-Car Gen2
DTSes that still need this (r8a7792.dtsi is OK).

As this depends on "[PATCH 0/5] ARM: dts: rcar-gen2: Convert to new
CPG/MSSR bindings", it cannot be applied yet, but it's never too early
to gather Acked-by's ;-)

Thanks!

Geert Uytterhoeven (4):
  ARM: dts: r8a7790: Stop grouping clocks under a "clocks" subnode
  ARM: dts: r8a7791: Stop grouping clocks under a "clocks" subnode
  ARM: dts: r8a7793: Stop grouping clocks under a "clocks" subnode
  ARM: dts: r8a7794: Stop grouping clocks under a "clocks" subnode

 arch/arm/boot/dts/r8a7790.dtsi | 137 ++++++++++++++++++++---------------------
 arch/arm/boot/dts/r8a7791.dtsi | 137 ++++++++++++++++++++---------------------
 arch/arm/boot/dts/r8a7793.dtsi | 125 ++++++++++++++++++-------------------
 arch/arm/boot/dts/r8a7794.dtsi | 124 ++++++++++++++++++-------------------
 4 files changed, 251 insertions(+), 272 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
