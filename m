From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] ARM: dts: add dts files for hi3519-demb board
Date: Sat, 28 Nov 2015 15:18:00 +0800
Message-ID: <1448695080-31340-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add dts files for hi3519-demb board

Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
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
index 0000000..7422ddc
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
+				clocks = <&clock HI3519_UART0_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart1: uart@12101000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12101000 0x1000>;
+				interrupts = <0 5 4>;
+				clocks = <&clock HI3519_UART1_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart2: uart@12102000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12102000 0x1000>;
+				interrupts = <0 6 4>;
+				clocks = <&clock HI3519_UART2_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart3: uart@12103000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12103000 0x1000>;
+				interrupts = <0 7 4>;
+				clocks = <&clock HI3519_UART3_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			uart4: uart@12104000 {
+				compatible = "arm,pl011", "arm,primecell";
+				reg = <0x12104000 0x1000>;
+				interrupts = <0 8 4>;
+				clocks = <&clock HI3519_UART4_CLK>;
+				clock-names = "apb_pclk";
+				status = "disable";
+			};
+
+			dual_timer0: dual_timer@12000000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 64 4>, <0 65 4>;
+				reg = <0x12000000 0x1000>;
+				clocks = <&clock HI3519_FIXED_3M>;
+				status = "disable";
+			};
+
+			dual_timer1: dual_timer@12001000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 66 4>, <0 67 4>;
+				reg = <0x12001000 0x1000>;
+				clocks = <&clock HI3519_FIXED_3M>;
+				status = "disable";
+			};
+
+			dual_timer2: dual_timer@12002000 {
+				compatible = "arm,sp804", "arm,primecell";
+				interrupts = <0 68 4>, <0 69 4>;
+				reg = <0x12002000 0x1000>;
+				clocks = <&clock HI3519_FIXED_3M>;
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
+		clock: clock0 {
+			compatible = "hisilicon,hi3519-clock";
+			#clock-cells = <1>;
+			#reset-cells = <2>;
+			reg = <0x12010000 0x10000>;
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
