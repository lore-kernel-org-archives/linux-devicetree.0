From: jassisinghbrar@gmail.com
Subject: [PATCH net-next v6 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Sat,  6 Jan 2018 19:44:19 +0530
Message-ID: <1515248059-4190-1-git-send-email-jassisinghbrar@gmail.com>
References: <1515247999-4041-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1515247999-4041-1-git-send-email-jassisinghbrar@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: davem@davemloft.net, arnd.bergmann@linaro.org, andrew@lunn.ch, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jassisinghbrar@gmail.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jassisinghbrar@gmail.com>

This patch adds documentation for Device-Tree bindings for the
Socionext NetSec Controller driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 .../devicetree/bindings/net/socionext-netsec.txt   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt

diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
new file mode 100644
index 0000000..0cff94f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
@@ -0,0 +1,53 @@
+* Socionext NetSec Ethernet Controller IP
+
+Required properties:
+- compatible: Should be "socionext,synquacer-netsec"
+- reg: Address and length of the control register area, followed by the
+       address and length of the EEPROM holding the MAC address and
+       microengine firmware
+- interrupts: Should contain ethernet controller interrupt
+- clocks: phandle to the PHY reference clock
+- clock-names: Should be "phy_ref_clk"
+- phy-mode: See ethernet.txt file in the same directory
+- phy-handle: See ethernet.txt in the same directory.
+
+- mdio device tree subnode: When the Netsec has a phy connected to its local
+		mdio, there must be device tree subnode with the following
+		required properties:
+
+	- #address-cells: Must be <1>.
+	- #size-cells: Must be <0>.
+
+	For each phy on the mdio bus, there must be a node with the following
+	fields:
+	- compatible: Refer to phy.txt
+	- reg: phy id used to communicate to phy.
+
+Optional properties: (See ethernet.txt file in the same directory)
+- dma-coherent: Boolean property, must only be present if memory
+	accesses performed by the device are cache coherent.
+- local-mac-address: See ethernet.txt in the same directory.
+- mac-address: See ethernet.txt in the same directory.
+- max-speed: See ethernet.txt in the same directory.
+- max-frame-size: See ethernet.txt in the same directory.
+
+Example:
+	eth0: ethernet@522d0000 {
+		compatible = "socionext,synquacer-netsec";
+		reg = <0 0x522d0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
+		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_netsec>;
+		clock-names = "phy_ref_clk";
+		phy-mode = "rgmii";
+		max-speed = <1000>;
+		max-frame-size = <9000>;
+		phy-handle = <&phy1>;
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-ieee802.3-c22";
+				reg = <1>;
+			};
+		};
-- 
2.7.4
