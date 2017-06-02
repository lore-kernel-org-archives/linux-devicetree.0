From: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: ls1046a: Add dis_rxdet_inp3_quirk property to USB3 node
Date: Fri, 2 Jun 2017 10:30:00 +0800
Message-ID: <1496370600-31442-1-git-send-email-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tang Yuantian <Yuantian.Tang-3arQi8VN3Tc@public.gmane.org>, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mihai Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add "dis_rxdet_inp3_quirk" boolean property to USB3 node. This property
is used to disable rx detection in P3 PHY mode.

Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index f4b8b7e..9137280 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -567,6 +567,7 @@
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		usb1: usb@3000000 {
@@ -575,6 +576,7 @@
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		usb2: usb@3100000 {
@@ -583,6 +585,7 @@
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		sata: sata@3200000 {
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
