From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v4 3/3] dt-bindings: Document the DT bindings for lan78xx
Date: Thu, 19 Apr 2018 17:59:40 +0100
Message-ID: <1524157180-27276-4-git-send-email-phil@raspberrypi.org>
References: <1524157180-27276-1-git-send-email-phil@raspberrypi.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524157180-27276-1-git-send-email-phil@raspberrypi.org>
Sender: netdev-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Phil Elwell <phil@raspberrypi.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Microchip LAN78XX family of devices are Ethernet controllers with
a USB interface. Despite being discoverable devices it can be useful to
be able to configure them from Device Tree, particularly in low-cost
applications without an EEPROM or programmed OTP.

Document the supported properties in a bindings file.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../devicetree/bindings/net/microchip,lan78xx.txt  | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt

diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
new file mode 100644
index 0000000..76786a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
@@ -0,0 +1,54 @@
+Microchip LAN78xx Gigabit Ethernet controller
+
+The LAN78XX devices are usually configured by programming their OTP or with
+an external EEPROM, but some platforms (e.g. Raspberry Pi 3 B+) have neither.
+The Device Tree properties, if present, override the OTP and EEPROM.
+
+Required properties:
+- compatible: Should be one of "usb424,7800", "usb424,7801" or "usb424,7850".
+
+Optional properties:
+- local-mac-address:   see ethernet.txt
+- mac-address:         see ethernet.txt
+
+Optional properties of the embedded PHY:
+- microchip,led-modes: a 0..4 element vector, with each element configuring
+  the operating mode of an LED. Omitted LEDs are turned off. Allowed values
+  are defined in "include/dt-bindings/net/microchip-lan78xx.h".
+
+Example:
+
+/* Based on the configuration for a Raspberry Pi 3 B+ */
+&usb {
+	usb-port@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb-port@1 {
+			compatible = "usb424,2514";
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet: ethernet@1 {
+				compatible = "usb424,7800";
+				reg = <1>;
+				local-mac-address = [ 00 11 22 33 44 55 ];
+
+				mdio {
+					#address-cells = <0x1>;
+					#size-cells = <0x0>;
+					eth_phy: ethernet-phy@1 {
+						reg = <1>;
+						microchip,led-modes = <
+							LAN78XX_LINK_1000_ACTIVITY
+							LAN78XX_LINK_10_100_ACTIVITY
+						>;
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 23735d9..91cb961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14572,6 +14572,7 @@ M:	Woojung Huh <woojung.huh@microchip.com>
 M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/microchip,lan78xx.txt
 F:	drivers/net/usb/lan78xx.*
 F:	include/dt-bindings/net/microchip-lan78xx.h
 
-- 
2.7.4
