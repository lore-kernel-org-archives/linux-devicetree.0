From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM: shmobile: Document and identify RZ/G1H and RZ/G1N
Date: Fri, 10 Mar 2017 14:48:26 +0100
Message-ID: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

Now the part numbers of the Renesas RZ/G1H and RZ/G1N are publicly
available, this patch series documents the DT bindings for these SoCs,
and adds support for identifying them.

Thanks!

Geert Uytterhoeven (4):
  ARM: shmobile: Document RZ/G1H SoC DT binding
  ARM: shmobile: Document RZ/G1N SoC DT binding
  soc: renesas: Identify RZ/G1H
  soc: renesas: Identify RZ/G1N

 Documentation/devicetree/bindings/arm/shmobile.txt |  4 ++++
 drivers/soc/renesas/renesas-soc.c                  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
