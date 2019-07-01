From: Pawel Dembicki <paweldembicki@gmail.com>
Subject: [PATCH 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx switches
Date: Mon,  1 Jul 2019 17:27:20 +0200
Message-ID: <20190701152723.624-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linus.walleij@linaro.org, paweldembicki@gmail.com, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit document changes after split vsc73xx driver into core and
spi part. The change of DT bindings is required for support the same
vsc73xx chip, which need PI bus to communicate with CPU. It also
introduce how to use vsc73xx platform driver.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 .../bindings/net/dsa/vitesse,vsc73xx.txt      | 74 ++++++++++++++++---
 1 file changed, 64 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
index ed4710c40641..c6a4cd85891c 100644
--- a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
+++ b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
@@ -2,8 +2,8 @@ Vitesse VSC73xx Switches
 ========================
 
 This defines device tree bindings for the Vitesse VSC73xx switch chips.
-The Vitesse company has been acquired by Microsemi and Microsemi in turn
-acquired by Microchip but retains this vendor branding.
+The Vitesse company has been acquired by Microsemi and Microsemi has
+been acquired Microchip but retains this vendor branding.
 
 The currently supported switch chips are:
 Vitesse VSC7385 SparX-G5 5+1-port Integrated Gigabit Ethernet Switch
@@ -11,16 +11,26 @@ Vitesse VSC7388 SparX-G8 8-port Integrated Gigabit Ethernet Switch
 Vitesse VSC7395 SparX-G5e 5+1-port Integrated Gigabit Ethernet Switch
 Vitesse VSC7398 SparX-G8e 8-port Integrated Gigabit Ethernet Switch
 
-The device tree node is an SPI device so it must reside inside a SPI bus
-device tree node, see spi/spi-bus.txt
+This switch could have two different management interface.
+
+If SPI interface is used, the device tree node is an SPI device so it must
+reside inside a SPI bus device tree node, see spi/spi-bus.txt
+
+If Platform driver is used, the device tree node is an platform device so it
+must reside inside a platform bus device tree node.
 
 Required properties:
 
-- compatible: must be exactly one of:
-	"vitesse,vsc7385"
-	"vitesse,vsc7388"
-	"vitesse,vsc7395"
-	"vitesse,vsc7398"
+- compatible (SPI): must be exactly one of:
+	"vitesse,vsc7385-spi"
+	"vitesse,vsc7388-spi"
+	"vitesse,vsc7395-spi"
+	"vitesse,vsc7398-spi"
+- compatible (Platform): must be exactly one of:
+	"vitesse,vsc7385-platform"
+	"vitesse,vsc7388-platform"
+	"vitesse,vsc7395-platform"
+	"vitesse,vsc7398-platform"
 - gpio-controller: indicates that this switch is also a GPIO controller,
   see gpio/gpio.txt
 - #gpio-cells: this must be set to <2> and indicates that we are a twocell
@@ -38,8 +48,9 @@ and subnodes of DSA switches.
 
 Examples:
 
+SPI:
 switch@0 {
-	compatible = "vitesse,vsc7395";
+	compatible = "vitesse,vsc7395-spi";
 	reg = <0>;
 	/* Specified for 2.5 MHz or below */
 	spi-max-frequency = <2500000>;
@@ -79,3 +90,46 @@ switch@0 {
 		};
 	};
 };
+
+Platform:
+switch@2,0 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "vitesse,vsc7385-platform";
+	reg = <0x2 0x0 0x20000>;
+	reset-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan1";
+		};
+		port@1 {
+			reg = <1>;
+			label = "lan2";
+		};
+		port@2 {
+			reg = <2>;
+			label = "lan3";
+		};
+		port@3 {
+			reg = <3>;
+			label = "lan4";
+		};
+		vsc: port@6 {
+			reg = <6>;
+			label = "cpu";
+			ethernet = <&enet0>;
+			phy-mode = "rgmii";
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+				pause;
+			};
+		};
+	};
+
+};
-- 
2.20.1
