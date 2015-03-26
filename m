From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/5] ARM: dts: sun7i: Add A20 SRAM and SRAM controller
Date: Thu, 26 Mar 2015 15:53:44 +0100
Message-ID: <1427381625-6942-5-git-send-email-hdegoede@redhat.com>
References: <1427381625-6942-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427381625-6942-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The A20 has a few SRAM that can be mapped either to a device or to the CPU,
with the mapping being controlled by a SRAM controller.

Since most of the time these SRAM won't be accessible by the CPU,
we can't use the mmio-sram driver and compatible.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Do not change soc node name, change compatible to
 sun4i-a10-sram-controller to match the driver change]
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 465a19f..e6f4a33 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -529,12 +529,46 @@
 		};
 	};
 
+	/*
+	 * Note we use the address where the mmio registers start, not where
+	 * the SRAM blocks start, this cannot be changed because that would be
+	 * a devicetree ABI change.
+	 */
 	soc@01c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
+		sram@00000000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00000000 0x4000>;
+			allwinner,sram-name = "A1";
+		};
+
+		sram@00004000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00004000 0x4000>;
+			allwinner,sram-name = "A2";
+		};
+
+		sram@00008000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00008000 0x4000>;
+			allwinner,sram-name = "A3-A4";
+		};
+
+		sram@00010000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00010000 0x1000>;
+			allwinner,sram-name = "D";
+		};
+
+		sram-controller@01c00000 {
+			compatible = "allwinner,sun4i-a10-sram-controller";
+			reg = <0x01c00000 0x30>;
+		};
+
 		nmi_intc: interrupt-controller@01c00030 {
 			compatible = "allwinner,sun7i-a20-sc-nmi";
 			interrupt-controller;
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
