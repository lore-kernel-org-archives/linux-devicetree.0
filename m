Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0052.outbound.protection.outlook.com ([104.47.2.52]:22528
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752934AbeBZMFe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:34 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 11/12] dt-bindings: usb: add documentation for typec port controller(TCPCI)
Date: Mon, 26 Feb 2018 19:49:18 +0800
Message-Id: <1519645759-12701-12-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

TCPCI stands for typec port controller interface, its implementation
has full typec port control with power delivery support, it's a
standard i2c slave with GPIO input as irq interface, detail see spec
"Universal Serial Bus Type-C Port Controller Interface Specification
Revision 1.0, Version 1.1"

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Use usb connector sub-node accordingly to specify typec properties.

 .../devicetree/bindings/usb/typec-tcpci.txt        | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
new file mode 100644
index 0000000..318bf01
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
@@ -0,0 +1,35 @@
+TCPCI(Typec port cotroller interface) binding
+---------------------------------------------
+
+Required properties:
+- compatible:       should be "usb,tcpci".
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
+	compatible = "usb,tcpci";
+	reg = <0x50>;
+	interrupt-parent = <&gpio3>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		port-type = "dual";
+		default-role = "sink";
+		src-pdos = <0x380190c8>;
+		snk-pdos = <0x380190c8 0x3802d0c8>;
+		max-snk-mv = <9000>;
+		max-snk-ma = <1000>;
+		op-snk-mw = <9000>;
+	};
+};
-- 
2.7.4

