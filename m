From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-nitrogen6_som2: fix PCIe reset
Date: Thu, 17 Aug 2017 15:50:10 +0200
Message-ID: <20170817135010.3042-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Previous value was a bad copy of nitrogen6_max device tree.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
index aeaa5a6e4fcf..a24e4f1911ab 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
@@ -507,7 +507,7 @@
 	pinctrl_pcie: pciegrp {
 		fsl,pins = <
 			/* PCIe reset */
-			MX6QDL_PAD_EIM_BCLK__GPIO6_IO31	0x030b0
+			MX6QDL_PAD_EIM_DA0__GPIO3_IO00	0x030b0
 			MX6QDL_PAD_EIM_DA4__GPIO3_IO04	0x030b0
 		>;
 	};
@@ -668,7 +668,7 @@
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 31 GPIO_ACTIVE_LOW>;
+	reset-gpio = <&gpio3 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
