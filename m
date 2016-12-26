From: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Subject: [PATCH v2] ARM: dts: sunxi: Add num-cs for A20 spi nodes
Date: Mon, 26 Dec 2016 18:47:48 +0100
Message-ID: <20161226174748.17544-1-manu@bidouilliste.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The spi0 controller on the A20 have up to 4 CS (Chip Select) while the
others three only have 1.
Add the num-cs property to each node.
The current driver doesn't read this property but this is useful for
downstream user of DTS (FreeBSD for example).

Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
---

Changes in v2:
 * Explain that driver doesn't support this but that it is useful
 for downstream users of DTS.

 arch/arm/boot/dts/sun7i-a20.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 94cf5a1c7172..ed21982c81cb 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -871,6 +871,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 4;
 		};
 
 		spi1: spi@01c06000 {
@@ -885,6 +886,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		emac: ethernet@01c0b000 {
@@ -1037,6 +1039,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		ahci: sata@01c18000 {
@@ -1079,6 +1082,7 @@
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			num-cs = 1;
 		};
 
 		pio: pinctrl@01c20800 {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
