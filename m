From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 06/10] clk: sunxi-ng: sun4i: Export video PLLs
Date: Tue, 17 Oct 2017 20:18:03 +0800
Message-ID: <20171017121807.2994-7-wens@csie.org>
References: <20171017121807.2994-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA7KS7HQKGQEC4Q6NVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171017121807.2994-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The video PLLs are used directly by the HDMI controller. Export them so
that we can use them in our DT node.

Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h      | 4 ++--
 include/dt-bindings/clock/sun4i-a10-ccu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.h b/drivers/clk/sunxi-ng/ccu-sun4i-a10.h
index c5947c7c050e..23c908ad509f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.h
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.h
@@ -29,7 +29,7 @@
 #define CLK_PLL_AUDIO_4X	6
 #define CLK_PLL_AUDIO_8X	7
 #define CLK_PLL_VIDEO0		8
-#define CLK_PLL_VIDEO0_2X	9
+/* The PLL_VIDEO0_2X clock is exported */
 #define CLK_PLL_VE		10
 #define CLK_PLL_DDR_BASE	11
 #define CLK_PLL_DDR		12
@@ -38,7 +38,7 @@
 #define CLK_PLL_PERIPH		15
 #define CLK_PLL_PERIPH_SATA	16
 #define CLK_PLL_VIDEO1		17
-#define CLK_PLL_VIDEO1_2X	18
+/* The PLL_VIDEO1_2X clock is exported */
 #define CLK_PLL_GPU		19
 
 /* The CPU clock is exported */
diff --git a/include/dt-bindings/clock/sun4i-a10-ccu.h b/include/dt-bindings/clock/sun4i-a10-ccu.h
index c5a53f38d654..e4fa61be5c75 100644
--- a/include/dt-bindings/clock/sun4i-a10-ccu.h
+++ b/include/dt-bindings/clock/sun4i-a10-ccu.h
@@ -43,6 +43,8 @@
 #define _DT_BINDINGS_CLK_SUN4I_A10_H_
 
 #define CLK_HOSC		1
+#define CLK_PLL_VIDEO0_2X	9
+#define CLK_PLL_VIDEO1_2X	18
 #define CLK_CPU			20
 
 /* AHB Gates */
-- 
2.14.2
