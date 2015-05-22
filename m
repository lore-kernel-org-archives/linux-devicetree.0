From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 4/6] arm64: Juno: Add GICv2m support in device tree.
Date: Fri, 22 May 2015 12:13:08 +0100
Message-ID: <1432293190-13012-5-git-send-email-Liviu.Dudau@arm.com>
References: <1432293190-13012-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432293190-13012-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Juno contains a GICv2m extension for handling PCIe MSI messages.
Add a node declaring the first frame of the extension.

Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Acked-by: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index b7e862f..e3ee960 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -23,10 +23,17 @@
 		      <0x0 0x2c02f000 0 0x2000>,
 		      <0x0 0x2c04f000 0 0x2000>,
 		      <0x0 0x2c06f000 0 0x2000>;
-		#address-cells = <0>;
+		#address-cells = <2>;
 		#interrupt-cells = <3>;
+		#size-cells = <2>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		ranges = <0 0 0 0x2c1c0000 0 0x40000>;
+		v2m_0: v2m@0 {
+			compatible = "arm,gic-v2m-frame";
+			msi-controller;
+			reg = <0 0 0 0x1000>;
+		};
 	};
 
 	timer {
@@ -129,19 +136,19 @@
 
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 15>;
-		interrupt-map = <0 0  0 &gic 0  68 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  1 &gic 0  69 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  2 &gic 0  70 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  3 &gic 0 160 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  4 &gic 0 161 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  5 &gic 0 162 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  6 &gic 0 163 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  7 &gic 0 164 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  8 &gic 0 165 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  9 &gic 0 166 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 10 &gic 0 167 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 11 &gic 0 168 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 12 &gic 0 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map = <0 0  0 &gic 0 0 0  68 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  1 &gic 0 0 0  69 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  2 &gic 0 0 0  70 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  3 &gic 0 0 0 160 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  4 &gic 0 0 0 161 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  5 &gic 0 0 0 162 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  6 &gic 0 0 0 163 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  7 &gic 0 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  8 &gic 0 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  9 &gic 0 0 0 166 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 10 &gic 0 0 0 167 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 11 &gic 0 0 0 168 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 12 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>;
 
 		/include/ "juno-motherboard.dtsi"
 	};
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
