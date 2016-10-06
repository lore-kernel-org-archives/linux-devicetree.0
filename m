From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 6/9] ARM: dts: sun6i: Sort pinmux setting nodes
Date: Fri,  7 Oct 2016 00:06:26 +0800
Message-ID: <20161006160629.11198-7-wens@csie.org>
References: <20161006160629.11198-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC7N3G7QKGQEXOICRPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161006160629.11198-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The pinmux setting nodes for the A31 were added out of alphabetical
order. Sort them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 82 ++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index ce1960453a0b..c1b891e75f18 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -434,13 +434,48 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
-			uart0_pins_a: uart0@0 {
-				allwinner,pins = "PH20", "PH21";
-				allwinner,function = "uart0";
+			gmac_pins_gmii_a: gmac_gmii@0 {
+				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
+						"PA4", "PA5", "PA6", "PA7",
+						"PA8", "PA9", "PA10", "PA11",
+						"PA12", "PA13", "PA14",	"PA15",
+						"PA16", "PA17", "PA18", "PA19",
+						"PA20", "PA21", "PA22", "PA23",
+						"PA24", "PA25", "PA26", "PA27";
+				allwinner,function = "gmac";
+				/*
+				 * data lines in GMII mode run at 125MHz and
+				 * might need a higher signal drive strength
+				 */
+				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
+			gmac_pins_mii_a: gmac_mii@0 {
+				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
+						"PA8", "PA9", "PA11",
+						"PA12", "PA13", "PA14", "PA19",
+						"PA20", "PA21", "PA22", "PA23",
+						"PA24", "PA26", "PA27";
+				allwinner,function = "gmac";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			gmac_pins_rgmii_a: gmac_rgmii@0 {
+				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
+						"PA9", "PA10", "PA11",
+						"PA12", "PA13", "PA14", "PA19",
+						"PA20", "PA25", "PA26", "PA27";
+				allwinner,function = "gmac";
+				/*
+				 * data lines in RGMII mode use DDR mode
+				 * and need a higher signal drive strength
+				 */
+				allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
 			i2c0_pins_a: i2c0@0 {
 				allwinner,pins = "PH14", "PH15";
 				allwinner,function = "i2c0";
@@ -506,47 +541,12 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			gmac_pins_mii_a: gmac_mii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA8", "PA9", "PA11",
-						"PA12", "PA13", "PA14", "PA19",
-						"PA20", "PA21", "PA22", "PA23",
-						"PA24", "PA26", "PA27";
-				allwinner,function = "gmac";
+			uart0_pins_a: uart0@0 {
+				allwinner,pins = "PH20", "PH21";
+				allwinner,function = "uart0";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
-
-			gmac_pins_gmii_a: gmac_gmii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA4", "PA5", "PA6", "PA7",
-						"PA8", "PA9", "PA10", "PA11",
-						"PA12", "PA13", "PA14",	"PA15",
-						"PA16", "PA17", "PA18", "PA19",
-						"PA20", "PA21", "PA22", "PA23",
-						"PA24", "PA25", "PA26", "PA27";
-				allwinner,function = "gmac";
-				/*
-				 * data lines in GMII mode run at 125MHz and
-				 * might need a higher signal drive strength
-				 */
-				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-			};
-
-			gmac_pins_rgmii_a: gmac_rgmii@0 {
-				allwinner,pins = "PA0", "PA1", "PA2", "PA3",
-						"PA9", "PA10", "PA11",
-						"PA12", "PA13", "PA14", "PA19",
-						"PA20", "PA25", "PA26", "PA27";
-				allwinner,function = "gmac";
-				/*
-				 * data lines in RGMII mode use DDR mode
-				 * and need a higher signal drive strength
-				 */
-				allwinner,drive = <SUN4I_PINCTRL_40_MA>;
-				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-			};
 		};
 
 		timer@01c20c00 {
-- 
2.9.3
