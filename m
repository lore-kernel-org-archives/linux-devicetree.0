Return-Path: <SRS0=HrxS=KF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr700063.outbound.protection.outlook.com ([40.107.70.63]:27904
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727678AbeGUMml (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 21 Jul 2018 08:42:41 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv5 4/4] dt-bindings: serial: Add binding for uartlite
Date: Sat, 21 Jul 2018 17:19:07 +0530
Message-ID: <1532173747-19115-5-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

The uartlite devicetree binding was missed out.
Add the binding documentation for uartlite that is already in use.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
lowercase for hex values
interrupt description updated
v3:
squashed the clock changes
v4:
Updated the patch description
and the interrupt description

 .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
new file mode 100644
index 0000000..c37deb4
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
+- interrupts		: Should contain the UART controller interrupt.
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

