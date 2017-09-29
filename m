From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 01/14] clk: sunxi-ng: sun6i: Export video PLLs
Date: Fri, 29 Sep 2017 16:22:53 +0800
Message-ID: <20170929082306.16193-2-wens@csie.org>
References: <20170929082306.16193-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB54FXDHAKGQEAM2HUKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170929082306.16193-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 2x outputs of the 2 video PLL clocks are directly used by the
HDMI controller block.

Export them so they can be referenced in the device tree.

Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
2.14.2
