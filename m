From: Tirumalesh Chalamarla <tchalamarla-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] GICv3: Add ITS entry to THUNDER dts
Date: Fri, 26 Jun 2015 12:12:23 -0700
Message-ID: <1435345943-31833-1-git-send-email-tchalamarla@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

The PCIe host controller uses MSIs provided by GICv3 ITS. Enable it on
Thunder SoCs by adding an entry to DT.

Signed-off-by: Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
index d8c0bdc..9cb7cf9 100644
--- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
@@ -376,10 +376,19 @@
 		gic0: interrupt-controller@8010,00000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			interrupt-controller;
 			reg = <0x8010 0x00000000 0x0 0x010000>, /* GICD */
 			      <0x8010 0x80000000 0x0 0x600000>; /* GICR */
 			interrupts = <1 9 0xf04>;
+
+			its: gic-its@8010,00020000 {
+				compatible = "arm,gic-v3-its";
+				msi-controller;
+				reg = <0x8010 0x20000 0x0 0x200000>;
+			};
 		};
 
 		uaa0: serial@87e0,24000000 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
