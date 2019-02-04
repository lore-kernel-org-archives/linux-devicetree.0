From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH net-next 3/3] dt-bindings: net: Add fixed-link support
Date: Mon,  4 Feb 2019 09:30:40 -0800
Message-ID: <20190204173040.5538-4-moritz.fischer@ettus.com>
References: <20190204173040.5538-1-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190204173040.5538-1-moritz.fischer@ettus.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williams@ni.com, andrew@lunn.ch, robh+dt@kernel.org, davem@davemloft.net, moritz.fischer@ettus.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

Update device-tree binding with fixed-link support.

With fixed-link support the formerly required property 'phy-handle'
is now optional if 'fixed-link' child is present.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 .../devicetree/bindings/net/nixge.txt         | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
index bb2929f9c64f..85d7240a9b20 100644
--- a/Documentation/devicetree/bindings/net/nixge.txt
+++ b/Documentation/devicetree/bindings/net/nixge.txt
@@ -12,12 +12,14 @@ Required properties:
 - interrupts: Should contain tx and rx interrupt
 - interrupt-names: Should be "rx" and "tx"
 - phy-mode: See ethernet.txt file in the same directory.
-- phy-handle: See ethernet.txt file in the same directory.
 - nvmem-cells: Phandle of nvmem cell containing the MAC address
 - nvmem-cell-names: Should be "address"
 
 Optional properties:
 - mdio subnode to indicate presence of MDIO controller
+- fixed-link : Assume a fixed link. See fixed-link.txt in the same directory.
+  Use instead of phy-handle.
+- phy-handle: See ethernet.txt file in the same directory.
 
 Examples (10G generic PHY):
 	nixge0: ethernet@40000000 {
@@ -59,3 +61,32 @@ Examples (10G generic PHY, no MDIO):
 		phy-mode = "xgmii";
 		phy-handle = <&ethernet_phy1>;
 	};
+
+Examples (1G generic fixed-link + MDIO):
+	nixge0: ethernet@40000000 {
+		compatible = "ni,xge-enet-2.00";
+		reg = <0x40000000 0x6000>;
+
+		nvmem-cells = <&eth1_addr>;
+		nvmem-cell-names = "address";
+
+		interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>, <0 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "rx", "tx";
+		interrupt-parent = <&intc>;
+
+		phy-mode = "xgmii";
+
+		fixed-link {
+			speed = <1000>;
+			pause;
+			link-gpios = <&gpio0 63 GPIO_ACTIVE_HIGH>;
+		};
+
+		mdio {
+			ethernet_phy1: ethernet-phy@4 {
+				compatible = "ethernet-phy-ieee802.3-c22";
+				reg = <4>;
+			};
+		};
+
+	};
-- 
2.20.1
