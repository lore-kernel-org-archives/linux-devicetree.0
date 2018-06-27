Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-sn1nam02on0063.outbound.protection.outlook.com ([104.47.36.63]:3920
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964989AbeF0MYR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 08:24:17 -0400
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 3/4] doc: uartlite: Add binding for the driver
Date: Wed, 27 Jun 2018 17:53:44 +0530
Message-ID: <1530102225-6459-3-git-send-email-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, shubhrajyoti.datta@gmail.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Add uartlite binding for the driver

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../bindings/serial/xlnx,opb-uartlite.txt          | 24 ++++++++++++++++++=
++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/xlnx,opb-uartl=
ite.txt

diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt=
 b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
new file mode 100644
index 0000000..df8aba0
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
@@ -0,0 +1,24 @@
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
+- interrupts           : Property with a value describing the interrupt
+                         number.
+- interrupt-parent     : Must be core interrupt controller.
+
+Optional properties:
+- port-number          : Set Uart port number
+
+Example:
+serial@800C0000 {
+       compatible =3D "xlnx,xps-uartlite-1.00.a";
+       reg =3D <0x0 0x800c0000 0x10000>;
+       interrupt-parent =3D <&gic>;
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
