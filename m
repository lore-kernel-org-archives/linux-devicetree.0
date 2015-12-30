From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v4 6/6] ARM: dts: add dts files for Hi3519
Date: Wed, 30 Dec 2015 09:43:52 +0800
Message-ID: <1451439832-13927-7-git-send-email-xuejiancheng@huawei.com>
References: <1451439832-13927-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1451439832-13927-1-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

add dts files for Hi3519

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 arch/arm/boot/dts/Makefile        |   2 +
 arch/arm/boot/dts/hi3519-demb.dts |  42 +++++++++
 arch/arm/boot/dts/hi3519.dtsi     | 175 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 arch/arm/boot/dts/hi3519-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3519.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30bbc37..1ff3ed9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -135,6 +135,8 @@ dtb-$(CONFIG_ARCH_EXYNOS5) += \
 	exynos5800-peach-pi.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
 	hi3620-hi4511.dtb
+dtb-$(CONFIG_ARCH_HISI) += \
+	hi3519-demb.dtb
 dtb-$(CONFIG_ARCH_HIX5HD2) += \
 	hisi-x5hd2-dkb.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += \
diff --git a/arch/arm/boot/dts/hi3519-demb.dts b/arch/arm/boot/dts/hi3519-demb.dts
new file mode 100644
index 0000000..6991ab6
--- /dev/null
+++ b/arch/arm/boot/dts/hi3519-demb.dts
@@ -0,0 +1,42 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+/dts-v1/;
+#include "hi3519.dtsi"
+
+/ {
+	model = "HiSilicon HI3519 DEMO Board";
+	compatible = "hisilicon,hi3519";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&dual_timer0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/hi3519.dtsi b/arch/arm/boot/dts/hi3519.dtsi
new file mode 100644
index 0000000..95137c7
--- /dev/null
+++ b/arch/arm/boot/dts/hi3519.dtsi
@@ -0,0 +1,175 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include <dt-bindings/clock/hi3519-clock.h>
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	chosen { };
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0>;
+		};
+	};
+
+	gic: interrupt-controller@10300000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x10301000 0x1000>, <0x10302000 0x1000>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+
+		uart0: serial@12100000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12100000 0x1000>;
+			interrupts = <0 4 4>;
+			clocks = <&crg HI3519_UART0_CLK>;
+			clock-names = "apb_pclk";
+			status = "disable";
+		};
+
+		uart1: serial@12101000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12101000 0x1000>;
+			interrupts = <0 5 4>;
+			clocks = <&crg HI3519_UART1_CLK>;
+			clock-names = "apb_pclk";
+			status = "disable";
+		};
+
+		uart2: serial@12102000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12102000 0x1000>;
+			interrupts = <0 6 4>;
+			clocks = <&crg HI3519_UART2_CLK>;
+			clock-names = "apb_pclk";
+			status = "disable";
+		};
+
+		uart3: serial@12103000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12103000 0x1000>;
+			interrupts = <0 7 4>;
+			clocks = <&crg HI3519_UART3_CLK>;
+			clock-names = "apb_pclk";
+			status = "disable";
+		};
+
+		uart4: serial@12104000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12104000 0x1000>;
+			interrupts = <0 8 4>;
+			clocks = <&crg HI3519_UART4_CLK>;
+			clock-names = "apb_pclk";
+			status = "disable";
+		};
+
+		dual_timer0: timer@12000000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <0 64 4>, <0 65 4>;
+			reg = <0x12000000 0x1000>;
+			clocks = <&crg HI3519_FIXED_3M>;
+			status = "disable";
+		};
+
+		dual_timer1: timer@12001000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <0 66 4>, <0 67 4>;
+			reg = <0x12001000 0x1000>;
+			clocks = <&crg HI3519_FIXED_3M>;
+			status = "disable";
+		};
+
+		dual_timer2: timer@12002000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <0 68 4>, <0 69 4>;
+			reg = <0x12002000 0x1000>;
+			clocks = <&crg HI3519_FIXED_3M>;
+			status = "disable";
+		};
+
+		spi_bus0: spi@12120000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x12120000 0x1000>;
+			interrupts = <0 9 4>;
+			clocks = <&crg HI3519_SPI0_CLK>;
+			clock-names = "apb_pclk";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
+		spi_bus1: spi@12121000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x12121000 0x1000>;
+			interrupts = <0 10 4>;
+			clocks = <&crg HI3519_SPI1_CLK>;
+			clock-names = "apb_pclk";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
+		spi_bus2: spi@12122000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x12122000 0x1000>;
+			interrupts = <0 11 4>;
+			clocks = <&crg HI3519_SPI2_CLK>;
+			clock-names = "apb_pclk";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
+		sysctrl: system-controller@12020000 {
+			compatible = "hisilicon,hi3519-sysctrl", "syscon";
+			reg = <0x12020000 0x1000>;
+		};
+
+		reboot {
+			compatible = "syscon-reboot";
+			regmap = <&sysctrl>;
+			offset = <0x4>;
+			mask = <0xdeadbeef>;
+		};
+
+		crg: clock-reset-controller@12010000 {
+			compatible = "hisilicon,hi3519-crg";
+			#clock-cells = <1>;
+			#reset-cells = <2>;
+			reg = <0x12010000 0x10000>;
+		};
+	};
+};
-- 
1.9.1

