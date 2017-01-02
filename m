From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: imx6ul: Add Engicam Is.IoT MX6UL initial support
Date: Mon,  2 Jan 2017 14:40:20 +0100
Message-ID: <1483364420-10012-3-git-send-email-jagan@openedev.com>
References: <1483364420-10012-1-git-send-email-jagan@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483364420-10012-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Is.IoT MX6UL modules are system on module solutions manufactured by
Engicam for IOT connectivity applications with following characteristics:
CPU     NXP i.MX6UL (G2) Cortex-A7@528 MHz
RAM     Up to 512 MB LvDDR3@800MT/s
NAND    256MB (option)
eMMC    4GB (option)
LCD     18 bit parallel
BT      2.1+EDR,Bluetooth 3.0, Bluetooth 4.1 (Bluetooth low energy)
WLAN    IEEE 802.11 b/g/n (single stream n)

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Changes for v2:
- Newly added patch 

 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/imx6ul-isiot.dts | 119 +++++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-isiot.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 51f8dae..bb1a172 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -435,6 +435,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-geam-kit.dtb \
+	imx6ul-isiot.dtb \
 	imx6ul-liteboard.dtb \
 	imx6ul-pico-hobbit.dtb \
 	imx6ul-tx6ul-0010.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-isiot.dts b/arch/arm/boot/dts/imx6ul-isiot.dts
new file mode 100644
index 0000000..b37db73
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-isiot.dts
@@ -0,0 +1,119 @@
+/*
+ * Copyright (C) 2016 Amarula Solutions B.V.
+ * Copyright (C) 2016 Engicam S.r.l.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "imx6ul.dtsi"
+
+/ {
+	model = "Engicam Is.IoT MX6UL Starter kit";
+	compatible = "engicam,imx6ul-isiot", "fsl,imx6ul";
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	cd-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX 0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX 0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD     0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK     0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD     0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK     0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD     0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK     0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x170f9
+		>;
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
