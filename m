Return-Path: <SRS0=h742=GR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:34506 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753202AbeC0QtN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 27 Mar 2018 12:49:13 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
Date: Tue, 27 Mar 2018 19:49:02 +0300
Message-Id: <20180327164903.6307-1-oleg@kaa.org.ua>
In-Reply-To: <20180326121506.9528-1-oleg@kaa.org.ua>
References: <20180326121506.9528-1-oleg@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

- add vendor prefix for Crane;
- add documentation and example for dt-bindings CR0014114.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 51 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
new file mode 100644
index 000000000000..5f38f16aa08a
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
+		label = "cr0:red:coin";
+	};
+	led@1 {
+		reg = <1>;
+		label = "cr0:green:coin";
+	};
+	led@2 {
+		reg = <2>;
+		label = "cr0:blue:coin";
+	};
+	led@3 {
+		reg = <3>;
+		label = "cr1:red:bill";
+	};
+	led@4 {
+		reg = <4>;
+		label = "cr1:green:bill";
+	};
+	led@5 {
+		reg = <5>;
+		label = "cr1:blue:bill";
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

