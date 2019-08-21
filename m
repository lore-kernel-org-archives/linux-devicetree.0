From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next v2 2/3] dt-bindings: net: dsa: mt7530: Add support for port 5
Date: Wed, 21 Aug 2019 16:45:46 +0200
Message-ID: <20190821144547.15113-3-opensource@vdorst.com>
References: <20190821144547.15113-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190821144547.15113-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

MT7530 port 5 has many modes/configurations.
Update the documentation how to use port 5.

Signed-off-by: René van Dorst <opensource@vdorst.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
v1->v2:
* Adding extra note about RGMII2 and gpio use.
rfc->v1:
* No change
---
 .../devicetree/bindings/net/dsa/mt7530.txt    | 218 ++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index 47aa205ee0bd..43993aae3f9c 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -35,6 +35,42 @@ Required properties for the child nodes within ports container:
 - phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
 	 "cpu".
 
+Port 5 of the switch is muxed between:
+1. GMAC5: GMAC5 can interface with another external MAC or PHY.
+2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
+   of the SOC. Used in many setups where port 0/4 becomes the WAN port.
+   Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
+	 GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
+	 connected to external component!
+
+Port 5 modes/configurations:
+1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
+   GMAC of the SOC.
+   In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
+   GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
+2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
+   It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
+   and RGMII delay.
+3. Port 5 is muxed to GMAC5 and can interface to an external phy.
+   Port 5 becomes an extra switch port.
+   Only works on platform where external phy TX<->RX lines are swapped.
+   Like in the Ubiquiti ER-X-SFP.
+4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
+   Currently a 2nd CPU port is not supported by DSA code.
+
+Depending on how the external PHY is wired:
+1. normal: The PHY can only connect to 2nd GMAC but not to the switch
+2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
+   a ethernet port. But can't interface to the 2nd GMAC.
+
+Based on the DT the port 5 mode is configured.
+
+Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
+When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
+phy-mode must be set, see also example 2 below!
+ * mt7621: phy-mode = "rgmii-txid";
+ * mt7623: phy-mode = "rgmii";
+
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
 be specified.
@@ -94,3 +130,185 @@ Example:
 			};
 		};
 	};
+
+Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
+
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "rgmii-txid";
+		phy-handle = <&phy4>;
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Internal phy */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+		};
+
+		mt7530: switch@1f {
+			compatible = "mediatek,mt7621";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1f>;
+			pinctrl-names = "default";
+			mediatek,mcm;
+
+			resets = <&rstctrl 2>;
+			reset-names = "mcm";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+/* Commented out. Port 4 is handled by 2nd GMAC.
+				port@4 {
+					reg = <4>;
+					label = "lan4";
+				};
+*/
+
+				cpu_port0: port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+		};
+	};
+};
+
+Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
+
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* External phy */
+		ephy5: ethernet-phy@7 {
+			reg = <7>;
+		};
+
+		mt7530: switch@1f {
+			compatible = "mediatek,mt7621";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1f>;
+			pinctrl-names = "default";
+			mediatek,mcm;
+
+			resets = <&rstctrl 2>;
+			reset-names = "mcm";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+				port@4 {
+					reg = <4>;
+					label = "lan4";
+				};
+
+				port@5 {
+					reg = <5>;
+					label = "lan5";
+					phy-mode = "rgmii";
+					phy-handle = <&ephy5>;
+				};
+
+				cpu_port0: port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.20.1
