From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/8] ARM: dts: armada-370-rd: Utilize new DSA binding
Date: Sun,  1 Jan 2017 18:22:42 -0800
Message-ID: <20170102022249.10657-2-f.fainelli@gmail.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170102022249.10657-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: vivien.didelot@savoirfairelinux.com, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
Document new binding"). The legacy binding node is kept included, but is marked
disabled.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/armada-370-rd.dts | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index c3fd6e49212f..9c6e924ac0b3 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -173,6 +173,8 @@
 	};
 
 	dsa {
+		status = "disabled";
+
 		compatible = "marvell,dsa";
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -235,6 +237,48 @@
 	phy0: ethernet-phy@0 {
 		reg = <0>;
 	};
+
+	switch: switch@10 {
+		compatible = "marvell,mv88e6085";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <16>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "lan0";
+			};
+
+			port@1 {
+			       reg = <1>;
+			       label = "lan1";
+			};
+
+			port@2 {
+			       reg = <2>;
+			       label = "lan2";
+			};
+
+			port@3 {
+			       reg = <3>;
+			       label = "lan3";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "cpu";
+				ethernet = <&eth1>;
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
 };
 
 
-- 
2.9.3
