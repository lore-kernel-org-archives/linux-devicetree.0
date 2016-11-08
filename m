From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/2] gpio: xilinx: dt-binding: Add clock node
Date: Tue, 8 Nov 2016 10:43:09 +0530
Message-ID: <1478581990-28276-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: soren.brinkmann@xilinx.com, michal.simek@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add the clock node to the dt binding.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../devicetree/bindings/gpio/gpio-xilinx.txt       |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
index 63bf4be..0821b9d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
@@ -11,6 +11,7 @@ Required properties:
 - #gpio-cells : Should be two. The first cell is the pin number and the
   second cell is used to specify optional parameters (currently unused).
 - gpio-controller : Marks the device node as a GPIO controller.
+- clocks: Input clock specifier. Refer to common clock bindings.
 
 Optional properties:
 - interrupts : Interrupt mapping for GPIO IRQ.
@@ -25,12 +26,14 @@ Optional properties:
 - xlnx,dout-default-2 : as above but the second channel
 - xlnx,gpio2-width : as above but for the second channel
 - xlnx,tri-default-2 : as above but for the second channel
+- clock-names: Input clock name
 
 
 Example:
 gpio: gpio@40000000 {
 	#gpio-cells = <2>;
 	compatible = "xlnx,xps-gpio-1.00.a";
+	clocks = <&clkc 15>;
 	gpio-controller ;
 	interrupt-parent = <&microblaze_0_intc>;
 	interrupts = < 6 2 >;
-- 
1.7.1

