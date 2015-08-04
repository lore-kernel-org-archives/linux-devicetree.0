From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM64: dts: mt6795: enable basic SMP bringup for MT6795
Date: Tue, 4 Aug 2015 10:47:37 +0800
Message-ID: <1438656457-60278-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support SMP on MediaTek MT6795 Cortex-A53 Octa-core SoC.

The patch is based on v4.2-rc1 and following patch series:
(1) Mars Cheng's "Add mt6795 basic chip support" [1]

[1] https://lkml.org/lkml/2015/7/14/63

Signed-off-by: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index da200e7..c85659d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -20,6 +20,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -27,48 +32,56 @@
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x000>;
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x001>;
 		};
 
 		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x002>;
 		};
 
 		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x003>;
 		};
 
 		cpu4: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x100>;
 		};
 
 		cpu5: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x101>;
 		};
 
 		cpu6: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x102>;
 		};
 
 		cpu7: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
+			enable-method = "psci";
 			reg = <0x103>;
 		};
 	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
