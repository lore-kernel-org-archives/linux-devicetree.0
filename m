From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM64: zynqmp: Use 64bit size cell format
Date: Mon, 16 May 2016 09:26:08 +0200
Message-ID: <7dbe1a3398fb0dc2ab6ecaec7d5736c691db0f37.1463383564.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shubhrajyoti Datta <shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use 64bit size cell format instead of 32bit for memory
description.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

Changes in v2:
- Use ranges for PS amba busses instead of changing them to
  64 size cell

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index acb0527fdc4a..358089687a69 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -29,7 +29,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x0 0x0 0x40000000>;
+		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 38c43103d610..cb8f09cb03cf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -14,7 +14,7 @@
 / {
 	compatible = "xlnx,zynqmp";
 	#address-cells = <2>;
-	#size-cells = <1>;
+	#size-cells = <2>;
 
 	cpus {
 		#address-cells = <1>;
@@ -75,7 +75,7 @@
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0 0 0 0 0xffffffff>;
 
 		gic: interrupt-controller@f9010000 {
 			compatible = "arm,gic-400", "arm,cortex-a15-gic";
@@ -94,7 +94,7 @@
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
+		ranges = <0 0 0 0 0xffffffff>;
 
 		can0: can@ff060000 {
 			compatible = "xlnx,zynq-can-1.0";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
