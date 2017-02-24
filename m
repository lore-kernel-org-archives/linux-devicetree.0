From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/2] arm64: dts: r8a7795: Add Cortex-A53 CPU cores and PMU
Date: Fri, 24 Feb 2017 14:59:26 +0100
Message-ID: <1487944768-31983-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series adds the Cortex-A53 CPU cores and PMU on the Renesas
R-Car H3 SoC to its DTS file.

Note that these patches describes the hardware; actual enabling of the
CPU depends on the PSCI firmware.

With the current firmware version (v2.16.0), only the CA57 CPU cores are
enabled, hence these patches do not introduce undeterministic scheduling
behavior due to migration between big and LITTLE cores.

Changes compared to v3:
  - Drop bogus links from the pmu_a57 node to the CA53 nodes,
  - Add Cortex-A53 PMU node.

Tested on r8a7795/salvator-x, with CPU hot(un)plug and system suspend.

Thanks for applying!

Geert Uytterhoeven (2):
  arm64: dts: r8a7795: Add Cortex-A53 CPU cores
  arm64: dts: r8a7795: Add Cortex-A53 PMU node

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 58 +++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
