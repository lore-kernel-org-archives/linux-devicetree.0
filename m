From: tinywrkb <tinywrkb@gmail.com>
Subject: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s max-speed
Date: Tue, 10 Sep 2019 18:55:07 +0300
Message-ID: <20190910155507.491230-1-tinywrkb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: tinywrkb@gmail.com, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Cubox-i Solo/DualLite carrier board has 100Mb/s magnetics while the
Atheros AR8035 PHY on the MicroSoM v1.3 CPU module is a 1GbE PHY device.

Since commit 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode in
genphy_read_status") ethernet is broken on Cubox-i Solo/DualLite devices.

This adds a phy node to the MicroSoM DTS and a 100Mb/s max-speed limit
to the Cubox-i Solo/DualLite carrier DTS.

Signed-off-by: tinywrkb <tinywrkb@gmail.com>
---
This patch fixes ethernet on my Cubox-i2-300-D which is limited to 100Mb/s,
afaik due to the carrier board  magnetics, and was since commit 5502b218e001
("net: phy: use phy_resolve_aneg_linkmode in genphy_read_status")

The AR8035 PHY on the CPU module reports to the driver as 1GbE capable
via MII_BSMR's BMSR_ESTATEN status bit, the auto-negotiation sets the
speed at 1GbE while the carrier board can't support it.
Same behavior with the generic phy_device and the at803x drivers.

While the PHY is on the CPU module board I added the max-speed limit to
the cubox-i carrier DTS as I suspect that if the Solo or DualLite v1.3
MicroSoM will be connected to a 1GbE capable carrier board then it would
work correctly with 1GbE.

I can confirm that this commit doesn't break networking on the my
Cubox-i4Pro Quad (i4P-300-D) with it's 1GbE capable carrier board, and
was tested separately with the generic phy_device and at803x drivers.

 arch/arm/boot/dts/imx6dl-cubox-i.dts  | 4 ++++
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-cubox-i.dts b/arch/arm/boot/dts/imx6dl-cubox-i.dts
index 2b1b3e193f53..cfc82513c78c 100644
--- a/arch/arm/boot/dts/imx6dl-cubox-i.dts
+++ b/arch/arm/boot/dts/imx6dl-cubox-i.dts
@@ -49,3 +49,7 @@
 	model = "SolidRun Cubox-i Solo/DualLite";
 	compatible = "solidrun,cubox-i/dl", "fsl,imx6dl";
 };
+
+&ethphy {
+	max-speed = <100>;
+};
diff --git a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
index 6d7f6b9035bc..969bc96c3f99 100644
--- a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
@@ -57,6 +57,15 @@
 	phy-reset-duration = <2>;
 	phy-reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	status = "okay";
+	phy-handle = <&ethphy>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+		};
+	};
 };
 
 &iomuxc {
-- 
2.23.0
