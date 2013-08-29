Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:60405 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756045Ab3H2LvE (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 29 Aug 2013 07:51:04 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so352561pdj.22
        for <devicetree@vger.kernel.org>; Thu, 29 Aug 2013 04:51:03 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 1/2] usb: samsung: Update Exynos EHCI/OHCI bindings documentation
Date: Thu, 29 Aug 2013 17:03:25 +0530
Message-Id: <1377776006-22972-1-git-send-email-sachin.kamat@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, swarren@wwwdotorg.org, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org
List-ID: <devicetree@vger.kernel.org>

Updated the document as per the latest implementation.
While at it also fixed some trivial typos.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Changes since v1:
* Updated review comments from Stephen Warren regarding the wording
and some styling.
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   29 ++++++++++----------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index d967ba1..56468f7 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -5,13 +5,14 @@ The device node has following properties.
 
 EHCI
 Required properties:
- - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
-   EHCI controller in host mode.
+ - compatible: should be one of the following for USB 2.0 EHCI controller:
+	(a) "samsung,exynos5440-ehci" for Exynos5440 SoC
+	(b) "samsung,exynos4210-ehci" for all other Exynos4 and 5 SoCs
  - reg: physical base address of the controller and length of memory mapped
    region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
+ - interrupts: interrupt number to the CPU.
+ - clocks: from common clock binding: handle to USB clock.
+ - clock-names: shall be "usbhost".
 
 Optional properties:
  - samsung,vbus-gpio:  if present, specifies the GPIO that
@@ -23,7 +24,7 @@ Example:
 		compatible = "samsung,exynos4210-ehci";
 		reg = <0x12110000 0x100>;
 		interrupts = <0 71 0>;
-		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+		samsung,vbus-gpio = <&gpx2 6 0>;
 
 		clocks = <&clock 285>;
 		clock-names = "usbhost";
@@ -31,13 +32,14 @@ Example:
 
 OHCI
 Required properties:
- - compatible: should be "samsung,exynos4210-ohci" for USB 2.0
-   OHCI companion controller in host mode.
+ - compatible: should be one of the following for USB 2.0 OHCI controller:
+	(a) "samsung,exynos5440-ohci" for Exynos5440 SoC
+	(b) "samsung,exynos4210-ohci" for all other Exynos4 and 5 SoCs
  - reg: physical base address of the controller and length of memory mapped
    region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
+ - interrupts: interrupt number to the CPU.
+ - clocks: from common clock binding: handle to USB clock.
+ - clock-names: shall be "usbhost".
 
 Example:
 	usb@12120000 {
@@ -53,12 +55,11 @@ DWC3
 Required properties:
  - compatible: should be "samsung,exynos5250-dwusb3" for USB 3.0 DWC3
 	       controller.
- - #address-cells, #size-cells : should be '1' if the device has sub-nodes
-				 with 'reg' property.
+ - #address-cells, #size-cells: should be '1'.
  - ranges: allows valid 1:1 translation between child's address space and
 	   parent's address space
  - clocks: Clock IDs array as required by the controller.
- - clock-names: names of clocks correseponding to IDs in the clock property
+ - clock-names: shall be "usbdrd30".
 
 Sub-nodes:
 The dwc3 core should be added as subnode to Exynos dwc3 glue.
-- 
1.7.9.5

