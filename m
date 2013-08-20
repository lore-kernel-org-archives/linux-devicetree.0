Return-Path: <devicetree-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57179 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab3HTQgQ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:36:16 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 04/11] usb: usb: dsps: update device tree bindings
Date: Tue, 20 Aug 2013 18:35:46 +0200
Message-Id: <1377016553-26478-5-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1377016553-26478-1-git-send-email-bigeasy@linutronix.de>
References: <1377016553-26478-1-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The support for both am335x-USB instances required changes to the device
tree bindings. This patch reflects these changes in the bindings
document.

v3…v4:
- remove the child node for USB. This is driver specific on won't be
  reflected in the device tree
- use the "mentor" prefix instead of "mg".
- use "dr_mode" istead of "mg,port-mode" for the port mode. The former
  is used by a few other drivers.

v2…v3:
- use proper usb-phy nodes in evm, bone and evmsk device tree.

v1…v2:
- use mg prefix for the Metor Graphics specific attributes
- use power in mA not in mA/2 as specifed in the USB2.0 specification
- use usbX-phy instead of usbX_phy
- use dma-controller instead of dma

Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         | 222 ++++++++++++++++++---
 1 file changed, 192 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index dc9dc8c..20c2ff2 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -1,35 +1,197 @@
-AM33XX MUSB GLUE
- - compatible : Should be "ti,musb-am33xx"
- - reg : offset and length of register sets, first usbss, then for musb instances
- - interrupts : usbss, musb instance interrupts in order
- - ti,hwmods : must be "usb_otg_hs"
- - multipoint : Should be "1" indicating the musb controller supports
-   multipoint. This is a MUSB configuration-specific setting.
- - num-eps : Specifies the number of endpoints. This is also a
-   MUSB configuration-specific setting. Should be set to "16"
- - ram-bits : Specifies the ram address size. Should be set to "12"
- - port0-mode : Should be "3" to represent OTG. "1" signifies HOST and "2"
-   represents PERIPHERAL.
- - port1-mode : Should be "1" to represent HOST. "3" signifies OTG and "2"
-   represents PERIPHERAL.
- - power : Should be "250". This signifies the controller can supply up to
-   500mA when operating in host mode.
+  AM33xx MUSB
+~~~~~~~~~~~~~~~
+- compatible: ti,am33xx-usb
+- reg: offset and length of the usbss register sets
+- ti,hwmods : must be "usb_otg_hs"
+
+The glue layer contains multiple child nodes. It is required the have
+at least a control module node, USB node and a PHY node. The second USB
+node and its PHY node is optional. The DMA node is also optional.
+
+Reset module
+~~~~~~~~~~~~
+- compatible: ti,am335x-usb-ctrl-module
+- reg: offset and length of the "USB control registers" in the "Control
+  Module" block. A second offset and length for the USB wake up control
+  in the same memory block.
+- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
+  the USB wake up control register.
+
+USB PHY
+~~~~~~~
+compatible: ti,am335x-usb-phy
+reg: offset and length of the "USB PHY" register space
+ti,ctrl_mod: reference to the "reset module" node
+reg-names: phy
+The PHY should have a "phy" alias numbered properly in the alias
+node.
+
+USB
+~~~
+- compatible: ti,musb-am33xx
+- reg: offset and length of "USB Controller Registers", and offset and
+  length of "USB Core" register space.
+- reg-names: control for the ""USB Controller Registers" and "mc" for
+  "USB Core" register space
+- interrupts: USB interrupt number
+- interrupt-names: mc
+- dr_mode: Should be one of "host", "peripheral" or "otg".
+- mentor,multipoint: Should be "1" indicating the musb controller supports
+  multipoint. This is a MUSB configuration-specific setting.
+- mentor,num-eps: Specifies the number of endpoints. This is also a
+  MUSB configuration-specific setting. Should be set to "16"
+- mentor,ram-bits: Specifies the ram address size. Should be set to "12"
+- mentor,power: Should be "500". This signifies the controller can supply up to
+  500mA when operating in host mode.
+- phys: reference to the USB phy
+- dmas: specifies the dma channels
+- dma-names: specifies the names of the channels. Use "rxN" for receive
+  and "txN" for transmit endpoints. N specifies the endpoint number.
+
+The controller should have an "usb" alias numbered properly in the alias
+node.
+
+DMA
+~~~
+- compatible: ti,am3359-cppi41
+- reg: offset and length of the following register spaces: USBSS, USB
+  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
+- reg-names: glue, controller, scheduler, queuemgr
+- #dma-cells: should be set to 2. The first number represents the
+  endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
+  for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
+  1 for TX transfers.
+- #dma-channels: should be set to 30 representing the 15 endpoints for
+  each USB instance.
 
 Example:
+~~~~~~~~
+The following example contains all the nodes as used on am335x-evm:
+
+aliases {
+	usb0 = &usb0;
+	usb1 = &usb1;
+	phy0 = &usb0_phy;
+	phy1 = &usb1_phy;
+};
 
