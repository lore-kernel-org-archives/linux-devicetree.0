From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: add dts files for Hisilicon Hip05-D02 Development Board
Date: Sat, 29 Aug 2015 16:52:41 +0800
Message-ID: <1440838361-1468-3-git-send-email-dingtianhong@huawei.com>
References: <1440838361-1468-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440838361-1468-1-git-send-email-dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add initial dtsi file to support Hisilicon Hip05-D02 Board with
support of CPUs in four clusters and each cluster has quard Cortex-A57.

Also add dts file to support Hip05-D02 development board.

Signed-off-by: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/Makefile      |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts |  36 ++++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi    | 271 ++++++++++++++++++++++++++++
 3 files changed, 308 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05-d02.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05.dtsi

diff --git a/arch/arm64/boot/dts/hisilicon/Makefile b/arch/arm64/boot/dts/hisilicon/Makefile
index fa81a6e..cd158b8 100644
--- a/arch/arm64/boot/dts/hisilicon/Makefile
+++ b/arch/arm64/boot/dts/hisilicon/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_HISI) += hi6220-hikey.dtb
+dtb-$(CONFIG_ARCH_HISI) += hi6220-hikey.dtb hip05-d02.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
new file mode 100644
index 0000000..ae34e25
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -0,0 +1,36 @@
+/**
+ * dts file for Hisilicon D02 Development Board
+ *
+ * Copyright (C) 2014,2015 Hisilicon Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * publishhed by the Free Software Foundation.
+ *
+ */
+
+/dts-v1/;
+
+#include "hip05.dtsi"
+
+/ {
+	model = "Hisilicon Hip05 D02 Development Board";
+	compatible = "hisilicon,hip05-d02";
+
+	memory@00000000 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
new file mode 100644
index 0000000..da12d94
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -0,0 +1,271 @@
+/**
+ * dts file for Hisilicon D02 Development Board
+ *
+ * Copyright (C) 2014,2015 Hisilicon Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * publishhed by the Free Software Foundation.
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "hisilicon,hip05-d02";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+			cluster2 {
+				core0 {
+					cpu = <&cpu8>;
+				};
+				core1 {
+					cpu = <&cpu9>;
+				};
+				core2 {
+					cpu = <&cpu10>;
+				};
+				core3 {
+					cpu = <&cpu11>;
+				};
+			};
+			cluster3 {
+				core0 {
+					cpu = <&cpu12>;
+				};
+				core1 {
+					cpu = <&cpu13>;
+				};
+				core2 {
+					cpu = <&cpu14>;
+				};
+				core3 {
+					cpu = <&cpu15>;
+				};
+			};
+		};
+
+		cpu0: cpu@20000 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20000>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@20001 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20001>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@20002 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20002>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@20003 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20003>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@20100 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20100>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@20101 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20101>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@20102 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20102>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@20103 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20103>;
+			enable-method = "psci";
+		};
+
+		cpu8: cpu@20200 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20200>;
+			enable-method = "psci";
+		};
+
+		cpu9: cpu@20201 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20201>;
+			enable-method = "psci";
+		};
+
+		cpu10: cpu@20202 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20202>;
+			enable-method = "psci";
+		};
+
+		cpu11: cpu@20203 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20203>;
+			enable-method = "psci";
+		};
+
+		cpu12: cpu@20300 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20300>;
+			enable-method = "psci";
+		};
+
+		cpu13: cpu@20301 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20301>;
+			enable-method = "psci";
+		};
+
+		cpu14: cpu@20302 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20302>;
+			enable-method = "psci";
+		};
+
+		cpu15: cpu@20303 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x20303>;
+			enable-method = "psci";
+		};
+	};
+
+	gic: interrupt-controller@8d000000 {
+		compatible = "arm,gic-v3";
+                #interrupt-cells = <3>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+                interrupt-controller;
+                #redistributor-regions = <1>;
+                redistributor-stride = <0x0 0x30000>;
+		reg = <0x0 0x8d000000 0 0x10000>,	/* GICD */
+		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
+		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
+		      <0x0 0xfe010000 0 0x10000>,       /* GICH */
+		      <0x0 0xfe020000 0 0x10000>;       /* GICV */
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+
+		its_totems: interrupt-controller@8c000000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x0 0x8c000000 0x0 0x1000000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		refclk200mhz: refclk200mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+		};
+
+		uart0: uart@80300000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x80300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&refclk200mhz>;
+			clock-names = "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: uart@80310000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x80310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&refclk200mhz>;
+			clock-names = "apb_pclk";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+	};
+};
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
