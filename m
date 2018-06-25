From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 03/24] clk: sunxi-ng: r40: Export video PLLs
Date: Mon, 25 Jun 2018 14:02:43 +0200
Message-ID: <20180625120304.7543-4-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBYNUYPMQKGQE32KLCVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Video PLLs need to be referenced in R40 DT as possible HDMI PHY parent.

Export them.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h      | 8 ++++++--
 include/dt-bindings/clock/sun8i-r40-ccu.h | 4 ++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.h b/drivers/clk/sunxi-ng/ccu-sun8i-r40.h
index 0db8e1e97af8..db2a1243f9ff 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.h
@@ -25,7 +25,9 @@
 #define CLK_PLL_AUDIO_2X	4
 #define CLK_PLL_AUDIO_4X	5
 #define CLK_PLL_AUDIO_8X	6
-#define CLK_PLL_VIDEO0		7
+
+/* PLL_VIDEO0 is exported */
+
 #define CLK_PLL_VIDEO0_2X	8
 #define CLK_PLL_VE		9
 #define CLK_PLL_DDR0		10
@@ -34,7 +36,9 @@
 #define CLK_PLL_PERIPH0_2X	13
 #define CLK_PLL_PERIPH1		14
 #define CLK_PLL_PERIPH1_2X	15
-#define CLK_PLL_VIDEO1		16
+
+/* PLL_VIDEO1 is exported */
+
 #define CLK_PLL_VIDEO1_2X	17
 #define CLK_PLL_SATA		18
 #define CLK_PLL_SATA_OUT	19
diff --git a/include/dt-bindings/clock/sun8i-r40-ccu.h b/include/dt-bindings/clock/sun8i-r40-ccu.h
index 4fa5f69fc297..f9e15a235626 100644
--- a/include/dt-bindings/clock/sun8i-r40-ccu.h
+++ b/include/dt-bindings/clock/sun8i-r40-ccu.h
@@ -43,6 +43,10 @@
 #ifndef _DT_BINDINGS_CLK_SUN8I_R40_H_
 #define _DT_BINDINGS_CLK_SUN8I_R40_H_
 
+#define CLK_PLL_VIDEO0		7
+
+#define CLK_PLL_VIDEO1		16
+
 #define CLK_CPU			24
 
 #define CLK_BUS_MIPI_DSI	29
-- 
2.18.0
