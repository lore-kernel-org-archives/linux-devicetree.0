From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v4] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node with unit name and no reg property
Date: Wed, 25 Oct 2017 13:40:42 -0200
Message-ID: <1508946042-17671-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following build warning is seen with W=1:

Warning (unit_address_vs_reg): Node /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has a unit name, but no reg property

Fix this warning by adding reg property from such node and, consequently, 
by adding the 'address-cells' and 'size-cells' values to the fec node to 
avoid the warnings below:

Warning (reg_format): "reg" property in /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
Warning (avoid_default_addr_size): Relying on default #size-cells value for /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Change since v3:
-remove from a group of patches
-add 'address-cells' and 'size-cells' values to the fec node
-change message log
 arch/arm/boot/dts/imx53-tx53.dtsi | 1 +
 arch/arm/boot/dts/imx53.dtsi      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
index 71b58b6..655d51a 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -226,6 +226,7 @@
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
+		reg = <0>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 		device_type = "ethernet-phy";
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index c937949..be487b1 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -770,6 +770,8 @@
 			};
 
 			fec: ethernet@63fec000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				compatible = "fsl,imx53-fec", "fsl,imx25-fec";
 				reg = <0x63fec000 0x4000>;
 				interrupts = <87>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
