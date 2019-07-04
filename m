From: Pawel Dembicki <paweldembicki@gmail.com>
Subject: [PATCH v3 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx switches
Date: Fri,  5 Jul 2019 00:29:04 +0200
Message-ID: <20190704222907.2888-2-paweldembicki@gmail.com>
References: <20190704222907.2888-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704222907.2888-1-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>, linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit introduce how to use vsc73xx platform driver.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/net/dsa/vitesse,vsc73xx.txt      | 58 +++++++++++++++++--
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
index ed4710c40641..bbf4a13f6d75 100644
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
@@ -11,8 +11,14 @@ Vitesse VSC7388 SparX-G8 8-port Integrated Gigabit Ethernet Switch
 Vitesse VSC7395 SparX-G5e 5+1-port Integrated Gigabit Ethernet Switch
 Vitesse VSC7398 SparX-G8e 8-port Integrated Gigabit Ethernet Switch
 
-The device tree node is an SPI device so it must reside inside a SPI bus
-device tree node, see spi/spi-bus.txt
+This switch could have two different management interface.
+
+If SPI interface is used, the device tree node is an SPI device so it must
+reside inside a SPI bus device tree node, see spi/spi-bus.txt
+
+When the chip is connected to a parallel memory bus and work in memory-mapped
+I/O mode, a platform device is used to represent the vsc73xx. In this case it
+must reside inside a platform bus device tree node.
 
 Required properties:
 
@@ -38,6 +44,7 @@ and subnodes of DSA switches.
 
 Examples:
 
+SPI:
 switch@0 {
 	compatible = "vitesse,vsc7395";
 	reg = <0>;
@@ -79,3 +86,46 @@ switch@0 {
 		};
 	};
 };
+
+Platform:
+switch@2,0 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "vitesse,vsc7385";
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
