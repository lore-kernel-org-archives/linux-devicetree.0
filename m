Return-Path: <SRS0=lJ7a=R7=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v3 leds-next 2/2] dt-bindings: leds: Document Turris Omnia LED controller binding
Date: Thu, 28 Mar 2019 20:34:28 +0100
Message-Id: <20190328193428.19273-3-marek.behun@nic.cz>
In-Reply-To: <20190328193428.19273-1-marek.behun@nic.cz>
References: <20190328193428.19273-1-marek.behun@nic.cz>
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
 .../bindings/leds/leds-turris-omnia.txt       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-turris-omnia.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt b/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt
new file mode 100644
index 000000000000..a9fd9a768251
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-turris-omnia.txt
@@ -0,0 +1,85 @@
+Bindings for LEDs on CZ.NIC's Turris Omnia
+
+Required properties:
+ - compatible :		Should be "cznic,turris-omnia-leds"
+ - reg :		I2C slave address
+ - #address-cells :	Should be 1
+ - #size-cells :	Should be 0
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
+			reg = <0x0>;
+			label = "userB";
+			linux,default-trigger = "heartbeat";
+		};
+
+		led@1 {
+			reg = <0x1>;
+			label = "userA";
+		};
+
+		led@2 {
+			reg = <0x2>;
+			label = "pci3";
+		};
+
+		led@3 {
+			reg = <0x3>;
+			label = "pci2";
+		};
+
+		led@4 {
+			reg = <0x4>;
+			label = "pci1";
+		};
+
+		led@5 {
+			reg = <0x5>;
+			label = "wan";
+		};
+
+		led@6 {
+			reg = <0x6>;
+			label = "lan4";
+		};
+
+		led@7 {
+			reg = <0x7>;
+			label = "lan3";
+		};
+
+		led@8 {
+			reg = <0x8>;
+			label = "lan2";
+		};
+
+		led@9 {
+			reg = <0x9>;
+			label = "lan1";
+		};
+
+		led@a {
+			reg = <0xa>;
+			label = "lan0";
+		};
+
+		led@b {
+			reg = <0xb>;
+			label = "power";
+		};
+	};
-- 
2.19.2
