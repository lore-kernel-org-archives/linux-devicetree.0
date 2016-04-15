From: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
Subject: [PATCH] ARM: dts: i.MX3x: add keypad port devicetree nodes
Date: Fri, 15 Apr 2016 09:54:20 +0200
Message-ID: <1460706860-16786-1-git-send-email-akurz@blala.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the Keypad Port (KPP) devicetree nodes for IMX31 and IMX35 SOC.

Signed-off-by: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
---
 arch/arm/boot/dts/imx31.dtsi | 8 ++++++++
 arch/arm/boot/dts/imx35.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx31.dtsi b/arch/arm/boot/dts/imx31.dtsi
index 5fdb222..1ce7ae9 100644
--- a/arch/arm/boot/dts/imx31.dtsi
+++ b/arch/arm/boot/dts/imx31.dtsi
@@ -69,6 +69,14 @@
 				status = "disabled";
 			};
 
+			kpp: kpp@43fa8000 {
+				compatible = "fsl,imx31-kpp", "fsl,imx21-kpp";
+				reg = <0x43fa8000 0x4000>;
+				interrupts = <24>;
+				clocks = <&clks 46>;
+				status = "disabled";
+			};
+
 			uart4: serial@43fb0000 {
 				compatible = "fsl,imx31-uart", "fsl,imx21-uart";
 				reg = <0x43fb0000 0x4000>;
diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dtsi
index 14e1320..490b7b4 100644
--- a/arch/arm/boot/dts/imx35.dtsi
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -137,6 +137,14 @@
 				status = "disabled";
 			};
 
+			kpp: kpp@43fa8000 {
+				compatible = "fsl,imx35-kpp", "fsl,imx21-kpp";
+				reg = <0x43fa8000 0x4000>;
+				interrupts = <24>;
+				clocks = <&clks 56>;
+				status = "disabled";
+			};
+
 			iomuxc: iomuxc@43fac000 {
 				compatible = "fsl,imx35-iomuxc";
 				reg = <0x43fac000 0x4000>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
