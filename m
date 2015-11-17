From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 7/7] ARM: DTS: meson8b: Add SMP related nodes
Date: Tue, 17 Nov 2015 15:56:42 +0100
Message-ID: <1447772202-12418-8-git-send-email-carlo@caione.org>
References: <1447772202-12418-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447772202-12418-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Add nodes for: SCU, PMU and SRAM. Set also the enable-method for SMP
bringup.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 977d55f..0477a81 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -51,9 +51,20 @@
 / {
 	interrupt-parent = <&gic>;
 
+	scu@c4300000 {
+		compatible = "arm,cortex-a5-scu";
+		reg = <0xc4300000 0x100>;
+	};
+
+	pmu@c81000e4 {
+		compatible = "amlogic,meson8b-pmu", "syscon";
+		reg = <0xc81000e0 0x18>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "amlogic,meson8b-smp";
 
 		cpu@200 {
 			device_type = "cpu";
@@ -88,6 +99,19 @@
 		};
 	};
 
+	sram: sram@d9000000 {
+		compatible = "mmio-sram";
+		reg = <0xd9000000 0x20000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xd9000000 0x20000>;
+
+		smp-sram@1ff80 {
+			compatible = "amlogic,meson8b-smp-sram";
+			reg = <0x1ff80 0x8>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
