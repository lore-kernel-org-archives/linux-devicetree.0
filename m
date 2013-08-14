Return-Path: <sachin.kamat@linaro.org>
Return-Path: <sachin.kamat@linaro.org>
From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 2/2] usb: phy: samsung: Update usbphy documentation
Date: Wed, 14 Aug 2013 16:52:57 +0530
Message-Id: <1376479377-15732-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
References: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
To: devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, robherring2@gmail.com, sachin.kamat@linaro.org
List-ID: <devicetree@vger.kernel.org>

Updated the documentation as per the latest driver implementation.
While at it also fixed some trivial typos.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Felipe Balbi <balbi@ti.com>
---
 .../devicetree/bindings/usb/samsung-usbphy.txt     |   48 ++++++++++----------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
index 33fd354..62e6f17 100644
--- a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
+++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
@@ -1,34 +1,32 @@
 SAMSUNG USB-PHY controllers
 
-** Samsung's usb 2.0 phy transceiver
+** Samsung's USB 2.0 phy transceiver
 
-The Samsung's usb 2.0 phy transceiver is used for controlling
-usb 2.0 phy for s3c-hsotg as well as ehci-s5p and ohci-exynos
-usb controllers across Samsung SOCs.
+The Samsung's USB 2.0 phy transceiver is used for controlling
+USB 2.0 phy for s3c-hsotg as well as ehci-s5p and ohci-exynos
+USB controllers across Samsung SOCs.
 TODO: Adding the PHY binding with controller(s) according to the under
 development generic PHY driver.
 
 Required properties:
 
-Exynos4210:
-- compatible : should be "samsung,exynos4210-usb2phy"
-- reg : base physical address of the phy registers and length of memory mapped
-	region.
-- clocks: Clock IDs array as required by the controller.
-- clock-names: names of clock correseponding IDs clock property as requested
-	       by the controller driver.
-
-Exynos5250:
-- compatible : should be "samsung,exynos5250-usb2phy"
+- compatible : value should be one among the following:
+	(a) "samsung,s3c64xx-usb2phy" for S3C64xx SoCs
+	(b) "samsung,exynos4210-usb2phy" for Exynos4210 SoC
+	(c) "samsung,exynos4x12-usb2phy" for Exynos4x12 SoCs
+	(d) "samsung,exynos5250-usb2phy" for Exynos5250 SoC
 - reg : base physical address of the phy registers and length of memory mapped
 	region.
+- clocks : Clock IDs array as required by the controller.
+- clock-names : names of clocks listed in clocks property in the same order
+	       as requested by the controller driver.
 
 Optional properties:
-- #address-cells: should be '1' when usbphy node has a child node with 'reg'
+- #address-cellsi : should be '1' when usbphy node has a child node with 'reg'
 		  property.
-- #size-cells: should be '1' when usbphy node has a child node with 'reg'
+- #size-cells : should be '1' when usbphy node has a child node with 'reg'
 	       property.
-- ranges: allows valid translation between child's address space and parent's
+- ranges : allows valid translation between child's address space and parent's
 	  address space.
 
 - The child node 'usbphy-sys' to the node 'usbphy' is for the system controller
@@ -63,10 +61,10 @@ Example:
 	};
 
 
-** Samsung's usb 3.0 phy transceiver
+** Samsung's USB 3.0 phy transceiver
 
-Starting exynso5250, Samsung's SoC have usb 3.0 phy transceiver
-which is used for controlling usb 3.0 phy for dwc3-exynos usb 3.0
+Starting Exynos5250, Samsung's SoC have USB 3.0 phy transceiver
+which is used for controlling USB 3.0 phy for dwc3-exynos USB 3.0
 controllers across Samsung SOCs.
 
 Required properties:
@@ -75,16 +73,16 @@ Exynos5250:
 - compatible : should be "samsung,exynos5250-usb3phy"
 - reg : base physical address of the phy registers and length of memory mapped
 	region.
-- clocks: Clock IDs array as required by the controller.
-- clock-names: names of clocks correseponding to IDs in the clock property
+- clocks : Clock IDs array as required by the controller.
+- clock-names : names of clocks correseponding to IDs in the clock property
 	       as requested by the controller driver.
 
 Optional properties:
-- #address-cells: should be '1' when usbphy node has a child node with 'reg'
+- #address-cells : should be '1' when usbphy node has a child node with 'reg'
 		  property.
-- #size-cells: should be '1' when usbphy node has a child node with 'reg'
+- #size-cells : should be '1' when usbphy node has a child node with 'reg'
 	       property.
-- ranges: allows valid translation between child's address space and parent's
+- ranges : allows valid translation between child's address space and parent's
 	  address space.
 
 - The child node 'usbphy-sys' to the node 'usbphy' is for the system controller
-- 
1.7.9.5
