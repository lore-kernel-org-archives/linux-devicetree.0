From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv1 3/6] ARM: dts: imx6q-bx50v3: Add internal switch
Date: Wed,  3 Jan 2018 13:26:06 +0100
Message-ID: <20180103122609.5482-4-sebastian.reichel@collabora.co.uk>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

B850v3, B650v3 and B450v3 all have a GPIO bit banged MDIO bus to
communicate with a Marvell switch. On all devices the switch is
connected to a PCI based network card, which needs to be referenced
by DT, so this also adds the common PCI root node.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index b915837bbb5f..689981e90e68 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -92,6 +92,31 @@
 		mux-int-port = <1>;
 		mux-ext-port = <4>;
 	};
+
+	aliases {
+		mdio-gpio0 = &mdio0;
+	};
+
+	mdio0: mdio-gpio {
+		compatible = "virtual,mdio-gpio";
+		gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>, /* mdc */
+			<&gpio2 7 GPIO_ACTIVE_HIGH>; /* mdio */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch@0 {
+				compatible = "marvell,mv88e6240";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				switch_ports: ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+		};
+	};
 };
 
 &ecspi5 {
@@ -326,3 +351,15 @@
 		tcxo-clock-frequency = <26000000>;
 	};
 };
+
+&pcie {
+	/* Synopsys, Inc. Device */
+	pci_root: root@0,0 {
+		compatible = "pci16c3,abcd";
+		reg = <0x00000000 0 0 0 0>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+	};
+};
-- 
2.15.1
