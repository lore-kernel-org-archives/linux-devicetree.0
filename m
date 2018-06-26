Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:53173
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753093AbeF0ACg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:02:36 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 02/14] dt-bindings: usb: add documentation for typec port controller(TCPCI)
Date: Wed, 27 Jun 2018 07:45:20 +0800
Message-Id: <1530056732-9640-3-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

TCPCI stands for typec port controller interface, its implementation
has full typec port control with power delivery support, it's a
standard i2c slave with GPIO input as irq interface, detail see spec
"Universal Serial Bus Type-C Port Controller Interface Specification
Revision 1.0, Version 1.1"

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../devicetree/bindings/usb/typec-tcpci.txt        | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
new file mode 100644
index 0000000..0dd1469
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
@@ -0,0 +1,49 @@
+TCPCI(Typec port cotroller interface) binding
+---------------------------------------------
+
+Required properties:
+- compatible:       should be set one of following:
+		    - "nxp,ptn5110" for NXP USB PD TCPC PHY IC ptn5110.
+
+- reg:              the i2c slave address of typec port controller device.
+- interrupt-parent: the phandle to the interrupt controller which provides
+                    the interrupt.
+- interrupts:       interrupt specification for tcpci alert.
+
+Required sub-node:
+- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
+  of connector node are specified in
+  Documentation/devicetree/bindings/connector/usb-connector.txt
+
+Example:
+
+ptn5110@50 {
+	compatible = "nxp,ptn5110";
+	reg = <0x50>;
+	interrupt-parent = <&gpio3>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+		power-role = "dual";
+		try-power-role = "sink";
+		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 12000, 2000)>;
+		op-sink-microwatt = <10000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				usb_con_ss: endpoint {
+					remote-endpoint = <&usb3_data_ss>;
+				};
+			};
+		};
+	};
+};
-- 
2.7.4

