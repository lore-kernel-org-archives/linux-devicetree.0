Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:51143 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756045Ab3H2LvI (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 29 Aug 2013 07:51:08 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb10so820945pad.37
        for <devicetree@vger.kernel.org>; Thu, 29 Aug 2013 04:51:07 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/2] usb: phy: samsung: Update usbphy documentation
Date: Thu, 29 Aug 2013 17:03:26 +0530
Message-Id: <1377776006-22972-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1377776006-22972-1-git-send-email-sachin.kamat@linaro.org>
References: <1377776006-22972-1-git-send-email-sachin.kamat@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, swarren@wwwdotorg.org, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org
List-ID: <devicetree@vger.kernel.org>

Updated the documentation as per the latest driver implementation.
While at it also fixed some trivial typos.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Felipe Balbi <balbi@ti.com>
---
 .../devicetree/bindings/usb/samsung-usbphy.txt     |   53 ++++++++------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
index 33fd354..a088a30 100644
--- a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
+++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
@@ -1,40 +1,35 @@
 SAMSUNG USB-PHY controllers
 
-** Samsung's usb 2.0 phy transceiver
+** Samsung USB 2.0 phy transceiver
 
-The Samsung's usb 2.0 phy transceiver is used for controlling
-usb 2.0 phy for s3c-hsotg as well as ehci-s5p and ohci-exynos
-usb controllers across Samsung SOCs.
+The Samsung USB 2.0 phy transceiver is used for controlling
+USB 2.0 phy for s3c-hsotg as well as ehci-s5p and ohci-exynos
+USB controllers across Samsung SOCs.
 TODO: Adding the PHY binding with controller(s) according to the under
 development generic PHY driver.
 
 Required properties:
 
-Exynos4210:
-- compatible : should be "samsung,exynos4210-usb2phy"
-- reg : base physical address of the phy registers and length of memory mapped
+- compatible: value should be one among the following:
+	(a) "samsung,s3c64xx-usb2phy" for S3C64xx SoCs
+	(b) "samsung,exynos4210-usb2phy" for Exynos4210 SoC
+	(c) "samsung,exynos4x12-usb2phy" for Exynos4x12 SoCs
+	(d) "samsung,exynos5250-usb2phy" for Exynos5250 SoC
+- reg: base physical address of the phy registers and length of memory mapped
 	region.
 - clocks: Clock IDs array as required by the controller.
-- clock-names: names of clock correseponding IDs clock property as requested
-	       by the controller driver.
-
-Exynos5250:
-- compatible : should be "samsung,exynos5250-usb2phy"
-- reg : base physical address of the phy registers and length of memory mapped
-	region.
+- clock-names: shall be "usbhost" for Exynos5250 and "otg" for others.
 
 Optional properties:
-- #address-cells: should be '1' when usbphy node has a child node with 'reg'
-		  property.
-- #size-cells: should be '1' when usbphy node has a child node with 'reg'
-	       property.
+- #address-cells: should be '1'.
+- #size-cells: should be '1'.
 - ranges: allows valid translation between child's address space and parent's
 	  address space.
 
 - The child node 'usbphy-sys' to the node 'usbphy' is for the system controller
   interface for usb-phy. It should provide the following information required by
   usb-phy controller to control phy.
-  - reg : base physical address of PHY_CONTROL registers.
+  - reg: base physical address of PHY_CONTROL registers.
 	  The size of this register is the total sum of size of all PHY_CONTROL
 	  registers that the SoC has. For example, the size will be
 	  '0x4' in case we have only one PHY_CONTROL register (e.g.
@@ -62,28 +57,24 @@ Example:
 		};
 	};
 
+** Samsung USB 3.0 phy transceiver
 
-** Samsung's usb 3.0 phy transceiver
-
-Starting exynso5250, Samsung's SoC have usb 3.0 phy transceiver
-which is used for controlling usb 3.0 phy for dwc3-exynos usb 3.0
+Starting Exynos5250, Samsung SoCs have USB 3.0 phy transceiver
+which is used for controlling USB 3.0 phy for dwc3-exynos USB 3.0
 controllers across Samsung SOCs.
 
 Required properties:
 
 Exynos5250:
-- compatible : should be "samsung,exynos5250-usb3phy"
-- reg : base physical address of the phy registers and length of memory mapped
+- compatible: should be "samsung,exynos5250-usb3phy"
+- reg: base physical address of the phy registers and length of memory mapped
 	region.
 - clocks: Clock IDs array as required by the controller.
-- clock-names: names of clocks correseponding to IDs in the clock property
-	       as requested by the controller driver.
+- clock-names: shall be "usbdrd30".
 
 Optional properties:
-- #address-cells: should be '1' when usbphy node has a child node with 'reg'
-		  property.
-- #size-cells: should be '1' when usbphy node has a child node with 'reg'
-	       property.
+- #address-cells: should be '1'.
+- #size-cells: should be '1'.
 - ranges: allows valid translation between child's address space and parent's
 	  address space.
 
-- 
1.7.9.5

