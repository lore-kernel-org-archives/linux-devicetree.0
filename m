From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/6] ARM: dts: imx: Add support for Advantech/GE B450v3
Date: Thu, 29 Oct 2015 19:16:45 -0400
Message-ID: <1446160607-16053-5-git-send-email-akshay.bhat@timesys.com>
References: <1446160607-16053-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446160607-16053-1-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for Advantech/GE B450v3 board.

Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile         |  1 +
 arch/arm/boot/dts/imx6q-b450v3.dts | 75 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-b450v3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7d3e495..267b2be 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -308,6 +308,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-wandboard-revb1.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
+	imx6q-b450v3.dtb \
 	imx6q-cm-fx6.dtb \
 	imx6q-cubox-i.dtb \
 	imx6q-dfi-fs700-m60.dtb \
diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
new file mode 100644
index 0000000..d63d9e1
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -0,0 +1,75 @@
+/*
+ * Copyright 2015 Timesys Corporation.
+ * Copyright 2015 GE Healthcare.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+
+#include "imx6q-bx50v3.dtsi"
+
+/ {
+	model = "Advantech MX6Q B450V3 QSeven Board";
+	compatible = "adv,imx6q-b450v3", "adv,imx6q-ba16", "fsl,imx6q";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+};
+
+&ldb {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
+				 <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+	status = "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: G121X1-L03 {
+				clock-frequency = <65000000>;
+				hactive = <1024>;
+				vactive = <768>;
+				hback-porch = <320>;
+				hfront-porch = <0>;
+				vback-porch = <0>;
+				vfront-porch = <38>;
+				hsync-len = <1>;
+				vsync-len = <1>;
+			};
+		};
+	};
+
+	lvds1: lvds-channel@1 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing1>;
+			timing1: G121X1-L03 {
+				clock-frequency = <65000000>;
+				hactive = <1024>;
+				vactive = <768>;
+				hback-porch = <320>;
+				hfront-porch = <0>;
+				vback-porch = <0>;
+				vfront-porch = <38>;
+				hsync-len = <1>;
+				vsync-len = <1>;
+			};
+		};
+	};
+
+};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
