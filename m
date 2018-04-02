Return-Path: <SRS0=d5cC=GX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:39081 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751216AbeDBMyA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Apr 2018 08:54:00 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v8 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
Date: Mon,  2 Apr 2018 15:53:49 +0300
Message-Id: <20180402125350.2679-1-oleg@kaa.org.ua>
In-Reply-To: <20180328185616.27711-2-oleg@kaa.org.ua>
References: <20180328185616.27711-2-oleg@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

add vendor prefix for Crane;
add documentation and example for dt-bindings CR0014114.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 54 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
new file mode 100644
index 000000000000..4255b19ad25c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -0,0 +1,54 @@
+Crane Merchandising System - cr0014114 LED driver
+-------------------------------------------------
+
+This LED Board is widely used in vending machines produced
+by Crane Merchandising Systems.
+
+Required properties:
+- compatible: "crane,cr0014114"
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply. In particular, "reg" and "spi-max-frequency" properties must be given.
+
+LED sub-node properties:
+- label :
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Example
+-------
+
+led-controller@0 {
+	compatible = "crane,cr0014114";
+	reg = <0>;
+	spi-max-frequency = <50000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@0 {
+		reg = <0>;
+		label = "red:coin";
+	};
+	led@1 {
+		reg = <1>;
+		label = "green:coin";
+	};
+	led@2 {
+		reg = <2>;
+		label = "blue:coin";
+	};
+	led@3 {
+		reg = <3>;
+		label = "red:bill";
+	};
+	led@4 {
+		reg = <4>;
+		label = "green:bill";
+	};
+	led@5 {
+		reg = <5>;
+		label = "blue:bill";
+	};
+	...
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b5f978a4cac6..8e1f0af48aed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
 compulab	CompuLab Ltd.
 cortina	Cortina Systems, Inc.
 cosmic	Cosmic Circuits
+crane	Crane Connectivity Solutions
 creative	Creative Technology Ltd
 crystalfontz	Crystalfontz America, Inc.
 cubietech	Cubietech, Ltd.
-- 
2.16.1

