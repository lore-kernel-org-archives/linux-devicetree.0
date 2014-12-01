From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] ARM: BCM5301X: Add IRQs to Broadcom's bus-axi in DTS file
Date: Mon,  1 Dec 2014 22:51:07 +0100
Message-ID: <1417470667-15679-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IRQ support for Broadcom's bus-axi driver bcma was merged into John
Linville's wireless tree and will show up in 3.19. This patch makes use
of this feature in the DTS file for the the BCM5301X SoCs. I left the
PCIe controller out, because this still needs some discussion.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 arch/arm/boot/dts/bcm5301x.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 6d80922..b7c4e9e 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -101,6 +101,40 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0x000fffff 0xffff>;
+		interrupt-map = 
+			/* ChipCommon */
+			<0x00000000 0 &gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* USB 2.0 Controller */
+			<0x00021000 0 &gic GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* USB 3.0 Controller */
+			<0x00023000 0 &gic GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 0 */
+			<0x00024000 0 &gic GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 1 */
+			<0x00025000 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 2 */
+			<0x00026000 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 3 */
+			<0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* NAND Controller */
+			<0x00028000 0 &gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 1 &gic GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 2 &gic GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 3 &gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 4 &gic GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 5 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 6 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00028000 7 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+
 		chipcommon: chipcommon@0 {
 			reg = <0x00000000 0x1000>;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
