From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W
Date: Wed,  4 May 2016 16:35:39 +0200
Message-ID: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Mike, Stephen,

This patch series adds initial support for the Clock Pulse Generator and
Module Standby and Software Reset modules on the Renesas R-Car M3-W
SoC:
  - Basic core clocks,
  - SCIF2 (console) module clock,
  - INTC-AP (GIC) module clock (disabled pending CLK_ENABLE_HAND_OFF).

Support for more core and module clocks will be added incrementally.

/sys/kernel/debug/clk/clk_summary output:

       clock            enable_cnt  prepare_cnt        rate   accuracy   phase
    ---------------------------------------------------------------------------
     scif                        1            1    14745600          0 0
     extalr                      0            0           0          0 0
     extal                       1            1    16666666          0 0
	cp                       0            0     8333333          0 0
	.main                    1            1    16666666          0 0
	   .pll4                 0            0  2399999904          0 0
	   .pll3                 0            0  3199999872          0 0
	   .pll2                 0            0  2399999904          0 0
	   .pll1                 1            1  3199999872          0 0
	      .pll1_div2         1            1  1599999936          0 0
		 cl              0            0    33333332          0 0
		 zx              0            0   799999968          0 0
		 zt              0            0   399999984          0 0
		 ztrd2           0            0   133333328          0 0
		 ztr             0            0   266666656          0 0
		 .s3             2            2   266666656          0 0
		    s3d4         1            1    66666664          0 0
		       scif2     2            2    66666664          0 0
		    s3d2         0            0   133333328          0 0
		    s3d1         2            2   266666656          0 0
		       intc-ap   1            1   266666656          0 0
		 .s2             0            0   399999984          0 0
		    s2d4         0            0    99999996          0 0
		    s2d2         0            0   199999992          0 0
		    s2d1         0            0   399999984          0 0
		 .s1             0            0   533333312          0 0
		    s1d4         0            0   133333328          0 0
		    s1d2         0            0   266666656          0 0
		    s1d1         0            0   533333312          0 0
		 .s0             0            0   799999968          0 0
		    s0d12        0            0    66666664          0 0
		    s0d8         0            0    99999996          0 0
		    s0d6         0            0   133333328          0 0
		    s0d4         0            0   199999992          0 0
		    s0d3         0            0   266666656          0 0
		    s0d2         0            0   399999984          0 0
		    s0d1         0            0   799999968          0 0
		 .pll1_div4      0            0   799999968          0 0
	   .pll0                 0            0  2999999880          0 0

For your convenience, I've pushed this series to the
topic/r8a7796-clk-v1 branch of
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git.

Integration with renesas-drivers-2016-04-26-v4.6-rc5, and minimal board
integration for testing is available in the topic/gen3-latest branch.

This has received minimal testing on r8a7796/salvator-x, and regression
testing on r8a7795/salvator-x (ES1.0 and ES1.1).

Thanks for your comments!

Geert Uytterhoeven (4):
  clk: renesas: cpg-mssr: Document r8a7796 support
  clk: renesas: Add r8a7796 CPG Core Clock Definitions
  clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code
  clk: renesas: cpg-mssr: Add support for R-Car M3-W

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   7 +-
 drivers/clk/renesas/Kconfig                        |   1 +
 drivers/clk/renesas/Makefile                       |   3 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 360 +--------------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c             | 192 +++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c                | 359 ++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |  43 +++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a7796-cpg-mssr.h       |  69 ++++
 10 files changed, 682 insertions(+), 359 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7796-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.h
 create mode 100644 include/dt-bindings/clock/r8a7796-cpg-mssr.h

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
