Return-Path: <sachin.kamat@linaro.org>
Return-Path: <sachin.kamat@linaro.org>
From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 1/2] usb: samsung: Update Exynos ehci/ohci bindings documentation
Date: Wed, 14 Aug 2013 16:52:56 +0530
Message-Id: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
To: devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, robherring2@gmail.com, sachin.kamat@linaro.org
List-ID: <devicetree@vger.kernel.org>

Updated the document as per the latest implementation.
While at it also fixed some trivial typos.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   38 +++++++++++---------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index d967ba1..16a2c0f 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -5,13 +5,15 @@ The device node has following properties.
 
 EHCI
 Required properties:
- - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
-   EHCI controller in host mode.
- - reg: physical base address of the controller and length of memory mapped
+ - compatible : should be one of the following for USB 2.0 EHCI controller
+		in host mode:
+	(a) "samsung,exynos5440-ehci" for Exynos5440 SoC
+	(b) "samsung,exynos4210-ehci" for all other Exynos4 and 5 SoCs
+ - reg : physical base address of the controller and length of memory mapped
    region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
+ - interrupts : interrupt number to the CPU.
+ - clocks : from common clock binding: handle to USB clock.
+ - clock-names : from common clock binding: Shall be "usbhost".
 
 Optional properties:
  - samsung,vbus-gpio:  if present, specifies the GPIO that
@@ -23,7 +25,7 @@ Example:
 		compatible = "samsung,exynos4210-ehci";
 		reg = <0x12110000 0x100>;
 		interrupts = <0 71 0>;
-		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+		samsung,vbus-gpio = <&gpx2 6 0>;
 
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
@@ -31,13 +33,15 @@ Example:
 
 OHCI
 Required properties:
- - compatible: should be "samsung,exynos4210-ohci" for USB 2.0
-   OHCI companion controller in host mode.
- - reg: physical base address of the controller and length of memory mapped
+ - compatible : should be one of the following for USB 2.0 OHCI companion
+		controller in host mode:
+	(a) "samsung,exynos5440-ohci" for Exynos5440 SoC
+	(b) "samsung,exynos4210-ohci" for all other Exynos4 and 5 SoCs
+ - reg : physical base address of the controller and length of memory mapped
    region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
+ - interrupts : interrupt number to the CPU.
+ - clocks : from common clock binding: handle to USB clock.
+ - clock-names : from common clock binding: Shall be "usbhost".
 
 Example:
 	usb@12120000 {
@@ -51,14 +55,14 @@ Example:
 
 DWC3
 Required properties:
- - compatible: should be "samsung,exynos5250-dwusb3" for USB 3.0 DWC3
+ - compatible : should be "samsung,exynos5250-dwusb3" for USB 3.0 DWC3
 	       controller.
  - #address-cells, #size-cells : should be '1' if the device has sub-nodes
 				 with 'reg' property.
- - ranges: allows valid 1:1 translation between child's address space and
+ - ranges : allows valid 1:1 translation between child's address space and
 	   parent's address space
- - clocks: Clock IDs array as required by the controller.
- - clock-names: names of clocks correseponding to IDs in the clock property
+ - clocks : Clock IDs array as required by the controller.
+ - clock-names : names of clocks corresponding to IDs in the clock property
 
 Sub-nodes:
 The dwc3 core should be added as subnode to Exynos dwc3 glue.
-- 
1.7.9.5
