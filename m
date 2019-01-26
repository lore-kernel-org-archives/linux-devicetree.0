From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] arm64: dts: bitmain: Add Sophon Egde board support
Date: Sat, 26 Jan 2019 09:40:40 +0530
Message-ID: <20190126041041.13173-5-manivannan.sadhasivam@linaro.org>
References: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree support for Sophon Edge board from Bitmain based on
BM1880 SoC. This board is one of the 96Boards Consumer and AI platform.
More information about this board can be found in 96Boards product page:

https://www.96boards.org/documentation/consumer/sophon-edge/

Only UART peripheral support is enabled for now.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/Makefile          |  3 ++
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   | 50 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/arm64/boot/dts/bitmain/Makefile
 create mode 100644 arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts

diff --git a/arch/arm64/boot/dts/bitmain/Makefile b/arch/arm64/boot/dts/bitmain/Makefile
new file mode 100644
index 000000000000..be90a6071be0
--- /dev/null
+++ b/arch/arm64/boot/dts/bitmain/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+dtb-$(CONFIG_ARCH_BITMAIN) += bm1880-sophon-edge.dtb
diff --git a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
new file mode 100644
index 000000000000..6a3255597138
--- /dev/null
+++ b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+/dts-v1/;
+
+#include "bm1880.dtsi"
+
+/ {
+	compatible = "bitmain,sophon-edge", "bitmain,bm1880";
+	model = "Sophon Edge";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart2;
+		serial2 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x40000000>; // 1GB
+	};
+
+	uart_clk: uart-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <500000000>;
+		#clock-cells = <0>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+	clocks = <&uart_clk>;
+};
+
+&uart1 {
+	status = "okay";
+	clocks = <&uart_clk>;
+};
+
+&uart2 {
+	status = "okay";
+	clocks = <&uart_clk>;
+};
-- 
2.17.1
