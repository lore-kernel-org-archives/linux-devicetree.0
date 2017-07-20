From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: renesas: Base R-Car D3 support
Date: Thu, 20 Jul 2017 14:28:58 +0200
Message-ID: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus, Rob, Mark, Catalin, Will,

This patch series adds base support for the Renesas R-Car D3 SoC and the
Renesas Draak development board.

It documents SoC and board specific DT compatible values, and adds a
Kconfig symbol.

Thanks!

Geert Uytterhoeven (3):
  ARM: shmobile: Document R-Car D3 SoC DT bindings
  ARM: shmobile: Document Renesas Draak board DT bindings
  arm64: renesas: Add Renesas R8A77995 Kconfig support

 Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
 arch/arm64/Kconfig.platforms                       | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
