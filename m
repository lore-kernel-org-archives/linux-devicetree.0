From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: sh73a0: Add MSIOF support
Date: Mon, 30 Nov 2015 15:16:50 +0100
Message-ID: <1448893012-8465-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series adds support for the 4 MSIOF channels on SH-Mobile
AG5.

It has been tested (TX only) using MSIOF1 on the CN21 test connector.
RX hasn't been tested, as there are one-directional buffers between the
real MSIOF interface on high-density connector CN8 and the CN21 test
connector.

Functionality-wise, this depends on the bindings in "[PATCH] spi:
sh-msiof: Add support for SH-Mobile AG5", and pinctrl in "[PATCH]
pinctrl: sh-pfc: sh73a0: Add MSIOF support".

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: sh73a0: Add MSIOF clocks
  ARM: shmobile: sh73a0: Add MSIOF device nodes

 arch/arm/boot/dts/sh73a0.dtsi            | 72 ++++++++++++++++++++++++++------
 include/dt-bindings/clock/sh73a0-clock.h |  6 ++-
 2 files changed, 65 insertions(+), 13 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
