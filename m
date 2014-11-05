From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 3/3] ARM: dts: mt8135: Add Reset Controller for MediaTek SoC
Date: Wed, 5 Nov 2014 22:21:32 +0800
Message-ID: <1415197292-10546-4-git-send-email-flora.fu@mediatek.com>
References: <1415197292-10546-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415197292-10546-1-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add reset controller to MT8135 board dts.

Signed-off-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/mt8135.dtsi                      | 27 +++++++++
 .../dt-bindings/reset-controller/mt8135-resets.h   | 64 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8135-resets.h

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 90a56ad..370c8fc 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset-controller/mt8135-resets.h>
 #include "skeleton64.dtsi"
 
 / {
@@ -102,6 +103,32 @@
 			clock-names = "system-clk", "rtc-clk";
 		};
 
+		infracfg: syscon@10001000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "mediatek,mt8135-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+
+			infrarst: reset-controller@30 {
+				#reset-cells = <1>;
+				compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
+				reg = <0x30 0x8>;
+			};
+		};
+
+		pericfg: syscon@10003000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "mediatek,mt8135-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+
+			perirst: reset-controller@00 {
+				#reset-cells = <1>;
+				compatible = "mediatek,mt8135-pericfg-reset", "mediatek,reset";
+				reg = <0x00 0x8>;
+			};
+		};
+
 		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
diff --git a/include/dt-bindings/reset-controller/mt8135-resets.h b/include/dt-bindings/reset-controller/mt8135-resets.h
new file mode 100644
index 0000000..1bd15fe
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8135-resets.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Flora.Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8135
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8135
+
+/* INFRACFG RESETS */
+#define MT8135_INFRA_EMI_REG_RST        0
+#define MT8135_INFRA_DRAMC0_A0_RST      1
+#define MT8135_INFRA_CCIF0_RST          2
+#define MT8135_INFRA_APCIRQ_EINT_RST    3
+#define MT8135_INFRA_APXGPT_RST         4
+#define MT8135_INFRA_SCPSYS_RST         5
+#define MT8135_INFRA_CCIF1_RST          6
+#define MT8135_INFRA_PMIC_WRAP_RST      7
+#define MT8135_INFRA_KP_RST             8
+#define MT8135_INFRA_EMI_RST            32
+#define MT8135_INFRA_DRAMC0_RST         34
+#define MT8135_INFRA_SMI_RST            35
+#define MT8135_INFRA_M4U_RST            36
+
+/*  PERICFG RESETS */
+#define MT8135_PERI_UART0_SW_RST        0
+#define MT8135_PERI_UART1_SW_RST        1
+#define MT8135_PERI_UART2_SW_RST        2
+#define MT8135_PERI_UART3_SW_RST        3
+#define MT8135_PERI_IRDA_SW_RST         4
+#define MT8135_PERI_PTP_SW_RST          5
+#define MT8135_PERI_AP_HIF_SW_RST       6
+#define MT8135_PERI_GPCU_SW_RST         7
+#define MT8135_PERI_MD_HIF_SW_RST       8
+#define MT8135_PERI_NLI_SW_RST          9
+#define MT8135_PERI_AUXADC_SW_RST       10
+#define MT8135_PERI_DMA_SW_RST          11
+#define MT8135_PERI_NFI_SW_RST          14
+#define MT8135_PERI_PWM_SW_RST          15
+#define MT8135_PERI_THERM_SW_RST        16
+#define MT8135_PERI_MSDC0_SW_RST        17
+#define MT8135_PERI_MSDC1_SW_RST        18
+#define MT8135_PERI_MSDC2_SW_RST        19
+#define MT8135_PERI_MSDC3_SW_RST        20
+#define MT8135_PERI_I2C0_SW_RST         22
+#define MT8135_PERI_I2C1_SW_RST         23
+#define MT8135_PERI_I2C2_SW_RST         24
+#define MT8135_PERI_I2C3_SW_RST         25
+#define MT8135_PERI_I2C4_SW_RST         26
+#define MT8135_PERI_I2C5_SW_RST         27
+#define MT8135_PERI_I2C6_SW_RST         28
+#define MT8135_PERI_USB_SW_RST          29
+#define MT8135_PERI_SPI1_SW_RST         33
+#define MT8135_PERI_PWRAP_BRIDGE_SW_RST 34
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8135 */
\ No newline at end of file
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
