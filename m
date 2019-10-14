From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 3/4] MIPS: ath79: ar9331: add ar9331-switch node
Date: Mon, 14 Oct 2019 08:15:48 +0200
Message-ID: <20191014061549.3669-4-o.rempel@pengutronix.de>
References: <20191014061549.3669-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014061549.3669-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Chris Snook <chris.snook@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <jhogan@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Vivien Didelot <vivien.didelot@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add switch node supported by dsa ar9331 driver.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/ar9331.dtsi           | 128 ++++++++++++++++++-
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts |  13 ++
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index e0f409dd6acf..abd597af7ead 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -158,6 +158,9 @@
 			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
 			clock-names = "eth", "mdio";
 
+			phy-mode = "mii";
+			phy-handle = <&phy_port4>;
+
 			status = "disabled";
 		};
 
@@ -165,13 +168,136 @@
 			compatible = "qca,ar9330-eth";
 			reg = <0x1a000000 0x200>;
 			interrupts = <5>;
-
 			resets = <&rst 13>, <&rst 23>;
 			reset-names = "mac", "mdio";
 			clocks = <&pll ATH79_CLK_AHB>, <&pll ATH79_CLK_AHB>;
 			clock-names = "eth", "mdio";
 
+			phy-mode = "gmii";
+			phy-handle = <&switch_port0>;
+
 			status = "disabled";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				switch10: switch@10 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compatible = "qca,ar9331-switch";
+					reg = <16>;
+					resets = <&rst 8>;
+					reset-names = "switch";
+
+					interrupt-parent = <&miscintc>;
+					interrupts = <12>;
+
+					interrupt-controller;
+					#interrupt-cells = <1>;
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						switch_port0: port@0 {
+							reg = <0>;
+							label = "cpu";
+							ethernet = <&eth1>;
+
+							phy-mode = "gmii";
+
+							fixed-link {
+								speed = <1000>;
+								full-duplex;
+							};
+						};
+
+						switch_port1: port@1 {
+							reg = <1>;
+							phy-handle = <&phy_port0>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port2: port@2 {
+							reg = <2>;
+							phy-handle = <&phy_port1>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port3: port@3 {
+							reg = <3>;
+							phy-handle = <&phy_port2>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port4: port@4 {
+							reg = <4>;
+							phy-handle = <&phy_port3>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+
+						switch_port5: port@5 {
+							reg = <5>;
+							phy-handle = <&phy_port4>;
+							phy-mode = "internal";
+
+							status = "disabled";
+						};
+					};
+
+					mdio {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						interrupt-parent = <&switch10>;
+
+						phy_port0: phy@0 {
+							reg = <0>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port1: phy@1 {
+							reg = <1>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port2: phy@2 {
+							reg = <2>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port3: phy@3 {
+							reg = <3>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+
+						phy_port4: phy@4 {
+							reg = <4>;
+							interrupts = <0>;
+							status = "disabled";
+						};
+					};
+				};
+			};
 		};
 
 		usb: usb@1b000100 {
diff --git a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
index 77bab823eb3b..0f2b20044834 100644
--- a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
@@ -84,3 +84,16 @@
 &eth1 {
 	status = "okay";
 };
+
+&switch_port1 {
+	label = "lan0";
+	status = "okay";
+};
+
+&phy_port0 {
+	status = "okay";
+};
+
+&phy_port4 {
+	status = "okay";
+};
-- 
2.23.0
