From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next 3/3] dt-bindings: net: ethernet: Update mt7622 docs and dts to reflect the new phylink API
Date: Wed, 24 Jul 2019 21:24:11 +0200
Message-ID: <20190724192411.20639-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: devicetree@vger.kernel.org

This patch the removes the recently added mediatek,physpeed property.
Use the fixed-link property speed = <2500> to set the phy in 2.5Gbit.
See mt7622-bananapi-bpi-r64.dts for a working example.

Signed-off-by: René van Dorst <opensource@vdorst.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../arm/mediatek/mediatek,sgmiisys.txt        |  2 --
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 28 +++++++++++++------
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  1 -
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
index f5518f26a914..30cb645c0e54 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
@@ -9,8 +9,6 @@ Required Properties:
 	- "mediatek,mt7622-sgmiisys", "syscon"
 	- "mediatek,mt7629-sgmiisys", "syscon"
 - #clock-cells: Must be 1
-- mediatek,physpeed: Should be one of "auto", "1000" or "2500" to match up
-		     the capability of the target PHY.
 
 The SGMIISYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 710c5c3d87d3..2605ab3bc7ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -115,24 +115,34 @@
 };
 
 &eth {
-	pinctrl-names = "default";
-	pinctrl-0 = <&eth_pins>;
 	status = "okay";
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "sgmii";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
 
 	gmac1: mac@1 {
 		compatible = "mediatek,eth-mac";
 		reg = <1>;
-		phy-handle = <&phy5>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
 	};
 
-	mdio-bus {
+	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		phy5: ethernet-phy@5 {
-			reg = <5>;
-			phy-mode = "sgmii";
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index d1e13d340e26..dac51e98204c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -931,6 +931,5 @@
 			     "syscon";
 		reg = <0 0x1b128000 0 0x3000>;
 		#clock-cells = <1>;
-		mediatek,physpeed = "2500";
 	};
 };
-- 
2.20.1
