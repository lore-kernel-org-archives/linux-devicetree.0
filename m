From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4 v1] net: dsa: Add bindings for Realtek SMI DSAs
Date: Sat, 14 Jul 2018 11:45:54 +0200
Message-ID: <20180714094556.30791-2-linus.walleij@linaro.org>
References: <20180714094556.30791-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180714094556.30791-1-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Antti=20Sepp=C3=A4l=C3=A4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Realtek SMI family is a set of DSA chips that provide
switching in routers. This binding just follows the pattern
set by other switches but with the introduction of an embedded
irqchip to demux and handle the interrupts fired by the single
line from the chip.

This interrupt construction is similar to how we handle
interrupt controllers inside PCI bridges etc.

Cc: Antti Seppälä <a.seppala@gmail.com>
Cc: Roman Yeryomin <roman@advem.lv>
Cc: Colin Leitner <colin.leitner@googlemail.com>
Cc: Gabor Juhos <juhosg@openwrt.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog RFCv2->v1:
- No changes, we agree on these bindings.
ChangeLog RFCv1->RFCv2:
- Switch to Andrew's suggestion to have a local MDIO bus
  definition inside of the DSA device node
- Add realtek,disabled-leds
- Correct WAN IRQ to 12 in the example
---
 .../bindings/net/dsa/realtek-smi.txt          | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/realtek-smi.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt b/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt
new file mode 100644
index 000000000000..b6ae8541bd55
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt
@@ -0,0 +1,153 @@
+Realtek SMI-based Switches
+==========================
+
+The SMI "Simple Management Interface" is a two-wire protocol using
+bit-banged GPIO that while it reuses the MDIO lines MCK and MDIO does
+not use the MDIO protocol. This binding defines how to specify the
+SMI-based Realtek devices.
+
+Required properties:
+
+- compatible: must be exactly one of:
+      "realtek,rtl8366"
+      "realtek,rtl8366rb" (4+1 ports)
+      "realtek,rtl8366s"  (4+1 ports)
+      "realtek,rtl8367"
+      "realtek,rtl8367b"
+      "realtek,rtl8368s"  (8 port)
+      "realtek,rtl8369"
+      "realtek,rtl8370"   (8 port)
+
+Required properties:
+- mdc-gpios: GPIO line for the MDC clock line.
+- mdio-gpios: GPIO line for the MDIO data line.
+- reset-gpios: GPIO line for the reset signal.
+
+Optional properties:
+- realtek,disable-leds: if the LED drivers are not used in the
+  hardware design this will disable them so they are not turned on
+  and wasting power.
+
+Required subnodes:
+
+- interrupt-controller
+
+  This defines an interrupt controller with an IRQ line (typically
+  a GPIO) that will demultiplex and handle the interrupt from the single
+  interrupt line coming out of one of the SMI-based chips. It most
+  importantly provides link up/down interrupts to the PHY blocks inside
+  the ASIC.
+
+Required properties of interrupt-controller:
+
+- interrupt: parent interrupt, see interrupt-controller/interrupts.txt
+- interrupt-controller: see interrupt-controller/interrupts.txt
+- #address-cells: should be <0>
+- #interrupt-cells: should be <1>
+
+- mdio
+
+  This defines the internal MDIO bus of the SMI device, mostly for the
+  purpose of being able to hook the interrupts to the right PHY and
+  the right PHY to the corresponding port.
+
+Required properties of mdio:
+
+- compatible: should be set to "realtek,smi-mdio" for all SMI devices
+
+See net/mdio.txt for additional MDIO bus properties.
+
+See net/dsa/dsa.txt for a list of additional required and optional properties
+and subnodes of DSA switches.
+
+Examples:
+
+switch {
+	compatible = "realtek,rtl8366rb";
+	/* 22 = MDIO (has input reads), 21 = MDC (clock, output only) */
+	mdc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+	mdio-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
+
+	switch_intc: interrupt-controller {
+		/* GPIO 15 provides the interrupt */
+		interrupt-parent = <&gpio0>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		port@0 {
+			reg = <0>;
+			label = "lan0";
+			phy-handle = <&phy0>;
+		};
+		port@1 {
+			reg = <1>;
+			label = "lan1";
+			phy-handle = <&phy1>;
+		};
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+			phy-handle = <&phy2>;
+		};
+		port@3 {
+			reg = <3>;
+			label = "lan3";
+			phy-handle = <&phy3>;
+		};
+		port@4 {
+			reg = <4>;
+			label = "wan";
+			phy-handle = <&phy4>;
+		};
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+			phy-mode = "rgmii";
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+	};
+
+	mdio {
+		compatible = "realtek,smi-mdio", "dsa-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@0 {
+			reg = <0>;
+			interrupt-parent = <&switch_intc>;
+			interrupts = <0>;
+		};
+		phy1: phy@1 {
+			reg = <1>;
+			interrupt-parent = <&switch_intc>;
+			interrupts = <1>;
+		};
+		phy2: phy@2 {
+			reg = <2>;
+			interrupt-parent = <&switch_intc>;
+			interrupts = <2>;
+		};
+		phy3: phy@3 {
+			reg = <3>;
+			interrupt-parent = <&switch_intc>;
+			interrupts = <3>;
+		};
+		phy4: phy@4 {
+			reg = <4>;
+			interrupt-parent = <&switch_intc>;
+			interrupts = <12>;
+		};
+	};
+};
-- 
2.17.1
