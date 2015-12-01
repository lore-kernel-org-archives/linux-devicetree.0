From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: sun9i: Add Reduced Serial Bus
 controller device node to A80 dtsi
Date: Tue,  1 Dec 2015 13:47:24 +0800
Message-ID: <1448948845-28347-7-git-send-email-wens@csie.org>
References: <1448948845-28347-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7PI6SZAKGQE4IPVARY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1448948845-28347-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a device node for the Reduced Serial Bus (RSB)
controller and the defacto pinmux setting to the A80 dtsi.

Since there is only one possible pinmux setting for RSB, just
set it in the dtsi.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 80777a33ee78..dc666c69f6ab 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -900,6 +900,27 @@
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
+
+			r_rsb_pins: r_rsb {
+				allwinner,pins = "PN0", "PN1";
+				allwinner,function = "s_rsb";
+				allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+			};
+		};
+
+		r_rsb: i2c@08003400 {
+			compatible = "allwinner,sun8i-a23-rsb";
+			reg = <0x08003400 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apbs_gates 3>;
+			clock-frequency = <3000000>;
+			resets = <&apbs_rst 3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_rsb_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 };
-- 
2.6.2
