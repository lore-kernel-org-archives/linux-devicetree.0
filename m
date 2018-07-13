Return-Path: <SRS0=tHxF=J5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690089.outbound.protection.outlook.com ([40.107.69.89]:5666
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727147AbeGMKxE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Jul 2018 06:53:04 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 1/5] dt-bindings: serial: Add binding for uartlite
Date: Fri, 13 Jul 2018 16:00:06 +0530
Message-ID: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add binding doc for uartlite

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
fixed the interrupt description
use lower case in hex

 .../bindings/serial/xlnx,opb-uartlite.txt           | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
new file mode 100644
index 0000000..cae95e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -0,0 +1,21 @@
+Xilinx Axi Uartlite controller Device Tree Bindings
+---------------------------------------------------------
+
+Required properties:
+- compatible		: Can be either of
+				"xlnx,xps-uartlite-1.00.a"
+				"xlnx,opb-uartlite-1.00.b"
+- reg			: Physical base address and size of the Axi Uartlite
+			  registers map.
+- interrupts		: Should contain UART controller interrupts.
+
+Optional properties:
+- port-number		: Set Uart port number
+
+Example:
+serial@800c0000 {
+	compatible = "xlnx,xps-uartlite-1.00.a";
+	reg = <0x0 0x800c0000 0x10000>;
+	interrupts = <0x0 0x6e 0x1>;
+	port-number = <0>;
+};
-- 
2.7.4

