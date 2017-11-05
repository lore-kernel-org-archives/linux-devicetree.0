From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Mon,  6 Nov 2017 00:19:08 +0100
Message-ID: <20171105231909.5599-4-linus.walleij@linaro.org>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171105231909.5599-1-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Antti=20Sepp=C3=A4l=C3=A4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
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
 .../devicetree/bindings/net/dsa/realtek-smi.txt    | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/realtek-smi.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt b/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt
new file mode 100644
index 000000000000..95e96d49c0be
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt
@@ -0,0 +1,104 @@
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
+      "realtek,rtl8369"
+      "realtek,rtl8366rb"
+      "realtek,rtl8366s"
+      "realtek,rtl8367"
+      "realtek,rtl8367b"
+
+Required subnode:
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
+See net/dsa/dsa.txt for a list of additional required and optional properties
+and subnodes.
+
+
+Examples:
+
+switch {
+	compatible = "realtek,rtl8366rb";
+	reg = <0>;
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
+			interrupt-parent = <&switch_intc>;
+			interrupts = <0>;
+		};
+		port@1 {
+			reg = <1>;
+			label = "lan1";
+			interrupt-parent = <&switch_intc>;
+			interrupts = <1>;
+		};
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+			interrupt-parent = <&switch_intc>;
+			interrupts = <2>;
+		};
+		port@3 {
+			reg = <3>;
+			label = "lan3";
+			interrupt-parent = <&switch_intc>;
+			interrupts = <3>;
+		};
+		port@4 {
+			reg = <4>;
+			label = "wan";
+			interrupt-parent = <&switch_intc>;
+			interrupts = <4>;
+		};
+		phy0: port@5 {
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
+};
-- 
2.13.6
