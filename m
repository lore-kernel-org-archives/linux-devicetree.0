Return-Path: <SRS0=kKXI=DL=macbookpro.malat.net=mathieu@kernel.org>
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 05/25] arm: imx: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 12:15:55 +0100
Message-Id: <20171215111620.20379-5-malat@debian.org>
In-Reply-To: <20171215111620.20379-1-malat@debian.org>
References: <20171214165350.27850-1-malat@debian.org>
 <20171215111620.20379-1-malat@debian.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Barry Song <baohua@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This will solve as a side effect warning:

Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/arm/boot/dts/imx6q-display5.dtsi | 2 +-
 arch/arm/boot/dts/imx7d.dtsi          | 2 +-
 arch/arm/boot/dts/imx7s.dtsi          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-display5.dtsi b/arch/arm/boot/dts/imx6q-display5.dtsi
index 4084de43d4d9..09085fde3341 100644
--- a/arch/arm/boot/dts/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/imx6q-display5.dtsi
@@ -255,7 +255,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: tfa9879@6C {
+	codec: tfa9879@6c {
 		#sound-dai-cells = <0>;
 		compatible = "nxp,tfa9879";
 		reg = <0x6C>;
diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 4d308d17f040..369d5a166b3e 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -129,7 +129,7 @@
 		status = "disabled";
 	};
 
-	pcie: pcie@0x33800000 {
+	pcie: pcie@33800000 {
 		compatible = "fsl,imx7d-pcie", "snps,dw-pcie";
 		reg = <0x33800000 0x4000>,
 		      <0x4ff00000 0x80000>;
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 82ad26e766eb..a00ba897e58d 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -583,7 +583,7 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					pgc_pcie_phy: pgc-power-domain@IMX7_POWER_DOMAIN_PCIE_PHY {
+					pgc_pcie_phy: pgc-power-domain@imx7_power_domain_pcie_phy {
 						#power-domain-cells = <0>;
 						reg = <IMX7_POWER_DOMAIN_PCIE_PHY>;
 						power-supply = <&reg_1p0d>;
-- 
2.11.0
