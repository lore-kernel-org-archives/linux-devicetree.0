Return-Path: <SRS0=Mr4q=O4=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for data lane swapping
Date: Wed, 19 Dec 2018 15:59:40 +0100
Message-Id: <20181219145941.5173-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: richard.leitner@skidata.com, robh@kernel.org, fancer.lancer@gmail.com
Cc: kernel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add optional binding to allow USB differential-pair (D+/D-) data lane
swapping. The swapping can be specified for each port separately,
default is no swapping.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 168ff819e827..aec93a92870d 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -64,6 +64,8 @@ Optional properties :
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
+ - sw-dx-lanes-ports : Specifies the ports which will swap the differential-pair
+	(D+/D-), default is not-swapped.
 
 Examples:
 	usb2512b@2c {
@@ -81,4 +83,6 @@ Examples:
 		manufacturer = "Foo";
 		product = "Foo-Bar";
 		serial = "1234567890A";
+		/* correct misplaced usb connectors on port 1,2 */
+		sw-dx-lanes-ports = <1 2>;
 	};
-- 
2.19.1
