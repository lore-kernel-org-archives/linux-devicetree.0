From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: keystone: add cell's information to spi nodes
Date: Mon, 28 Apr 2014 15:20:22 +0300
Message-ID: <1398687622-29880-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SPI nodes should always have #address-cells and #size-cells defined,
otherwise warnings will be produced in case of adding any child
nodes to the SPI bus in DT:
Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/spi@21000400/n25q128a11@0
Warning (avoid_default_addr_size): Relying on default #size-cells value for /soc/spi@21000400/n25q128a11@0

Hence, ensure that all SPIx nodes have #address-cells and #size-cells
properties defined.

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 7563934..905227f 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -131,6 +131,8 @@
 			ti,davinci-spi-intr-line = <0>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkspi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		spi1: spi@21000600 {
@@ -140,6 +142,8 @@
 			ti,davinci-spi-intr-line = <0>;
 			interrupts = <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkspi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		spi2: spi@21000800 {
@@ -149,6 +153,8 @@
 			ti,davinci-spi-intr-line = <0>;
 			interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkspi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		usb_phy: usb_phy@2620738 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
