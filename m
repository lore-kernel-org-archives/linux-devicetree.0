Return-Path: <SRS0=8NQX=FO=gmail.com=keepcalm444@kernel.org>
From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 1/2] dt-bindings: leds: document Panasonic AN30259A bindings
Date: Tue, 20 Feb 2018 11:54:45 +1100
Message-Id: <20180220005446.8577-2-simon@lineageos.org>
In-Reply-To: <20180220005446.8577-1-simon@lineageos.org>
References: <20180220005446.8577-1-simon@lineageos.org>
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Shields <simon@lineageos.org>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 .../devicetree/bindings/leds/leds-an30259a.txt     | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
new file mode 100644
index 000000000000..d3586ce71eef
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
@@ -0,0 +1,41 @@
+* Panasonic AN30259A 3-channel LED driver
+
+The AN30259A is a LED controller capable of driving three LEDs independently. It supports
+constant current output and sloping current output modes. The chip is connected over I2C.
+
+Required properties:
+	- compatible : must be "panasonic,an30259a"
+	- reg -  I2C slave address
+
+Each led is represented as a sub-node of the panasonic,an30259a node.
+
+Optional sub-node properties:
+	- label: see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
+	- led-sources: 0 if LED is connected to LED1 pin,
+	  1 if LED is connected to LED2 pin, or 2 if LED is connected to LED3 pin.
+
+Example:
+an30259a@30 {
+	compatible = "panasonic,an30259a";
+	reg = <0x30>;
+
+	red {
+		led-sources = <0>;
+		linux,default-trigger = "heartbeat";
+		label = "red";
+	};
+
+	green {
+		led-sources = <1>;
+		label = "green";
+	};
+
+	blue {
+		led-sources = <2>;
+		label = "blue";
+	};
+};
+
+For more information please see the link below:
+https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
-- 
2.16.2
