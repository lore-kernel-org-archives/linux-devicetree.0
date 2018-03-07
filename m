Return-Path: <SRS0=kIko=F5=gmail.com=keepcalm444@kernel.org>
From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v2 1/2] dt-bindings: leds: document Panasonic AN30259A bindings
Date: Wed,  7 Mar 2018 11:47:21 +1100
Message-Id: <20180307004722.23524-2-simon@lineageos.org>
In-Reply-To: <20180307004722.23524-1-simon@lineageos.org>
References: <20180307004722.23524-1-simon@lineageos.org>
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Shields <simon@lineageos.org>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 .../devicetree/bindings/leds/leds-an30259a.txt     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
new file mode 100644
index 000000000000..34ad4b189853
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
@@ -0,0 +1,43 @@
+* Panasonic AN30259A 3-channel LED driver
+
+The AN30259A is a LED controller capable of driving three LEDs independently. It supports
+constant current output and sloping current output modes. The chip is connected over I2C.
+
+Required properties:
+	- compatible: Must be "panasonic,an30259a".
+	- reg: I2C slave address.
+	- #address-cells: Must be 1.
+	- #size-cells: Must be 0.
+
+Each LED is represented as a sub-node of the panasonic,an30259a node.
+
+Required sub-node properties:
+	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
+
+Optional sub-node properties:
+	- label: see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+leds@30 {
+	compatible = "panasonic,an30259a";
+	reg = <0x30>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led@1 {
+		reg = <1>;
+		linux,default-trigger = "heartbeat";
+		label = "an30259a:red:notification";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "an30259a:green:notification";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "an30259a:blue:notification";
+	};
+};
-- 
2.16.2
