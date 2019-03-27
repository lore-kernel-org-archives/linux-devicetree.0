Return-Path: <SRS0=r0RQ=R6=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v1 leds-next 2/3] dt-bindings: leds: Document Turris Omnia LED controller binding
Date: Wed, 27 Mar 2019 05:15:21 +0100
Message-Id: <20190327041522.27402-3-marek.behun@nic.cz>
In-Reply-To: <20190327041522.27402-1-marek.behun@nic.cz>
References: <20190327041522.27402-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds device tree binding documentation for the front panel LEDs
controller of CZ.NIC's Turris Omnia router.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/leds/leds-turris-omnia.txt       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-turris-omnia.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt b/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt
new file mode 100644
index 000000000000..15d37471568e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt
@@ -0,0 +1,35 @@
+Bindings for LEDs on CZ.NIC's Turris Omnia
+
+Required properties:
+ - compatible :		Should be "cznic,turris-omnia-leds"
+ - reg :		I2C slave address
+
+Optional properties (required if any sub-nodes are given):
+ - #address-cells :	Should be 1
+ - #size-cells :	Should be 0
+
+LED sub-nodes can be given for LEDs for which label shall be non-default or
+for which default-trigger is to be set.
+
+LED sub-node properties:
+ - reg :		Must be from 0x0 to 0xb, since there are 12 LEDs on this
+			controller.
+ - label :		(optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+ - linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+	led-controller@2b {
+		compatible = "cznic,turris-omnia-leds";
+		reg = <0x2b>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			label = "omnia::heartbeat";
+			linux,default-trigger = "heartbeat";
+		};
+	};
-- 
2.19.2
