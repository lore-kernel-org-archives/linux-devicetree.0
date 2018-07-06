Return-Path: <SRS0=Ye4W=JW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bitwise.fi ([109.204.228.163]:41546 "EHLO mail.bitwise.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753632AbeGFOSe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Jul 2018 10:18:34 -0400
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Subject: [PATCH 1/3] dt-bindings: can: xilinx_can: add Xilinx CAN FD bindings
Date: Fri,  6 Jul 2018 17:18:15 +0300
Message-Id: <20180706141817.19729-2-anssi.hannula@bitwise.fi>
In-Reply-To: <20180706141817.19729-1-anssi.hannula@bitwise.fi>
References: <20180706141817.19729-1-anssi.hannula@bitwise.fi>
Sender: devicetree-owner@vger.kernel.org
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add compatible string and new attributes to support the Xilinx CAN FD
core.

Unlike the previously documented Xilinx CAN cores, the CAN FD core has
TX mailboxes instead of TX FIFO, and optionally RX mailboxes instead of
RX FIFO (selected at core generation time, not switchable at runtime).
Add "tx-mailbox-count" and "rx-mailbox-count" to specify the mailbox
counts instead of reusing "tx-fifo-depth" and "rx-fifo-depth".

The RX FIFO depth is constant 32, but allow it to be specified via
"rx-fifo-depth" to match DT usage with Zynq CAN (which has constant RX
FIFO of depth of 64).

v2: Remove unnecessary "rx-mode" DT property.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: Michal Simek <michal.simek@xilinx.com>
---
 .../devicetree/bindings/net/can/xilinx_can.txt     | 35 ++++++++++++++++------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/xilinx_can.txt b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
index fe38847d8e26..ae5c07e96ad5 100644
--- a/Documentation/devicetree/bindings/net/can/xilinx_can.txt
+++ b/Documentation/devicetree/bindings/net/can/xilinx_can.txt
@@ -2,20 +2,26 @@ Xilinx Axi CAN/Zynq CANPS controller Device Tree Bindings
 ---------------------------------------------------------
 
 Required properties:
-- compatible		: Should be "xlnx,zynq-can-1.0" for Zynq CAN
-			  controllers and "xlnx,axi-can-1.00.a" for Axi CAN
-			  controllers.
-- reg			: Physical base address and size of the Axi CAN/Zynq
-			  CANPS registers map.
+- compatible		: Should be:
+			  - "xlnx,zynq-can-1.0" for Zynq CAN controllers
+			  - "xlnx,axi-can-1.00.a" for Axi CAN controllers
+			  - "xlnx,canfd-1.0" for CAN FD controllers
+- reg			: Physical base address and size of the controller
+			  registers map.
 - interrupts		: Property with a value describing the interrupt
 			  number.
 - interrupt-parent	: Must be core interrupt controller
-- clock-names		: List of input clock names - "can_clk", "pclk"
-			  (For CANPS), "can_clk" , "s_axi_aclk"(For AXI CAN)
+- clock-names		: List of input clock names
+			  - "can_clk", "pclk" (For CANPS),
+			  - "can_clk", "s_axi_aclk" (For AXI CAN and CAN FD).
 			  (See clock bindings for details).
 - clocks		: Clock phandles (see clock bindings for details).
-- tx-fifo-depth		: Can Tx fifo depth.
-- rx-fifo-depth		: Can Rx fifo depth.
+- tx-fifo-depth		: Can Tx fifo depth (Zynq, Axi CAN).
+- rx-fifo-depth		: Can Rx fifo depth (Zynq, Axi CAN, CAN FD in
+                          sequential Rx mode).
+- tx-mailbox-count	: Can Tx mailbox buffer count (CAN FD).
+- rx-mailbox-count	: Can Rx mailbox buffer count (CAN FD in mailbox Rx
+			  mode).
 
 
 Example:
@@ -42,3 +48,14 @@ For Axi CAN Dts file:
 			tx-fifo-depth = <0x40>;
 			rx-fifo-depth = <0x40>;
 		};
+For CAN FD Dts file:
+	canfd_0: canfd@40000000 {
+			compatible = "xlnx,canfd-1.0";
+			clocks = <&clkc 0>, <&clkc 1>;
+			clock-names = "can_clk", "s_axi_aclk";
+			reg = <0x40000000 0x2000>;
+			interrupt-parent = <&intc>;
+			interrupts = <0 59 1>;
+			tx-mailbox-count = <0x20>;
+			rx-fifo-depth = <0x20>;
+		};
-- 
2.16.3

