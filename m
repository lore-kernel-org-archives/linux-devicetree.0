From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 01/13] clk: sunxi-ng: sun6i: Export video PLLs
Date: Tue, 26 Sep 2017 14:59:07 +0800
Message-ID: <20170926065919.24446-2-wens@csie.org>
References: <20170926065919.24446-1-wens@csie.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170926065919.24446-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

The 2x outputs of the 2 video PLL clocks are directly used by the
HDMI controller block.

Export them so they can be referenced in the device tree.

Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h      | 8 ++++++--
 include/dt-bindings/clock/sun6i-a31-ccu.h | 4 ++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.h b/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
index 4e434011e9e7..27e6ad4133ab 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.h
@@ -27,7 +27,9 @@
 #define CLK_PLL_AUDIO_4X	4
 #define CLK_PLL_AUDIO_8X	5
 #define CLK_PLL_VIDEO0		6
-#define CLK_PLL_VIDEO0_2X	7
+
+/* The PLL_VIDEO0_2X clock is exported */
+
 #define CLK_PLL_VE		8
 #define CLK_PLL_DDR		9
 
@@ -35,7 +37,9 @@
 
 #define CLK_PLL_PERIPH_2X	11
 #define CLK_PLL_VIDEO1		12
-#define CLK_PLL_VIDEO1_2X	13
+
+/* The PLL_VIDEO1_2X clock is exported */
+
 #define CLK_PLL_GPU		14
 #define CLK_PLL_MIPI		15
 #define CLK_PLL9		16
diff --git a/include/dt-bindings/clock/sun6i-a31-ccu.h b/include/dt-bindings/clock/sun6i-a31-ccu.h
index 4482530fb6f5..c5d13340184a 100644
--- a/include/dt-bindings/clock/sun6i-a31-ccu.h
+++ b/include/dt-bindings/clock/sun6i-a31-ccu.h
@@ -43,8 +43,12 @@
 #ifndef _DT_BINDINGS_CLK_SUN6I_A31_H_
 #define _DT_BINDINGS_CLK_SUN6I_A31_H_
 
+#define CLK_PLL_VIDEO0_2X	7
+
 #define CLK_PLL_PERIPH		10
 
+#define CLK_PLL_VIDEO1_2X	13
+
 #define CLK_CPU			18
 
 #define CLK_AHB1_MIPIDSI	23
-- 
2.14.1

