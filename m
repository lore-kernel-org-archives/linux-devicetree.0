Return-Path: <SRS0=w+aW=KC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr700077.outbound.protection.outlook.com ([40.107.70.77]:29312
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725909AbeGRGZa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Jul 2018 02:25:30 -0400
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv4 4/4] dt-bindings: serial: Add binding for uartlite
Date: Wed, 18 Jul 2018 11:18:59 +0530
Message-ID: <1531892939-14419-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, gregkh@linuxfoundation.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

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

 .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++++++=
++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartl=
ite.txt

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt=
 b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
new file mode 100644
index 0000000..52719b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -0,0 +1,23 @@
+Xilinx Axi Uartlite controller Device Tree Bindings
+---------------------------------------------------------
+
+Required properties:
+- compatible           : Can be either of
+                               "xlnx,xps-uartlite-1.00.a"
+                               "xlnx,opb-uartlite-1.00.b"
+- reg                  : Physical base address and size of the Axi Uartlit=
e
+                         registers map.
+- interrupts           : Should contain the UART controller interrupt.
+
+Optional properties:
+- port-number          : Set Uart port number
+- clock-names          : Should be "s_axi_aclk"
+- clocks               : Input clock specifier. Refer to common clock bind=
ings.
+
+Example:
+serial@800c0000 {
+       compatible =3D "xlnx,xps-uartlite-1.00.a";
+       reg =3D <0x0 0x800c0000 0x10000>;
+       interrupts =3D <0x0 0x6e 0x1>;
+       port-number =3D <0>;
+};
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
