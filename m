From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.18 25/59] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Wed, 14 Nov 2018 17:22:57 -0500
Message-ID: <20181114222335.99339-25-sashal@kernel.org>
References: <20181114222335.99339-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114222335.99339-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Leonard Crestez <leonard.crestez@nxp.com>

[ Upstream commit 1ad9fb750a104f51851c092edd7b3553f0218428 ]

Bindings for "fixed-regulator" only explicitly support "gpio" property,
not "gpios". Fix by correcting the property name.

The enet PHYs on imx6sx-sdb needs to be explicitly reset after a power
cycle, this can be handled by the phy-reset-gpios property. Sadly this
is not handled on suspend: the fec driver turns phy-supply off but
doesn't assert phy-reset-gpios again on resume.

Since additional phy-level work is required to support powering off the
phy in suspend fix the problem by just marking the regulator as
"boot-on" "always-on" so that it's never turned off. This behavior is
equivalent to older releases.

Keep the phy-reset-gpios property on fec anyway because it is a correct
description of board design.

This issue was exposed by commit efdfeb079cc3 ("regulator: fixed:
Convert to use GPIO descriptor only") which causes the "gpios" property
to also be parsed. Before that commit the "gpios" property had no
effect, PHY reset was only handled in the the bootloader.

This fixes linux-next boot failures previously reported here:
 https://lore.kernel.org/patchwork/patch/982437/#1177900
 https://lore.kernel.org/patchwork/patch/994091/#1178304

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx6sx-sdb.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
index f8f31872fa14..d6d517e4922f 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -115,7 +115,9 @@
 		regulator-name = "enet_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+		gpio = <&gpio2 6 GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	reg_pcie_gpio: regulator-pcie-gpio {
@@ -178,6 +180,7 @@
 	phy-supply = <&reg_enet_3v3>;
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy1>;
+	phy-reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	mdio {
@@ -371,6 +374,8 @@
 				MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3	0x3081
 				MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081
 				MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91
+				/* phy reset */
+				MX6SX_PAD_ENET2_CRS__GPIO2_IO_7		0x10b0
 			>;
 		};
 
-- 
2.17.1
