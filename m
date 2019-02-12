From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] dt-bindings: clk: add G12A AO Clock and Reset Bindings
Date: Tue, 12 Feb 2019 17:28:58 +0100
Message-ID: <20190212162859.20743-2-narmstrong@baylibre.com>
References: <20190212162859.20743-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212162859.20743-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings for the Amlogic G12A AO Clock and Reset controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/clock/amlogic,gxbb-aoclkc.txt    |  1 +
 include/dt-bindings/clock/g12a-aoclkc.h       | 34 +++++++++++++++++++
 include/dt-bindings/reset/g12a-aoclkc.h       | 18 ++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
 create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index 79511d7bb321..c41f0be5d438 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
 	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
 	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
+	- G12A (S905X2, S905D2, S905Y2) : "amlogic,meson-g12a-aoclkc"
 	followed by the common "amlogic,meson-gx-aoclkc"
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
new file mode 100644
index 000000000000..8db01ffbeb06
--- /dev/null
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Qiufang Dai <qiufang.dai@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
+#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
+
+#define CLKID_AO_AHB		0
+#define CLKID_AO_IR_IN		1
+#define CLKID_AO_I2C_M0		2
+#define CLKID_AO_I2C_S0		3
+#define CLKID_AO_UART		4
+#define CLKID_AO_PROD_I2C	5
+#define CLKID_AO_UART2		6
+#define CLKID_AO_IR_OUT		7
+#define CLKID_AO_SAR_ADC	8
+#define CLKID_AO_MAILBOX	9
+#define CLKID_AO_M3		10
+#define CLKID_AO_AHB_SRAM	11
+#define CLKID_AO_RTI		12
+#define CLKID_AO_M4_FCLK	13
+#define CLKID_AO_M4_HCLK	14
+#define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_CLK	18
+#define CLKID_AO_32K		23
+#define CLKID_AO_CEC		27
+#define CLKID_AO_CTS_RTC_OSCIN	28
+
+#endif
diff --git a/include/dt-bindings/reset/g12a-aoclkc.h b/include/dt-bindings/reset/g12a-aoclkc.h
new file mode 100644
index 000000000000..bd2e2337135c
--- /dev/null
+++ b/include/dt-bindings/reset/g12a-aoclkc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
+#define DT_BINDINGS_RESET_AMLOGIC_MESON_G12A_AOCLK
+
+#define RESET_AO_IR_IN		0
+#define RESET_AO_UART		1
+#define RESET_AO_I2C_M		2
+#define RESET_AO_I2C_S		3
+#define RESET_AO_SAR_ADC	4
+#define RESET_AO_UART2		5
+#define RESET_AO_IR_OUT		6
+
+#endif
-- 
2.20.1
