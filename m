Return-Path: <SRS0=NMQj=SL=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv3 1/2] dt-bindings: xilinx-uartps: Add support for cts-override
Date: Tue, 9 Apr 2019 13:15:23 +0530
Message-ID: <1554795924-12053-2-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554795924-12053-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1554795924-12053-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Flow control is configurable in xilinx-uartps
Add a dt binding to check for the same.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Change the node binding name as suggested Rob.

 Documentation/devicetree/bindings/serial/cdns,uart.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
index 227bb77..4efc560 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
@@ -12,6 +12,11 @@ Required properties:
   See ../clocks/clock-bindings.txt for details.
 
 
+Optional properties:
+- cts-override : Override the CTS modem status signal. This signal will
+  always be reported as active instead of being obtained from the modem status
+  register. Define this if your serial port does not use this pin
+
 Example:
 	uart@e0000000 {
 		compatible = "cdns,uart-r1p8";
-- 
2.1.1
