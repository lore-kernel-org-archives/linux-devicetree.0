From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 9/9] [DO NOT MERGE] ARM: dts: sun6i: Enable 7"
 LCD panel on Sinlinx SinA31s
Date: Fri,  7 Oct 2016 00:06:29 +0800
Message-ID: <20161006160629.11198-10-wens@csie.org>
References: <20161006160629.11198-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCXN3G7QKGQEO5KSGZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Sinlinx SinA31s comes with an optional 7" 1024x600 LCD panel with
capacitive touch panel that bolts on to the board.

Enable the display using a panel with close timings. This patch is more
of a proof of concept. The LCD panel has no markings whatsoever, and
the timings are not exactly the same, and as a result the display produces
glitch lines sometimes.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
index 6ead2f5c847a..2d5cf8c9a12f 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
@@ -63,6 +63,23 @@
 			gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
 		};
 	};
+
+	panel: panel {
+		compatible = "avic,tm070ddh03", "simple-panel";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
 };
 
 &ehci0 {
@@ -148,6 +165,19 @@
 	regulator-name = "vcc-gmac-phy";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd0_rgb888_pins>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
2.9.3
