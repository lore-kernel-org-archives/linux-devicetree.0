Return-Path: <SRS0=PuNI=GS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:37221 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbeC1GxW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Mar 2018 02:53:22 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v6 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
Date: Wed, 28 Mar 2018 09:53:11 +0300
Message-Id: <20180328065312.6584-1-oleg@kaa.org.ua>
In-Reply-To: <20180327164903.6307-2-oleg@kaa.org.ua>
References: <20180327164903.6307-2-oleg@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

add vendor prefix for Crane;
add documentation and example for dt-bindings CR0014114.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 51 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
new file mode 100644
index 000000000000..6e8b135bb59f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -0,0 +1,51 @@
+Crane Merchandising System - cr0014114 LED driver
+-------------------------------------------------
+
+This LED Board is widely used in vending machines produced
+by Crane Merchandising Systems.
+
+Required properties:
+- compatible: "crane,cr0014114"
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
+		label = "cr0014114:red:coin";
+	};
+	led@1 {
+		reg = <1>;
+		label = "cr0014114:green:coin";
+	};
+	led@2 {
+		reg = <2>;
+		label = "cr0014114:blue:coin";
+	};
+	led@3 {
+		reg = <3>;
+		label = "cr0014114:red:bill";
+	};
+	led@4 {
+		reg = <4>;
+		label = "cr0014114:green:bill";
+	};
+	led@5 {
+		reg = <5>;
+		label = "cr0014114:blue:bill";
+	};
+	...
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ae850d6c0ad3..f17949c365f5 100644
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

