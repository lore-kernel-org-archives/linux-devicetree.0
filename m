From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [linux-sunxi][PATCH] ARM: dts: sun7i: Add I2S0 pinctrl settings
Date: Sat, 22 Jul 2017 08:43:13 +0200
Message-ID: <20170722064313.7535-1-codekipper@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The A20 SoC has a couple of i2s blocks. This patch adds
the pinctrl settings for block i2s0.

Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 96bee776e145..01f9ee329913 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1163,6 +1163,31 @@
 				function = "i2c3";
 			};
 
+			i2s0_mclk: i2s0@0 {
+				pins = "PB5";
+				function = "i2s0";
+			};
+
+			i2s0_bclk: i2s0@1 {
+				pins = "PB6";
+				function = "i2s0";
+			};
+
+			i2s0_lrclk: i2s0@2 {
+				pins = "PB7";
+				function = "i2s0";
+			};
+
+			i2s0_sdo0: i2s0@3 {
+				pins = "PB8";
+				function = "i2s0";
+			};
+
+			i2s0_sdi: i2s0@4 {
+				pins = "PB12";
+				function = "i2s0";
+			};
+
 			ir0_rx_pins_a: ir0@0 {
 				pins = "PB4";
 				function = "ir0";
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
