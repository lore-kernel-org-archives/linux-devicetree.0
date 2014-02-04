From: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Subject: [PATCH 2/3] Phytec phyFLEX-i.MX6 : Added GPMI-NAND Support
Date: Tue, 4 Feb 2014 10:05:07 +0530
Message-ID: <1391488507-30698-1-git-send-email-ashutosh.s@phytec.in>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for GPMI-NAND on Phytec phyFLEX-i.MX6 Quad module.

Signed-off-by: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-phytec-pbab01.dts  |    4 ++++
 arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi |    7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
index 91aecba..21c8b37 100644
--- a/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
+++ b/arch/arm/boot/dts/imx6q-phytec-pbab01.dts
@@ -21,6 +21,10 @@
 	status = "okay";
 };
 
+&gpmi {
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
index fb39dae..8787101 100644
--- a/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi
@@ -176,6 +176,13 @@
 	status = "disabled";
 };
 
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
+	nand-on-flash-bbt;
+	status = "disabled";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4_1>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
