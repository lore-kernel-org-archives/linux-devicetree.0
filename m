From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: foundation-v8: Enable PSCI mode
Date: Mon, 18 Sep 2017 16:38:32 +0100
Message-ID: <20170918153832.16356-1-daniel.thompson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently if the Foundation model is running ARM Trusted Firmware then
the kernel, which is configured to use spin tables, cannot start secondary
processors or "power off" the simulation.

Add a couple of labels to the include file, and introduce a new .dts
file that uses these to override the enable-method.

Signed-off-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/arm/Makefile                   |  3 +-
 .../boot/dts/arm/foundation-v8-gicv3-psci.dts      | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  8 ++--
 3 files changed, 57 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/arm/foundation-v8-gicv3-psci.dts

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index 75cc2aa10101..c9ec88809f3d 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -1,4 +1,5 @@
-dtb-$(CONFIG_ARCH_VEXPRESS) += foundation-v8.dtb foundation-v8-gicv3.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += \
+	foundation-v8.dtb foundation-v8-gicv3.dtb foundation-v8-gicv3-psci.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb juno-r1.dtb juno-r2.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv3-psci.dts b/arch/arm64/boot/dts/arm/foundation-v8-gicv3-psci.dts
new file mode 100644
index 000000000000..94a249095104
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv3-psci.dts
@@ -0,0 +1,51 @@
+/*
+ * ARM Ltd.
+ *
+ * ARMv8 Foundation model DTS (GICv3 configuration)
+ */
+
+#include "foundation-v8.dtsi"
+
+/ {
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@2f000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-controller;
+		reg =	<0x0 0x2f000000 0x0 0x10000>,
+			<0x0 0x2f100000 0x0 0x200000>,
+			<0x0 0x2c000000 0x0 0x2000>,
+			<0x0 0x2c010000 0x0 0x2000>,
+			<0x0 0x2c02f000 0x0 0x2000>;
+		interrupts = <1 9 4>;
+
+		its: its@2f020000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x0 0x2f020000 0x0 0x20000>;
+		};
+	};
+};
+
+&cpu0 {
+	enable-method = "psci";
+};
+
+&cpu1 {
+	enable-method = "psci";
+};
+
+&cpu2 {
+	enable-method = "psci";
+};
+
+&cpu3 {
+	enable-method = "psci";
+};
diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
index 8ecdd4331980..8c7f8c4f090a 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
@@ -28,7 +28,7 @@
 		#address-cells = <2>;
 		#size-cells = <0>;

-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,armv8";
 			reg = <0x0 0x0>;
@@ -36,7 +36,7 @@
 			cpu-release-addr = <0x0 0x8000fff8>;
 			next-level-cache = <&L2_0>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,armv8";
 			reg = <0x0 0x1>;
@@ -44,7 +44,7 @@
 			cpu-release-addr = <0x0 0x8000fff8>;
 			next-level-cache = <&L2_0>;
 		};
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,armv8";
 			reg = <0x0 0x2>;
@@ -52,7 +52,7 @@
 			cpu-release-addr = <0x0 0x8000fff8>;
 			next-level-cache = <&L2_0>;
 		};
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,armv8";
 			reg = <0x0 0x3>;
--
2.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
