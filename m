From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 5/15] clk: sunxi-ng: sun5i: Export video PLLs
Date: Tue,  7 Mar 2017 09:56:24 +0100
Message-ID: <4bb77a9793d4ba25bf633eff6abe41910bb7fc3c.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUHL7HCQKGQEKROZ37A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The video PLLs are used directly by the HDMI controller. Export them so
that we can use them in our DT node.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun5i.h      | 6 ++++--
 include/dt-bindings/clock/sun5i-ccu.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.h b/drivers/clk/sunxi-ng/ccu-sun5i.h
index 8144487eb7ca..16f7aa92957e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun5i.h
+++ b/drivers/clk/sunxi-ng/ccu-sun5i.h
@@ -28,15 +28,17 @@
 #define CLK_PLL_AUDIO_4X	6
 #define CLK_PLL_AUDIO_8X	7
 #define CLK_PLL_VIDEO0		8
-#define CLK_PLL_VIDEO0_2X	9
+
+/* The PLL_VIDEO0_2X is exported for HDMI */
+
 #define CLK_PLL_VE		10
 #define CLK_PLL_DDR_BASE	11
 #define CLK_PLL_DDR		12
 #define CLK_PLL_DDR_OTHER	13
 #define CLK_PLL_PERIPH		14
 #define CLK_PLL_VIDEO1		15
-#define CLK_PLL_VIDEO1_2X	16
 
+/* The PLL_VIDEO0_2X is exported for HDMI */
 /* The CPU clock is exported */
 
 #define CLK_AXI			18
diff --git a/include/dt-bindings/clock/sun5i-ccu.h b/include/dt-bindings/clock/sun5i-ccu.h
index aeb2e2f781fb..81f34d477aeb 100644
--- a/include/dt-bindings/clock/sun5i-ccu.h
+++ b/include/dt-bindings/clock/sun5i-ccu.h
@@ -19,6 +19,9 @@
 
 #define CLK_HOSC		1
 
+#define CLK_PLL_VIDEO0_2X	9
+
+#define CLK_PLL_VIDEO1_2X	16
 #define CLK_CPU			17
 
 #define CLK_AHB_OTG		23
-- 
git-series 0.8.11
