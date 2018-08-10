From: Jian Hu <jian.hu@amlogic.com>
Subject: [PATCH 1/2] dt-bindings: clk: meson-g12a: Add G12A AO Clock Bindings
Date: Fri, 10 Aug 2018 17:54:27 +0800
Message-ID: <1533894868-85815-2-git-send-email-jian.hu@amlogic.com>
References: <1533894868-85815-1-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533894868-85815-1-git-send-email-jian.hu@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new clock controller compatible and dt-bingdings headers
for the Always-On domain of the g12a SoC

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  1 +
 include/dt-bindings/clock/g12a-aoclkc.h            | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100755 include/dt-bindings/clock/g12a-aoclkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index 3a88052..6f02288 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
 	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
 	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
+	- G12A (S905D2, S905X2) : "amlogic,g12a-aoclkc"
 	followed by the common "amlogic,meson-gx-aoclkc"
 
 - #clock-cells: should be 1.
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
new file mode 100755
index 0000000..6b3f921
--- /dev/null
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Jian Hu<jian.hu@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
+#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_G12A_AOCLK
+
+#define CLKID_AO_AHB_BUS		0
+#define CLKID_AO_REMOTE			1
+#define CLKID_AO_I2C_MASTER		2
+#define CLKID_AO_I2C_SLAVE		3
+#define CLKID_AO_UART1			4
+#define CLKID_AO_PROD_I2C		5
+#define CLKID_AO_UART2			6
+#define CLKID_AO_IR_BLASTER		7
+#define CLKID_AO_SAR_ADC		8
+#define CLKID_AO_CLK81			9
+#define CLKID_AO_SAR_ADC_SEL		10
+#define CLKID_AO_SAR_ADC_DIV		11
+#define CLKID_AO_SAR_ADC_CLK		12
+#define CLKID_AO_ALT_XTAL		13
+
+#endif
-- 
1.9.1
