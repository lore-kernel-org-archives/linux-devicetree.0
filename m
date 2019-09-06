Return-Path: <SRS0=UWh6=XB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:54090 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388895AbfIFN3k (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Sep 2019 09:29:40 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v6 1/2] dt-bindings: Add docs for EL15203000
Date: Fri,  6 Sep 2019 16:29:16 +0300
Message-Id: <20190906132916.12423-2-oleg@kaa.org.ua>
In-Reply-To: <20190906132916.12423-1-oleg@kaa.org.ua>
References: <20190906132916.12423-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: Oleh Kravchenko <oleg@kaa.org.ua>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add documentation and example for dt-bindings EL15203000.
LED board (aka RED LED board) from Crane Merchandising Systems.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
new file mode 100644
index 000000000000..c00e1b55db97
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
@@ -0,0 +1,54 @@
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
+- function:
+	see Documentation/devicetree/bindings/leds/common.txt
+- color:
+	see Documentation/devicetree/bindings/leds/common.txt
+- label:
+	see Documentation/devicetree/bindings/leds/common.txt (deprecated)
+
+Example
+-------
+
+#include <dt-bindings/leds/common.h>
+
+led-controller@0 {
+	compatible = "crane,el15203000";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* water pipe */
+	led@50 {
+		reg = <0x50>;
+		function = "pipe";
+		color = <LED_COLOR_ID_RED>;
+	};
+
+	/* screen frame */
+	led@53 {
+		reg = <0x53>;
+		function = "screen";
+		color = <LED_COLOR_ID_RED>;
+	};
+
+	/* vending area */
+	led@56 {
+		reg = <0x56>;
+		function = "vend";
+		color = <LED_COLOR_ID_RED>;
+	};
+};
-- 
2.21.0
