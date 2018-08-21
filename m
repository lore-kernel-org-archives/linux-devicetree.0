From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] dt-bindings: clock: Add jz4725b-cgu.h header
Date: Tue, 21 Aug 2018 14:38:18 +0200
Message-ID: <20180821123819.25020-2-paul@crapouillou.net>
References: <20180821123819.25020-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821123819.25020-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This will be used from the devicetree bindings to specify the clocks
that should be obtained from the jz4725b-cgu driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/dt-bindings/clock/jz4725b-cgu.h | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/clock/jz4725b-cgu.h

diff --git a/include/dt-bindings/clock/jz4725b-cgu.h b/include/dt-bindings/clock/jz4725b-cgu.h
new file mode 100644
index 000000000000..460bbeff6ab8
--- /dev/null
+++ b/include/dt-bindings/clock/jz4725b-cgu.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,jz4725b-cgu DT binding.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_JZ4725B_CGU_H__
+#define __DT_BINDINGS_CLOCK_JZ4725B_CGU_H__
+
+#define JZ4725B_CLK_EXT		0
+#define JZ4725B_CLK_OSC32K	1
+#define JZ4725B_CLK_PLL		2
+#define JZ4725B_CLK_PLL_HALF	3
+#define JZ4725B_CLK_CCLK	4
+#define JZ4725B_CLK_HCLK	5
+#define JZ4725B_CLK_PCLK	6
+#define JZ4725B_CLK_MCLK	7
+#define JZ4725B_CLK_IPU		8
+#define JZ4725B_CLK_LCD		9
+#define JZ4725B_CLK_I2S		10
+#define JZ4725B_CLK_SPI		11
+#define JZ4725B_CLK_MMC_MUX	12
+#define JZ4725B_CLK_UDC		13
+#define JZ4725B_CLK_UART	14
+#define JZ4725B_CLK_DMA		15
+#define JZ4725B_CLK_ADC		16
+#define JZ4725B_CLK_I2C		17
+#define JZ4725B_CLK_AIC		18
+#define JZ4725B_CLK_MMC0	19
+#define JZ4725B_CLK_MMC1	20
+#define JZ4725B_CLK_BCH		21
+#define JZ4725B_CLK_TCU		22
+#define JZ4725B_CLK_EXT512	23
+#define JZ4725B_CLK_RTC		24
+
+#endif /* __DT_BINDINGS_CLOCK_JZ4725B_CGU_H__ */
-- 
2.18.0
