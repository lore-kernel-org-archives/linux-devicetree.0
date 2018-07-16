Return-Path: <SRS0=K2f+=KA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-bl2nam02on0050.outbound.protection.outlook.com ([104.47.38.50]:59856
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726627AbeGPFuu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Jul 2018 01:50:50 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv3 4/4] dt-bindings: serial: Add binding for uartlite
Date: Mon, 16 Jul 2018 10:53:54 +0530
Message-ID: <1531718634-17939-4-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
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
lowercase for hex values
interrupt description updated
v3:
squashed the clock changes

 .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
new file mode 100644
index 0000000..52719b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -0,0 +1,23 @@
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
+- clock-names		: Should be "s_axi_aclk"
+- clocks		: Input clock specifier. Refer to common clock bindings.
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

