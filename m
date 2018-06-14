From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] net: dsa: Add DT bindings for Vitesse VSC73xx switches
Date: Thu, 14 Jun 2018 14:35:32 +0200
Message-ID: <20180614123534.8063-2-linus.walleij@linaro.org>
References: <20180614123534.8063-1-linus.walleij@linaro.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180614123534.8063-1-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, Gabor Juhos <juhosg@openwrt.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the device tree bindings for the Vitesse VSC73xx
switches. We also add the vendor name for Vitesse.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/net/dsa/vitesse,vsc73xx.txt      | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
new file mode 100644
index 000000000000..474cdba5fa37
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/vitesse,vsc73xx.txt
@@ -0,0 +1,81 @@
+Vitess VSC73xx Switches
+=======================
+
+This defines device tree bindings for the Vitesse VSC73xx switch chips.
+The Vitesse company has been acquired by Microsemi and Microsemi in turn
+acquired by Microchip but retains this vendor branding.
+
+The currently supported switch chips are:
+Vitesse VSC7385 SparX-G5 5+1-port Integrated Gigabit Ethernet Switch
+Vitesse VSC7388 SparX-G8 8-port Integrated Gigabit Ethernet Switch
+Vitesse VSC7395 SparX-G5e 5+1-port Integrated Gigabit Ethernet Switch
+Vitesse VSC7398 SparX-G8e 8-port Integrated Gigabit Ethernet Switch
+
+The device tree node is an SPI device so it must reside inside a SPI bus
+device tree node, see spi/spi-bus.txt
+
+Required properties:
+
+- compatible: must be exactly one of:
+	"vitesse,vsc7385"
+	"vitesse,vsc7388"
+	"vitesse,vsc7395"
+	"vitesse,vsc7398"
+- gpio-controller: indicates that this switch is also a GPIO controller,
+  see gpio/
+- #gpio-cells: this must be set to <2> and indicates that we are a twocell
+  GPIO controller.
+
+Optional properties:
+
+- reset-gpios: a handle to a GPIO line that can issue reset of the chip.
+  It should be tagged as active low.
+
+Required subnodes:
+
+See net/dsa/dsa.txt for a list of additional required and optional properties
+and subnodes of DSA switches.
+
+Examples:
+
+switch@0 {
+	compatible = "vitesse,vsc7395";
+	reg = <0>;
+	/* Specified for 2.5 MHz or below */
+	spi-max-frequency = <2500000>;
+	gpio-controller;
+	#gpio-cells = <2>;
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
+			ethernet = <&gmac1>;
+			phy-mode = "rgmii";
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+				pause;
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b5f978a4cac6..e8473894700c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -385,6 +385,7 @@ v3	V3 Semiconductor
 variscite	Variscite Ltd.
 via	VIA Technologies, Inc.
 virtio	Virtual I/O Device Specification, developed by the OASIS consortium
+vitesse	Vitesse Semiconductor Corporation
 vivante	Vivante Corporation
 vocore VoCore Studio
 voipac	Voipac Technologies s.r.o.
-- 
2.17.1
