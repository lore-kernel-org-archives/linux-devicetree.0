From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] ARM: sun8i: a83t: cubietruck-plus: Add LED
 device nodes
Date: Mon, 22 May 2017 12:03:34 +0800
Message-ID: <20170522040334.26353-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGWGRHEQKGQE3HLNPUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Cubietruck Plus has 4 LEDs in different colors.
Add device nodes for them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index d2614f101ecc..9e10cc6f39d4 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -45,6 +45,8 @@
 /dts-v1/;
 #include "sun8i-a83t.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Cubietech Cubietruck Plus";
 	compatible = "cubietech,cubietruck-plus", "allwinner,sun8i-a83t";
@@ -56,6 +58,30 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		blue {
+			label = "cubietruck-plus:blue:usr";
+			gpios = <&pio 3 25 GPIO_ACTIVE_HIGH>; /* PD25 */
+		};
+
+		orange {
+			label = "cubietruck-plus:orange:usr";
+			gpios = <&pio 3 26 GPIO_ACTIVE_HIGH>; /* PD26 */
+		};
+
+		white {
+			label = "cubietruck-plus:white:usr";
+			gpios = <&pio 3 27 GPIO_ACTIVE_HIGH>; /* PD27 */
+		};
+
+		green {
+			label = "cubietruck-plus:green:usr";
+			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+		};
+	};
 };
 
 &uart0 {
-- 
2.11.0
