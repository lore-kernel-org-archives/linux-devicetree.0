Return-Path: <SRS0=skGX=WE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:56951 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfHHUhx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 8 Aug 2019 16:37:53 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
Date: Thu,  8 Aug 2019 23:32:03 +0300
Message-Id: <20190808203204.8614-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

Add documentation and example for dt-bindings EL15203000.
LED board (aka RED LED board) from Crane Merchandising Systems.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../bindings/leds/leds-el15203000.txt         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..4c2245babfdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,47 @@
+Crane Merchandising System - el15203000 LED driver
+--------------------------------------------------
+
+This LED Board (aka RED LEDs board) is widely used in
+coffee vending machines produced by Crane Merchandising Systems.
+
+Required properties:
+- compatible : "crane,el15203000"
+- reg :
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
+- spi-max-frequency : (optional)
+	see Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Optional LED sub-node properties:
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger :
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Example
+-------
+
+led-controller@0 {
+	compatible = "crane,el15203000";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* water pipe */
+	pipe@50 {
+		reg = <0x50>;
+		label = "red:pipe";
+	};
+
+	/* screen frame */
+	screen@53 {
+		reg = <0x53>;
+		label = "red:screen";
+	};
+
+	/* vending area */
+	vend@56 {
+		reg = <0x56>;
+		label = "red:vend";
+	};
+};
-- 
2.21.0
