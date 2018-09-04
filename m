From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 07/11] dt-bindings: clock: sun50i-a64-ccu:
 Add PLL_VIDEO0 macro
Date: Tue,  4 Sep 2018 12:40:49 +0800
Message-ID: <20180904044053.15425-8-icenowy@aosc.io>
References: <20180904044053.15425-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBK42XDOAKGQEVESJP5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180904044053.15425-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Allwinner A64 HDMI PHY clock has PLL_VIDEO0 as a parent.

Include the macro on dt-bindings so-that the same can be used
while defining CCU clock phandles.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes for v4:
- Dropped PLL_VIDEO1
Changes for v3.1:
- none
Changes for v3:
- collect Rob r-w-b tag
Changes for v2:
- new patch

 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 4 +++-
 include/dt-bindings/clock/sun50i-a64-ccu.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index 061b6fbb4f95..a83951cf0224 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -27,7 +27,9 @@
 #define CLK_PLL_AUDIO_2X		4
 #define CLK_PLL_AUDIO_4X		5
 #define CLK_PLL_AUDIO_8X		6
-#define CLK_PLL_VIDEO0			7
+
+/* PLL_VIDEO0 exported for HDMI PHY */
+
 #define CLK_PLL_VIDEO0_2X		8
 #define CLK_PLL_VE			9
 #define CLK_PLL_DDR0			10
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index d66432c6e675..a8ac4cfcdcbc 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -43,6 +43,7 @@
 #ifndef _DT_BINDINGS_CLK_SUN50I_A64_H_
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
+#define CLK_PLL_VIDEO0		7
 #define CLK_PLL_PERIPH0		11
 
 #define CLK_BUS_MIPI_DSI	28
-- 
2.18.0
