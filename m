From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 6/6] ARM: dts: stm32: add initial support of stm32mp157c eval board
Date: Fri, 8 Dec 2017 15:11:17 +0100
Message-ID: <1512742277-28205-7-git-send-email-ludovic.Barre@st.com>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512742277-28205-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

Add support of stm32mp157c evaluation board (part number: STM32MP157C-EV1)
split in 2 elements:
-Daughter board (part number: STM32MP157C-ED1)
 which includes CPU, memory and power supply
-Mother board (part number: STM32MP157C-EM1)
 which includes external peripherals (like display, camera,...)
 and extension connectors.

The daughter board can run alone, this is why the device tree files
are split in two layers, for the complete evaluation board (ev1)
and for the daughter board alone (ed1).

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                |  5 ++++-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     | 29 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 19 +++++++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-ed1.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157c-ev1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..ddfa3b3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -839,7 +839,7 @@ dtb-$(CONFIG_ARCH_STI) += \
 	stih410-b2120.dtb \
 	stih410-b2260.dtb \
 	stih418-b2199.dtb
-dtb-$(CONFIG_ARCH_STM32)+= \
+dtb-$(CONFIG_ARCH_STM32_MCU) += \
 	stm32f429-disco.dtb \
 	stm32f469-disco.dtb \
 	stm32f746-disco.dtb \
@@ -848,6 +848,9 @@ dtb-$(CONFIG_ARCH_STM32)+= \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb
+dtb-$(CONFIG_ARCH_STM32_MPU) += \
+	stm32mp157c-ed1.dtb \
+	stm32mp157c-ev1.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-a1000.dtb \
 	sun4i-a10-ba10-tvbox.dtb \
diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 440276a..7ac65f4 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -145,6 +145,19 @@
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 160 8>;
 			};
+
+			uart4_pins_a: uart4@0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
 		};
 
 		pinctrl_z: pin-controller-z {
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
new file mode 100644
index 0000000..f6a2618
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved 
+ * Author: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+/dts-v1/;
+
+#include "stm32mp157c.dtsi"
+#include "stm32mp157-pinctrl.dtsi"
+
+/ {
+	model = "STMicroelectronics STM32MP157C eval daughter";
+	compatible = "st,stm32mp157c-ed1", "st,stm32mp157";
+
+	chosen {
+		bootargs = "earlyprintk console=ttySTM3,115200 root=/dev/ram";
+		stdout-path = "serial3:115200n8";
+	};
+
+	memory {
+		reg = <0xC0000000 0x4000000>;
+	};
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
new file mode 100644
index 0000000..a310703
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved 
+ * Author: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+/dts-v1/;
+
+#include "stm32mp157c-ed1.dts"
+
+/ {
+	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
+	compatible = "st,stm32mp157c-ev1", "st,stm32mp157c-ed1", "st,stm32mp157";
+
+	chosen {
+		bootargs = "earlyprintk console=ttySTM3,115200 root=/dev/ram";
+		stdout-path = "serial3:115200n8";
+	};
+};
+
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
