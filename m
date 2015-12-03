From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v2 1/9] clk: hi3519: add dt-binding document and header file
Date: Thu, 3 Dec 2015 10:39:24 +0800
Message-ID: <1449110364-23464-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

add dt-binding document and header file for hi3519 clock

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 .../devicetree/bindings/clock/hi3519-crg.txt       | 46 +++++++++++++++++++
 include/dt-bindings/clock/hi3519-clock.h           | 51 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt
 create mode 100644 include/dt-bindings/clock/hi3519-clock.h

diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
new file mode 100644
index 0000000..e0d30a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
@@ -0,0 +1,46 @@
+* Hisilicon Hi3519 Clock and Reset Generator(CRG)
+
+The Hi3519 CRG module provides clock and reset signals to various
+controllers within the SoC.
+
+This binding uses the following bindings:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+    Documentation/devicetree/bindings/reset/reset.txt
+
+Required Properties:
+
+- compatible: should be one of the following.
+  - "hisilicon,hi3519-crg" - controller compatible with Hi3519 SoC.
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+Each clock is assigned an identifier and client nodes use this identifier
+to specify the clock which they consume.
+
+All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
+
+- #reset-cells: should be 2.
+
+A reset signal can be controlled by writing a bit register in the CRG module.
+The reset specifier consists of two cells. The first cell represents the
+register offset relative to the base address. The second cell represents the
+bit index in the register.
+
+Example: CRG nodes
+CRG: clock-reset-controller {
+	compatible = "hisilicon,hi3519-crg";
+        reg = <0x12010000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <2>;
+};
+
+Example: consumer nodes
+i2c0: i2c@0x12110000 {
+	compatible = "hisilicon,hi3519-i2c";
+        reg = <0x12110000 0x1000>;
+        clocks = <&CRG HI3519_I2C0_RST>;*/
+        resets = <&CRG 0xE4 0>;
+};
diff --git a/include/dt-bindings/clock/hi3519-clock.h b/include/dt-bindings/clock/hi3519-clock.h
new file mode 100644
index 0000000..89c0d5e
--- /dev/null
+++ b/include/dt-bindings/clock/hi3519-clock.h
@@ -0,0 +1,51 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __DTS_HI3519_CLOCK_H
+#define __DTS_HI3519_CLOCK_H
+
+/* fixed rate */
+#define HI3519_FIXED_400M		1
+#define HI3519_FIXED_200M		2
+#define HI3519_FIXED_125M		3
+#define HI3519_FIXED_150M		4
+#define HI3519_FIXED_75M		5
+#define HI3519_FIXED_300M		6
+#define HI3519_FIXED_50M		7
+#define HI3519_FIXED_24M		8
+#define HI3519_FIXED_3M			9
+
+/* mux clocks */
+#define HI3519_FMC_MUX			32
+#define HI3519_I2C_MUX			33
+#define HI3519_UART_MUX			34
+#define HI3519_SYSAXI_MUX		35
+
+/*fixed factor clocks*/
+#define HI3519_SYSAPB_CLK		64
+
+/* gate clocks */
+#define HI3519_FMC_CLK			129
+#define HI3519_UART0_CLK		153
+#define HI3519_UART1_CLK		154
+#define HI3519_UART2_CLK		155
+#define HI3519_UART3_CLK		156
+#define HI3519_UART4_CLK		157
+
+#define HI3519_NR_CLKS			256
+#define HI3519_NR_RSTS			256
+#endif	/* __DTS_HI3519_CLOCK_H */
-- 
1.9.1

