Return-Path: <SRS0=LEhR=PY=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 1/2] dt-bindings: usb: usb251xb: add documentation for data lane swapping
Date: Wed, 16 Jan 2019 15:20:36 +0100
Message-Id: <20190116142037.10086-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: richard.leitner@skidata.com, robh@kernel.org, fancer.lancer@gmail.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, kernel@pengutronix.de, gregkh@linuxfoundation.org
List-ID: <devicetree@vger.kernel.org>

Add optional binding to allow USB differential-pair (D+/D-) data lane
swapping. The swapping can be specified for each port separately,
default is no swapping.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
---
Changes:
v3:
 - no changes
v2:
 - rename property s/sw-dx-lanes-ports/swap-dx-lanes

 Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 168ff819e827..17915f64b8ee 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -64,6 +64,8 @@ Optional properties :
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
+ - swap-dx-lanes : Specifies the ports which will swap the differential-pair
+	(D+/D-), default is not-swapped.
 
 Examples:
 	usb2512b@2c {
@@ -81,4 +83,6 @@ Examples:
 		manufacturer = "Foo";
 		product = "Foo-Bar";
 		serial = "1234567890A";
+		/* correct misplaced usb connectors on port 1,2 */
+		swap-dx-lanes = <1 2>;
 	};
-- 
2.20.1
