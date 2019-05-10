From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: reset: Add devicetree binding for BM1880 reset controller
Date: Sat, 11 May 2019 00:15:22 +0530
Message-ID: <20190510184525.13568-2-manivannan.sadhasivam@linaro.org>
References: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Bitmain BM1880 SoC reset controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/bitmain,bm1880-reset.txt   | 18 +++++++
 .../dt-bindings/reset/bitmain,bm1880-reset.h  | 51 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
 create mode 100644 include/dt-bindings/reset/bitmain,bm1880-reset.h

diff --git a/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
new file mode 100644
index 000000000000..a6f8455ae6c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
@@ -0,0 +1,18 @@
+Bitmain BM1880 SoC Reset Controller
+===================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible:   Should be "bitmain,bm1880-reset"
+- reg:          Offset and length of reset controller space in SCTRL.
+- #reset-cells: Must be 1.
+
+Example:
+
+        rst: reset-controller@c00 {
+                compatible = "bitmain,bm1880-reset";
+                reg = <0xc00 0x8>;
+                #reset-cells = <1>;
+        };
diff --git a/include/dt-bindings/reset/bitmain,bm1880-reset.h b/include/dt-bindings/reset/bitmain,bm1880-reset.h
new file mode 100644
index 000000000000..4c0de5223773
--- /dev/null
+++ b/include/dt-bindings/reset/bitmain,bm1880-reset.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2018 Bitmain Ltd.
+ * Copyright (c) 2019 Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_BM1880_RESET_H
+#define _DT_BINDINGS_BM1880_RESET_H
+
+#define BM1880_RST_MAIN_AP		0
+#define BM1880_RST_SECOND_AP		1
+#define BM1880_RST_DDR			2
+#define BM1880_RST_VIDEO		3
+#define BM1880_RST_JPEG			4
+#define BM1880_RST_VPP			5
+#define BM1880_RST_GDMA			6
+#define BM1880_RST_AXI_SRAM		7
+#define BM1880_RST_TPU			8
+#define BM1880_RST_USB			9
+#define BM1880_RST_ETH0			10
+#define BM1880_RST_ETH1			11
+#define BM1880_RST_NAND			12
+#define BM1880_RST_EMMC			13
+#define BM1880_RST_SD			14
+#define BM1880_RST_SDMA			15
+#define BM1880_RST_I2S0			16
+#define BM1880_RST_I2S1			17
+#define BM1880_RST_UART0_1_CLK		18
+#define BM1880_RST_UART0_1_ACLK		19
+#define BM1880_RST_UART2_3_CLK		20
+#define BM1880_RST_UART2_3_ACLK		21
+#define BM1880_RST_MINER		22
+#define BM1880_RST_I2C0			23
+#define BM1880_RST_I2C1			24
+#define BM1880_RST_I2C2			25
+#define BM1880_RST_I2C3			26
+#define BM1880_RST_I2C4			27
+#define BM1880_RST_PWM0			28
+#define BM1880_RST_PWM1			29
+#define BM1880_RST_PWM2			30
+#define BM1880_RST_PWM3			31
+#define BM1880_RST_SPI			32
+#define BM1880_RST_GPIO0		33
+#define BM1880_RST_GPIO1		34
+#define BM1880_RST_GPIO2		35
+#define BM1880_RST_EFUSE		36
+#define BM1880_RST_WDT			37
+#define BM1880_RST_AHB_ROM		38
+#define BM1880_RST_SPIC			39
+
+#endif /* _DT_BINDINGS_BM1880_RESET_H */
-- 
2.17.1
