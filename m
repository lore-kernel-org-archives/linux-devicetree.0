Return-Path: <SRS0=zJ12=GQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:53717 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751076AbeCZMPR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Mar 2018 08:15:17 -0400
From: Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v4 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
Date: Mon, 26 Mar 2018 15:15:05 +0300
Message-Id: <20180326121506.9528-1-oleg@kaa.org.ua>
In-Reply-To: <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
References: <d676d163-49ea-0164-d399-1f6d50767125@kaa.org.ua>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 49 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
new file mode 100644
index 000000000000..0818ac6c6ffa
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
@@ -0,0 +1,49 @@
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

