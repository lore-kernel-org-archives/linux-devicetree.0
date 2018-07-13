Return-Path: <SRS0=0z1H=J5=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 4/4] dt-bindings: serial: Add binding for uartlite
Date: Fri, 13 Jul 2018 16:17:29 +0530
Message-ID: <1531478849-29480-4-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1531478849-29480-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1531478849-29480-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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
