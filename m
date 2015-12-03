From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Thu, 3 Dec 2015 10:44:28 +0800
Message-ID: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>, gaofei@hisilicon.com, ml.yang@hisilicon.com, yanghongwei@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add dts files for hi3519-demb board

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 arch/arm/boot/dts/Makefile        |   2 +
 arch/arm/boot/dts/hi3519-demb.dts |  55 ++++++++++++++++
 arch/arm/boot/dts/hi3519.dtsi     | 129 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 arch/arm/boot/dts/hi3519-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3519.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30bbc37..39ad947 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -133,6 +133,8 @@ dtb-$(CONFIG_ARCH_EXYNOS5) += \
 	exynos5440-sd5v1.dtb \
 	exynos5440-ssdk5440.dtb \
 	exynos5800-peach-pi.dtb
+dtb-$(CONFIG_ARCH_HI3519) += \
+	hi3519-demb.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
 	hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIX5HD2) += \
diff --git a/arch/arm/boot/dts/hi3519-demb.dts b/arch/arm/boot/dts/hi3519-demb.dts
new file mode 100644
index 0000000..c7a1720
--- /dev/null
+++ b/arch/arm/boot/dts/hi3519-demb.dts
@@ -0,0 +1,55 @@
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
+	chosen {
+		bootargs = "mem=64M console=ttyAMA0,115200 early_printk \
+root=/dev/mtdblock2 rootfstype=jffs2 \
+mtdparts=hi_sfc:1M(boot),4M(kernel),11M(rootfs)";
+	};
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
index 0000000..32f08e6
--- /dev/null
+++ b/arch/arm/boot/dts/hi3519.dtsi
@@ -0,0 +1,129 @@
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
+#include "skeleton.dtsi"
+#include <dt-bindings/clock/hi3519-clock.h>
+/ {
+	aliases {
+		serial0 = &uart0;
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
+		amba {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "arm,amba-bus";
+			ranges;
+
+			uart0: uart@12100000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12100000 0x1000>;
+				interrupts = <0 4 4>;
+				clocks = <&crg HI3519_UART0_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart1: uart@12101000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12101000 0x1000>;
+				interrupts = <0 5 4>;
+				clocks = <&crg HI3519_UART1_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart2: uart@12102000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12102000 0x1000>;
+				interrupts = <0 6 4>;
+				clocks = <&crg HI3519_UART2_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart3: uart@12103000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12103000 0x1000>;
+				interrupts = <0 7 4>;
+				clocks = <&crg HI3519_UART3_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart4: uart@12104000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12104000 0x1000>;
+				interrupts = <0 8 4>;
+				clocks = <&crg HI3519_UART4_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			dual_timer0: dual_timer@12000000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 64 4>, <0 65 4>;
+				reg = <0x12000000 0x1000>;
+				clocks = <&crg HI3519_FIXED_3M>;
+				status = "disable";
+			};
+
+			dual_timer1: dual_timer@12001000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 66 4>, <0 67 4>;
+				reg = <0x12001000 0x1000>;
+				clocks = <&crg HI3519_FIXED_3M>;
+				status = "disable";
+			};
+
+			dual_timer2: dual_timer@12002000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 68 4>, <0 69 4>;
+				reg = <0x12002000 0x1000>;
+				clocks = <&crg HI3519_FIXED_3M>;
+				status = "disable";
+			};
+		};
+
+		sysctrl: system-controller@12020000 {
+			compatible = "hisilicon,sysctrl";
+			reg = <0x12020000 0x1000>;
+			reboot-offset = <0x4>;
+		};
+
+		crg: crg@12010000 {
+			compatible = "hisilicon,hi3519-crg";
+			#clock-cells = <1>;
+			#reset-cells = <2>;
+			reg = <0x12010000 0x10000>;
+		};
+	};
+};
-- 
1.9.1
