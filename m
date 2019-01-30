Return-Path: <SRS0=NsZW=QG=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v7 1/6] mfd: lochnagar: Add initial binding documentation
Date: Wed, 30 Jan 2019 11:41:23 +0000
Message-ID: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v6:
 - Correct regulator bindings to match already merged regulator code

Thanks,
Charles

 .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  68 +++++++++++
 include/dt-bindings/clk/lochnagar.h                |  26 ++++
 include/dt-bindings/pinctrl/lochnagar.h            | 132 +++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
 create mode 100644 include/dt-bindings/clk/lochnagar.h
 create mode 100644 include/dt-bindings/pinctrl/lochnagar.h

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
new file mode 100644
index 0000000000000..004b0158cf4d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
@@ -0,0 +1,68 @@
+Cirrus Logic Lochnagar Audio Development Board
+
+Lochnagar is an evaluation and development board for Cirrus Logic
+Smart CODEC and Amp devices. It allows the connection of most Cirrus
+Logic devices on mini-cards, as well as allowing connection of
+various application processor systems to provide a full evaluation
+platform.  Audio system topology, clocking and power can all be
+controlled through the Lochnagar, allowing the device under test
+to be used in a variety of possible use cases.
+
+Also see these documents for generic binding information:
+  [1] GPIO : ../gpio/gpio.txt
+
+And these for relevant defines:
+  [2] include/dt-bindings/pinctrl/lochnagar.h
+  [3] include/dt-bindings/clock/lochnagar.h
+
+And these documents for the required sub-node binding details:
+  [4] Clock: ../clock/cirrus,lochnagar.txt
+  [5] Pinctrl: ../pinctrl/cirrus,lochnagar.txt
+  [6] Regulator: ../regulator/cirrus,lochnagar.txt
+
+Required properties:
+
+  - compatible : One of the following strings:
+                 "cirrus,lochnagar1"
+                 "cirrus,lochnagar2"
+
+  - reg : I2C slave address
+
+  - reset-gpios : Reset line to the Lochnagar, see [1].
+
+Required sub-nodes:
+
+  - lochnagar-clk : Binding for the clocking components, see [4].
+
+  - lochnagar-pinctrl : Binding for the pin control components, see [5].
+
+Optional sub-nodes:
+
+  - Bindings for the regulator components, see [6]. Only available on
+    Lochnagar 2.
+
+Optional properties:
+
+  - present-gpios : Host present line, indicating the presence of a
+    host system, see [1]. This can be omitted if the present line is
+    tied in hardware.
+
+Example:
+
+lochnagar: lochnagar@22 {
+	compatible = "cirrus,lochnagar2";
+	reg = <0x22>;
+
+	reset-gpios = <&gpio0 55 0>;
+	present-gpios = <&gpio0 60 0>;
+
+	lochnagar-clk {
+		compatible = "cirrus,lochnagar2-clk";
+		...
+	};
+
+	lochnagar-pinctrl {
+		compatible = "cirrus,lochnagar-pinctrl";
+		...
+	};
+};
diff --git a/include/dt-bindings/clk/lochnagar.h b/include/dt-bindings/clk/lochnagar.h
new file mode 100644
index 0000000000000..8fa20551ff171
--- /dev/null
+++ b/include/dt-bindings/clk/lochnagar.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree defines for Lochnagar clocking
+ *
+ * Copyright (c) 2017-2018 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.cirrus.com>
+ */
+
+#ifndef DT_BINDINGS_CLK_LOCHNAGAR_H
+#define DT_BINDINGS_CLK_LOCHNAGAR_H
+
+#define LOCHNAGAR_CDC_MCLK1		0
+#define LOCHNAGAR_CDC_MCLK2		1
+#define LOCHNAGAR_DSP_CLKIN		2
+#define LOCHNAGAR_GF_CLKOUT1		3
+#define LOCHNAGAR_GF_CLKOUT2		4
+#define LOCHNAGAR_PSIA1_MCLK		5
+#define LOCHNAGAR_PSIA2_MCLK		6
+#define LOCHNAGAR_SPDIF_MCLK		7
+#define LOCHNAGAR_ADAT_MCLK		8
+#define LOCHNAGAR_SOUNDCARD_MCLK	9
+#define LOCHNAGAR_SPDIF_CLKOUT		10
+
+#endif
diff --git a/include/dt-bindings/pinctrl/lochnagar.h b/include/dt-bindings/pinctrl/lochnagar.h
new file mode 100644
index 0000000000000..644760bf5725b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/lochnagar.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree defines for Lochnagar pinctrl
+ *
+ * Copyright (c) 2018 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.cirrus.com>
+ */
+
+#ifndef DT_BINDINGS_PINCTRL_LOCHNAGAR_H
+#define DT_BINDINGS_PINCTRL_LOCHNAGAR_H
+
+#define LOCHNAGAR1_PIN_CDC_RESET		0
+#define LOCHNAGAR1_PIN_DSP_RESET		1
+#define LOCHNAGAR1_PIN_CDC_CIF1MODE		2
+#define LOCHNAGAR1_PIN_NUM_GPIOS		3
+
+#define LOCHNAGAR2_PIN_CDC_RESET		0
+#define LOCHNAGAR2_PIN_DSP_RESET		1
+#define LOCHNAGAR2_PIN_CDC_CIF1MODE		2
+#define LOCHNAGAR2_PIN_CDC_LDOENA		3
+#define LOCHNAGAR2_PIN_SPDIF_HWMODE		4
+#define LOCHNAGAR2_PIN_SPDIF_RESET		5
+#define LOCHNAGAR2_PIN_FPGA_GPIO1		6
+#define LOCHNAGAR2_PIN_FPGA_GPIO2		7
+#define LOCHNAGAR2_PIN_FPGA_GPIO3		8
+#define LOCHNAGAR2_PIN_FPGA_GPIO4		9
+#define LOCHNAGAR2_PIN_FPGA_GPIO5		10
+#define LOCHNAGAR2_PIN_FPGA_GPIO6		11
+#define LOCHNAGAR2_PIN_CDC_GPIO1		12
+#define LOCHNAGAR2_PIN_CDC_GPIO2		13
+#define LOCHNAGAR2_PIN_CDC_GPIO3		14
+#define LOCHNAGAR2_PIN_CDC_GPIO4		15
+#define LOCHNAGAR2_PIN_CDC_GPIO5		16
+#define LOCHNAGAR2_PIN_CDC_GPIO6		17
+#define LOCHNAGAR2_PIN_CDC_GPIO7		18
+#define LOCHNAGAR2_PIN_CDC_GPIO8		19
+#define LOCHNAGAR2_PIN_DSP_GPIO1		20
+#define LOCHNAGAR2_PIN_DSP_GPIO2		21
+#define LOCHNAGAR2_PIN_DSP_GPIO3		22
+#define LOCHNAGAR2_PIN_DSP_GPIO4		23
+#define LOCHNAGAR2_PIN_DSP_GPIO5		24
+#define LOCHNAGAR2_PIN_DSP_GPIO6		25
+#define LOCHNAGAR2_PIN_GF_GPIO2			26
+#define LOCHNAGAR2_PIN_GF_GPIO3			27
+#define LOCHNAGAR2_PIN_GF_GPIO7			28
+#define LOCHNAGAR2_PIN_CDC_AIF1_BCLK		29
+#define LOCHNAGAR2_PIN_CDC_AIF1_RXDAT		30
+#define LOCHNAGAR2_PIN_CDC_AIF1_LRCLK		31
+#define LOCHNAGAR2_PIN_CDC_AIF1_TXDAT		32
+#define LOCHNAGAR2_PIN_CDC_AIF2_BCLK		33
+#define LOCHNAGAR2_PIN_CDC_AIF2_RXDAT		34
+#define LOCHNAGAR2_PIN_CDC_AIF2_LRCLK		35
+#define LOCHNAGAR2_PIN_CDC_AIF2_TXDAT		36
+#define LOCHNAGAR2_PIN_CDC_AIF3_BCLK		37
+#define LOCHNAGAR2_PIN_CDC_AIF3_RXDAT		38
+#define LOCHNAGAR2_PIN_CDC_AIF3_LRCLK		39
+#define LOCHNAGAR2_PIN_CDC_AIF3_TXDAT		40
+#define LOCHNAGAR2_PIN_DSP_AIF1_BCLK		41
+#define LOCHNAGAR2_PIN_DSP_AIF1_RXDAT		42
+#define LOCHNAGAR2_PIN_DSP_AIF1_LRCLK		43
+#define LOCHNAGAR2_PIN_DSP_AIF1_TXDAT		44
+#define LOCHNAGAR2_PIN_DSP_AIF2_BCLK		45
+#define LOCHNAGAR2_PIN_DSP_AIF2_RXDAT		46
+#define LOCHNAGAR2_PIN_DSP_AIF2_LRCLK		47
+#define LOCHNAGAR2_PIN_DSP_AIF2_TXDAT		48
+#define LOCHNAGAR2_PIN_PSIA1_BCLK		49
+#define LOCHNAGAR2_PIN_PSIA1_RXDAT		50
+#define LOCHNAGAR2_PIN_PSIA1_LRCLK		51
+#define LOCHNAGAR2_PIN_PSIA1_TXDAT		52
+#define LOCHNAGAR2_PIN_PSIA2_BCLK		53
+#define LOCHNAGAR2_PIN_PSIA2_RXDAT		54
+#define LOCHNAGAR2_PIN_PSIA2_LRCLK		55
+#define LOCHNAGAR2_PIN_PSIA2_TXDAT		56
+#define LOCHNAGAR2_PIN_GF_AIF3_BCLK		57
+#define LOCHNAGAR2_PIN_GF_AIF3_RXDAT		58
+#define LOCHNAGAR2_PIN_GF_AIF3_LRCLK		59
+#define LOCHNAGAR2_PIN_GF_AIF3_TXDAT		60
+#define LOCHNAGAR2_PIN_GF_AIF4_BCLK		61
+#define LOCHNAGAR2_PIN_GF_AIF4_RXDAT		62
+#define LOCHNAGAR2_PIN_GF_AIF4_LRCLK		63
+#define LOCHNAGAR2_PIN_GF_AIF4_TXDAT		64
+#define LOCHNAGAR2_PIN_GF_AIF1_BCLK		65
+#define LOCHNAGAR2_PIN_GF_AIF1_RXDAT		66
+#define LOCHNAGAR2_PIN_GF_AIF1_LRCLK		67
+#define LOCHNAGAR2_PIN_GF_AIF1_TXDAT		68
+#define LOCHNAGAR2_PIN_GF_AIF2_BCLK		69
+#define LOCHNAGAR2_PIN_GF_AIF2_RXDAT		70
+#define LOCHNAGAR2_PIN_GF_AIF2_LRCLK		71
+#define LOCHNAGAR2_PIN_GF_AIF2_TXDAT		72
+#define LOCHNAGAR2_PIN_DSP_UART1_RX		73
+#define LOCHNAGAR2_PIN_DSP_UART1_TX		74
+#define LOCHNAGAR2_PIN_DSP_UART2_RX		75
+#define LOCHNAGAR2_PIN_DSP_UART2_TX		76
+#define LOCHNAGAR2_PIN_GF_UART2_RX		77
+#define LOCHNAGAR2_PIN_GF_UART2_TX		78
+#define LOCHNAGAR2_PIN_USB_UART_RX		79
+#define LOCHNAGAR2_PIN_CDC_PDMCLK1		80
+#define LOCHNAGAR2_PIN_CDC_PDMDAT1		81
+#define LOCHNAGAR2_PIN_CDC_PDMCLK2		82
+#define LOCHNAGAR2_PIN_CDC_PDMDAT2		83
+#define LOCHNAGAR2_PIN_CDC_DMICCLK1		84
+#define LOCHNAGAR2_PIN_CDC_DMICDAT1		85
+#define LOCHNAGAR2_PIN_CDC_DMICCLK2		86
+#define LOCHNAGAR2_PIN_CDC_DMICDAT2		87
+#define LOCHNAGAR2_PIN_CDC_DMICCLK3		88
+#define LOCHNAGAR2_PIN_CDC_DMICDAT3		89
+#define LOCHNAGAR2_PIN_CDC_DMICCLK4		90
+#define LOCHNAGAR2_PIN_CDC_DMICDAT4		91
+#define LOCHNAGAR2_PIN_DSP_DMICCLK1		92
+#define LOCHNAGAR2_PIN_DSP_DMICDAT1		93
+#define LOCHNAGAR2_PIN_DSP_DMICCLK2		94
+#define LOCHNAGAR2_PIN_DSP_DMICDAT2		95
+#define LOCHNAGAR2_PIN_I2C2_SCL			96
+#define LOCHNAGAR2_PIN_I2C2_SDA			97
+#define LOCHNAGAR2_PIN_I2C3_SCL			98
+#define LOCHNAGAR2_PIN_I2C3_SDA			99
+#define LOCHNAGAR2_PIN_I2C4_SCL			100
+#define LOCHNAGAR2_PIN_I2C4_SDA			101
+#define LOCHNAGAR2_PIN_DSP_STANDBY		102
+#define LOCHNAGAR2_PIN_CDC_MCLK1		103
+#define LOCHNAGAR2_PIN_CDC_MCLK2		104
+#define LOCHNAGAR2_PIN_DSP_CLKIN		105
+#define LOCHNAGAR2_PIN_PSIA1_MCLK		106
+#define LOCHNAGAR2_PIN_PSIA2_MCLK		107
+#define LOCHNAGAR2_PIN_GF_GPIO1			108
+#define LOCHNAGAR2_PIN_GF_GPIO5			109
+#define LOCHNAGAR2_PIN_DSP_GPIO20		110
+#define LOCHNAGAR2_PIN_NUM_GPIOS		111
+
+#endif
-- 
2.11.0
