From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] arm64: dts: juno: replace underscores with hyphen in device node names
Date: Wed,  2 Aug 2017 16:24:07 +0100
Message-ID: <1501687447-28075-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since underscores('_') are not allowed in the device tree nodes names,
replace all of them with hyphen('-') in device node names. Note that
underscores are however allowed in labels.

Reported-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/foundation-v8.dtsi       |  2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi           | 12 ++++++------
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
index 7cfa8e414e7f..8ecdd4331980 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
@@ -226,7 +226,7 @@
 				clock-names = "uartclk", "apb_pclk";
 			};
 
-			virtio_block@0130000 {
+			virtio-block@0130000 {
 				compatible = "virtio,mmio";
 				reg = <0x130000 0x200>;
 				interrupts = <42>;
diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 56f7ac20ae5e..fbafe62d6b22 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -201,7 +201,7 @@
 		};
 	};
 
-	cpu_debug0: cpu_debug@22010000 {
+	cpu_debug0: cpu-debug@22010000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x22010000 0x0 0x1000>;
 
@@ -260,7 +260,7 @@
 		};
 	};
 
-	cpu_debug1: cpu_debug@22110000 {
+	cpu_debug1: cpu-debug@22110000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x22110000 0x0 0x1000>;
 
@@ -283,7 +283,7 @@
 		};
 	};
 
-	cpu_debug2: cpu_debug@23010000 {
+	cpu_debug2: cpu-debug@23010000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23010000 0x0 0x1000>;
 
@@ -356,7 +356,7 @@
 		};
 	};
 
-	cpu_debug3: cpu_debug@23110000 {
+	cpu_debug3: cpu-debug@23110000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23110000 0x0 0x1000>;
 
@@ -379,7 +379,7 @@
 		};
 	};
 
-	cpu_debug4: cpu_debug@23210000 {
+	cpu_debug4: cpu-debug@23210000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23210000 0x0 0x1000>;
 
@@ -402,7 +402,7 @@
 		};
 	};
 
-	cpu_debug5: cpu_debug@23310000 {
+	cpu_debug5: cpu-debug@23310000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23310000 0x0 0x1000>;
 
diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index 161ac98418a3..528875c75598 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -219,7 +219,7 @@
 				};
 			};
 
-			virtio_block@0130000 {
+			virtio-block@0130000 {
 				compatible = "virtio,mmio";
 				reg = <0x130000 0x200>;
 				interrupts = <42>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
