From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv5 5/5] ARM: dts: imx6q-b450v3: Add switch port configuration
Date: Tue, 23 Jan 2018 16:03:50 +0100
Message-ID: <20180123150350.11031-6-sebastian.reichel@collabora.co.uk>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This adds support for the Marvell switch and names the network
ports according to the labels, that can be found next to the
connectors. The switch is connected to the host system using a
PCI based network card.

The PCI bus configuration has been written using the following
information:

root@b450v3# lspci -tv
-[0000:00]---00.0-[01]----00.0  Intel Corporation I210 Gigabit Network Connection
root@b450v3# lspci -nn
00:00.0 PCI bridge [0604]: Synopsys, Inc. Device [16c3:abcd] (rev 01)
01:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx6q-b450v3.dts | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
index 404a93d9596b..3ec58500e9c2 100644
--- a/arch/arm/boot/dts/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -112,3 +112,55 @@
                 line-name = "PCA9539-P07";
         };
 };
+
+&pci_root {
+	/* Intel Corporation I210 Gigabit Network Connection */
+	switch_nic: ethernet@3,0 {
+		compatible = "pci8086,1533";
+		reg = <0x00010000 0 0 0 0>;
+	};
+};
+
+&switch_ports {
+	port@0 {
+		reg = <0>;
+		label = "enacq";
+		phy-handle = <&switchphy0>;
+	};
+
+	port@1 {
+		reg = <1>;
+		label = "eneport1";
+		phy-handle = <&switchphy1>;
+	};
+
+	port@2 {
+		reg = <2>;
+		label = "enix";
+		phy-handle = <&switchphy2>;
+	};
+
+	port@3 {
+		reg = <3>;
+		label = "enid";
+		phy-handle = <&switchphy3>;
+	};
+
+	port@4 {
+		reg = <4>;
+		label = "cpu";
+		ethernet = <&switch_nic>;
+		phy-handle = <&switchphy4>;
+	};
+
+	port@5 {
+		reg = <5>;
+		label = "enembc";
+
+		/* connected to Ethernet MAC of AT91RM9200 in MII mode */
+		fixed-link {
+			speed = <100>;
+			full-duplex;
+		};
+	};
+};
-- 
2.15.1
