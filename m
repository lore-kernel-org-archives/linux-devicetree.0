Return-Path: <SRS0=YTt1=SE=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 1/2] dt-bindings: xilinx-uartps: Add support for noctsrts
Date: Tue, 2 Apr 2019 10:36:17 +0530
Message-ID: <1554181578-13362-2-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Vivado has a configurationo for selecting the flow control.
Add a dt binding to check for the same.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
index 227bb77..5161a05 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.txt
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
@@ -12,6 +12,10 @@ Required properties:
   See ../clocks/clock-bindings.txt for details.
 
 
+Optional properties:
+- xlnx,nortscts: The presence of this property indicates that the
+    UART does not support modem lines for RTS/CTS hardware flow control.
+
 Example:
 	uart@e0000000 {
 		compatible = "cdns,uart-r1p8";
-- 
2.1.1
