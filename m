From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv1 4/6] ARM: dts: imx6q-b850v3: Add switch port configuration
Date: Wed,  3 Jan 2018 13:26:07 +0100
Message-ID: <20180103122609.5482-5-sebastian.reichel@collabora.co.uk>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for the Marvell switch and names the network
ports according to the labels, that can be found next to the
connectors ("ID", "IX", "ePort 1", "ePort 2"). The switch is
connected to the host system using a PCI based network card.

The PCI bus configuration has been written using the following
information:

root@b850v3# lspci -tv
-[0000:00]---00.0-[01]----00.0-[02-05]--+-01.0-[03]----00.0  Intel Corporation I210 Gigabit Network Connection
                                        +-02.0-[04]----00.0  Intel Corporation I210 Gigabit Network Connection
                                        \-03.0-[05]--
root@b850v3# lspci -nn
00:00.0 PCI bridge [0604]: Synopsys, Inc. Device [16c3:abcd] (rev 01)
01:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
02:01.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
02:02.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
02:03.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
03:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)
04:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx6q-b850v3.dts | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 46bdc6722715..a55ccdfb341c 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -212,3 +212,73 @@
 		};
 	};
 };
+
+&pci_root {
+	/* PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch */
+	bridge@1,0 {
+		compatible = "pci10b5,8605";
+		reg = <0x00010000 0 0 0 0>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+
+		bridge@2,1 {
+			compatible = "pci10b5,8605";
+			reg = <0x00020800 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+
+			/* Intel Corporation I210 Gigabit Network Connection */
+			ethernet@3,0 {
+				compatible = "pci8086,1533";
+				reg = <0x00030000 0 0 0 0>;
+			};
+		};
+
+		bridge@2,2 {
+			compatible = "pci10b5,8605";
+			reg = <0x00021000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+
+			/* Intel Corporation I210 Gigabit Network Connection */
+			switch_nic: ethernet@4,0 {
+				compatible = "pci8086,1533";
+				reg = <0x00040000 0 0 0 0>;
+			};
+		};
+	};
+};
+
+&switch_ports {
+	port@0 {
+		reg = <0>;
+		label = "eneport1";
+	};
+
+	port@1 {
+		reg = <1>;
+		label = "eneport2";
+	};
+
+	port@2 {
+		reg = <2>;
+		label = "enix";
+	};
+
+	port@3 {
+		reg = <3>;
+		label = "enid";
+	};
+
+	port@4 {
+		reg = <4>;
+		label = "cpu";
+		ethernet = <&switch_nic>;
+	};
+};
-- 
2.15.1
