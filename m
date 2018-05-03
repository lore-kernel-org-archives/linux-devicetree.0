From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v8 3/5] dt-bindings: clock: reset: Add AXG AO Clock and Reset Bindings
Date: Thu, 3 May 2018 21:26:22 +0800
Message-ID: <20180503132624.78453-4-yixun.lan@amlogic.com>
References: <20180503132624.78453-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180503132624.78453-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-bindings headers for the Meson-AXG's AO clock and
reset controller.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
 include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
 create mode 100644 include/dt-bindings/reset/axg-aoclkc.h

diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
new file mode 100644
index 000000000000..61955016a55b
--- /dev/null
+++ b/include/dt-bindings/clock/axg-aoclkc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Qiufang Dai <qiufang.dai@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
+#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
+
+#define CLKID_AO_REMOTE		0
+#define CLKID_AO_I2C_MASTER	1
+#define CLKID_AO_I2C_SLAVE	2
+#define CLKID_AO_UART1		3
+#define CLKID_AO_UART2		4
+#define CLKID_AO_IR_BLASTER	5
+#define CLKID_AO_SAR_ADC	6
+#define CLKID_AO_CLK81		7
+#define CLKID_AO_SAR_ADC_SEL	8
+#define CLKID_AO_SAR_ADC_DIV	9
+#define CLKID_AO_SAR_ADC_CLK	10
+#define CLKID_AO_ALT_XTAL	11
+
+#endif
diff --git a/include/dt-bindings/reset/axg-aoclkc.h b/include/dt-bindings/reset/axg-aoclkc.h
new file mode 100644
index 000000000000..d342c0b6b2a7
--- /dev/null
+++ b/include/dt-bindings/reset/axg-aoclkc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Qiufang Dai <qiufang.dai@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
+#define DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
+
+#define RESET_AO_REMOTE		0
+#define RESET_AO_I2C_MASTER	1
+#define RESET_AO_I2C_SLAVE	2
+#define RESET_AO_UART1		3
+#define RESET_AO_UART2		4
+#define RESET_AO_IR_BLASTER	5
+
+#endif
-- 
2.17.0
