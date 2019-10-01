From: MarkLee <Mark-MC.Lee@mediatek.com>
Subject: [PATCH net 2/2] arm: dts: mediatek: Fix mt7629 dts to reflect the latest dt-binding
Date: Tue, 1 Oct 2019 20:31:50 +0800
Message-ID: <20191001123150.23135-3-Mark-MC.Lee@mediatek.com>
References: <20191001123150.23135-1-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191001123150.23135-1-Mark-MC.Lee@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@openwrt.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rene van Dorst <opensource@vdorst.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, MarkLee <Mark-MC.Lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

* Removes mediatek,physpeed property from dtsi that is useless in PHYLINK
* Set gmac0 to fixed-link sgmii 2.5Gbit mode
* Set gmac1 to gmii mode that connect to a internal gphy

Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
---
 arch/arm/boot/dts/mt7629-rfb.dts | 13 ++++++++++++-
 arch/arm/boot/dts/mt7629.dtsi    |  2 --
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
index 3621b7d2b22a..6bf1f7d8ddb5 100644
--- a/arch/arm/boot/dts/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mt7629-rfb.dts
@@ -66,9 +66,21 @@
 	pinctrl-1 = <&ephy_leds_pins>;
 	status = "okay";
 
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "sgmii";
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
 	gmac1: mac@1 {
 		compatible = "mediatek,eth-mac";
 		reg = <1>;
+		phy-mode = "gmii";
 		phy-handle = <&phy0>;
 	};
 
@@ -78,7 +90,6 @@
 
 		phy0: ethernet-phy@0 {
 			reg = <0>;
-			phy-mode = "gmii";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 9608bc2ccb3f..867b88103b9d 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -468,14 +468,12 @@
 			compatible = "mediatek,mt7629-sgmiisys", "syscon";
 			reg = <0x1b128000 0x3000>;
 			#clock-cells = <1>;
-			mediatek,physpeed = "2500";
 		};
 
 		sgmiisys1: syscon@1b130000 {
 			compatible = "mediatek,mt7629-sgmiisys", "syscon";
 			reg = <0x1b130000 0x3000>;
 			#clock-cells = <1>;
-			mediatek,physpeed = "2500";
 		};
 	};
 };
-- 
2.17.1
