From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] ARM64: dts: meson-gx: consistently use the GIC_SPI and IRQ type macros
Date: Sun, 16 Jul 2017 16:11:45 +0200
Message-ID: <20170716141145.30295-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

the mailbox and ethmac nodes used the magic number "0" instead of the
GIC_SPI preprocessor macro. Additionally the ethmac used the magic
number "1" instead of IRQ_TYPE_EDGE_RISING.
Fix this to make the .dtsi easier to read.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 35b8c88c3220..492e6a24349a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -437,9 +437,9 @@
 			mailbox: mailbox@404 {
 				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
 				reg = <0 0x404 0 0x4c>;
-				interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
-					     <0 209 IRQ_TYPE_EDGE_RISING>,
-					     <0 210 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>;
 				#mbox-cells = <1>;
 			};
 		};
@@ -448,7 +448,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <0 8 1>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