-usb@47400000  {
-	compatible = "ti,musb-am33xx";
-	reg = <0x47400000 0x1000	/* usbss */
-	       0x47401000 0x800		/* musb instance 0 */
-	       0x47401800 0x800>;	/* musb instance 1 */
-	interrupts = <17		/* usbss */
-		      18		/* musb instance 0 */
-		      19>;		/* musb instance 1 */
-	multipoint = <1>;
-	num-eps = <16>;
-	ram-bits = <12>;
-	port0-mode = <3>;
-	port1-mode = <3>;
-	power = <250>;
+usb: usb@47400000 {
+	compatible = "ti,am33xx-usb";
+	reg = <0x47400000 0x1000>;
+	ranges;
+	#address-cells = <1>;
+	#size-cells = <1>;
 	ti,hwmods = "usb_otg_hs";
+
+	ctrl_mod: control@44e10000 {
+		compatible = "ti,am335x-usb-ctrl-module";
+		reg = <0x44e10620 0x10
+			0x44e10648 0x4>;
+		reg-names = "phy_ctrl", "wakeup";
+	};
+
+	usb0_phy: usb-phy@47401300 {
+		compatible = "ti,am335x-usb-phy";
+		reg = <0x47401300 0x100>;
+		reg-names = "phy";
+		ti,ctrl_mod = <&ctrl_mod>;
+	};
+
+	usb0: usb@47401000 {
+		compatible = "ti,musb-am33xx";
+		reg = <0x47401400 0x400
+			0x47401000 0x200>;
+		reg-names = "mc", "control";
+
+		interrupts = <18>;
+		interrupt-names = "mc";
+		dr_mode = "otg"
+		mentor,multipoint = <1>;
+		mentor,num-eps = <16>;
+		mentor,ram-bits = <12>;
+		mentor,power = <500>;
+		phys = <&usb0_phy>;
+
+		dmas = <&cppi41dma  0 0 &cppi41dma  1 0
+			&cppi41dma  2 0 &cppi41dma  3 0
+			&cppi41dma  4 0 &cppi41dma  5 0
+			&cppi41dma  6 0 &cppi41dma  7 0
+			&cppi41dma  8 0 &cppi41dma  9 0
+			&cppi41dma 10 0 &cppi41dma 11 0
+			&cppi41dma 12 0 &cppi41dma 13 0
+			&cppi41dma 14 0 &cppi41dma  0 1
+			&cppi41dma  1 1 &cppi41dma  2 1
+			&cppi41dma  3 1 &cppi41dma  4 1
+			&cppi41dma  5 1 &cppi41dma  6 1
+			&cppi41dma  7 1 &cppi41dma  8 1
+			&cppi41dma  9 1 &cppi41dma 10 1
+			&cppi41dma 11 1 &cppi41dma 12 1
+			&cppi41dma 13 1 &cppi41dma 14 1>;
+		dma-names =
+			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
+			"rx14", "rx15",
+			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
+			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
+			"tx14", "tx15";
+	};
+
+	usb1_phy: usb-phy@47401b00 {
+		compatible = "ti,am335x-usb-phy";
+		reg = <0x47401b00 0x100>;
+		reg-names = "phy";
+		ti,ctrl_mod = <&ctrl_mod>;
+	};
+
+	usb1: usb@47401800 {
+		compatible = "ti,musb-am33xx";
+		reg = <0x47401c00 0x400
+			0x47401800 0x200>;
+		reg-names = "mc", "control";
+		interrupts = <19>;
+		interrupt-names = "mc";
+		dr_mode = "host"
+		mentor,multipoint = <1>;
+		mentor,num-eps = <16>;
+		mentor,ram-bits = <12>;
+		mentor,power = <500>;
+		phys = <&usb1_phy>;
+
+		dmas = <&cppi41dma 15 0 &cppi41dma 16 0
+			&cppi41dma 17 0 &cppi41dma 18 0
+			&cppi41dma 19 0 &cppi41dma 20 0
+			&cppi41dma 21 0 &cppi41dma 22 0
+			&cppi41dma 23 0 &cppi41dma 24 0
+			&cppi41dma 25 0 &cppi41dma 26 0
+			&cppi41dma 27 0 &cppi41dma 28 0
+			&cppi41dma 29 0 &cppi41dma 15 1
+			&cppi41dma 16 1 &cppi41dma 17 1
+			&cppi41dma 18 1 &cppi41dma 19 1
+			&cppi41dma 20 1 &cppi41dma 21 1
+			&cppi41dma 22 1 &cppi41dma 23 1
+			&cppi41dma 24 1 &cppi41dma 25 1
+			&cppi41dma 26 1 &cppi41dma 27 1
+			&cppi41dma 28 1 &cppi41dma 29 1>;
+		dma-names =
+			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
+			"rx14", "rx15",
+			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
+			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
+			"tx14", "tx15";
+	};
+
+	cppi41dma: dma-controller@07402000 {
+		compatible = "ti,am3359-cppi41";
+		reg =  <0x47400000 0x1000
+			0x47402000 0x1000
+			0x47403000 0x1000
+			0x47404000 0x4000>;
+		reg-names = "glue", "controller", "scheduler", "queuemgr";
+		interrupts = <17>;
+		interrupt-names = "glue";
+		#dma-cells = <2>;
+		#dma-channels = <30>;
+		#dma-requests = <256>;
+	};
 };
-- 
1.8.4.rc2

