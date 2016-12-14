From: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: TS-4600: add basic device tree
Date: Wed, 14 Dec 2016 18:12:32 -0500
Message-ID: <20161214231237.17496-3-sebastien.bourdelin@savoirfairelinux.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214231237.17496-1-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
Cc: mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, lucile.quirion-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These device trees add support for the TS-4600 by Technologic Systems.

More details here:
  http://wiki.embeddedarm.com/wiki/TS-4600

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                 |  2 +
 arch/arm/boot/dts/imx28-ts4600-common.dtsi | 78 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx28-ts4600-rev-a.dts   | 22 +++++++++
 arch/arm/boot/dts/imx28-ts4600-rev-b.dts   | 22 +++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-rev-a.dts
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-rev-b.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c558ba7..5a79fab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -466,6 +466,8 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx28-m28cu3.dtb \
 	imx28-m28evk.dtb \
 	imx28-sps1.dtb \
+	imx28-ts4600-rev-a.dtb \
+	imx28-ts4600-rev-b.dtb \
 	imx28-tx28.dtb
 dtb-$(CONFIG_ARCH_NOMADIK) += \
 	ste-nomadik-s8815.dtb \
diff --git a/arch/arm/boot/dts/imx28-ts4600-common.dtsi b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
new file mode 100644
index 0000000..04bd5a5
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
@@ -0,0 +1,78 @@
+/*
+ * Copyright (C) 2016 Savoir-Faire Linux
+ * Author: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
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
+#include "imx28.dtsi"
+#include "dt-bindings/gpio/gpio.h"
+
+/ {
+
+	compatible = "technologic,imx28-ts4600", "fsl,imx28";
+
+	apb@80000000 {
+		apbh@80000000 {
+			ssp0: ssp@80010000 {
+				compatible = "fsl,imx28-mmc";
+				pinctrl-names = "default";
+				pinctrl-0 = <&mmc0_4bit_pins_a
+					     &mmc0_sck_cfg
+					     &en_sd_pwr>;
+				broken-cd = <1>;
+				bus-width = <4>;
+				vmmc-supply = <&reg_vddio_sd0>;
+				status = "okay";
+			};
+
+			pinctrl@80018000 {
+				pinctrl-names = "default";
+
+				en_sd_pwr: en_sd_pwr {
+					fsl,pinmux-ids = <
+						MX28_PAD_PWM3__GPIO_3_28
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
+			};
+		};
+
+		apbx@80040000 {
+			pwm: pwm@80064000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pwm2_pins_a>;
+				status = "okay";
+			};
+
+			duart: serial@80074000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&duart_pins_a>;
+				status = "okay";
+			};
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+
+		reg_vddio_sd0: vddio-sd0 {
+			compatible = "regulator-fixed";
+			regulator-name = "vddio-sd0";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-boot-on;
+			gpio = <&gpio3 28 0>;
+		};
+	};
+
+};
diff --git a/arch/arm/boot/dts/imx28-ts4600-rev-a.dts b/arch/arm/boot/dts/imx28-ts4600-rev-a.dts
new file mode 100644
index 0000000..e8cb729
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-ts4600-rev-a.dts
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2016 Savoir-Faire Linux
+ * Author: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "imx28-ts4600-common.dtsi"
+
+/ {
+	model = "Technologic Systems i.MX28 TS-4600 Rev A";
+
+	memory {
+		reg = <0x40000000 0x08000000>;   /* 128MB */
+	};
+
+};
diff --git a/arch/arm/boot/dts/imx28-ts4600-rev-b.dts b/arch/arm/boot/dts/imx28-ts4600-rev-b.dts
new file mode 100644
index 0000000..a115f83
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-ts4600-rev-b.dts
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2016 Savoir-Faire Linux
+ * Author: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "imx28-ts4600-common.dtsi"
+
+/ {
+	model = "Technologic Systems i.MX28 TS-4600 Rev B";
+
+	memory {
+		reg = <0x40000000 0x10000000>;   /* 256MB */
+	};
+
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
