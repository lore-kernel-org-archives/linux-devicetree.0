Return-Path: <SRS0=kKXI=DL=macbookpro.malat.net=mathieu@kernel.org>
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 07/25] arm: keystone: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 12:15:57 +0100
Message-Id: <20171215111620.20379-7-malat@debian.org>
In-Reply-To: <20171215111620.20379-1-malat@debian.org>
References: <20171214165350.27850-1-malat@debian.org>
 <20171215111620.20379-1-malat@debian.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Jon Mason <jonmason@broadcom.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Barry Song <baohua@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
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
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi  | 2 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi | 2 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi  | 2 +-
 arch/arm/boot/dts/keystone.dtsi            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
index ba828cb59587..940b64935bde 100644
--- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
@@ -98,7 +98,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
index a5ac845464bf..ed7287a274a0 100644
--- a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
@@ -115,7 +115,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
index 66f615a74118..b6af5f78e498 100644
--- a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
@@ -97,7 +97,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 06e10544f9b1..f8ecbe504182 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -271,7 +271,7 @@
 			ti,davinci-gpio-unbanked = <32>;
 		};
 
-		aemif: aemif@21000A00 {
+		aemif: aemif@21000a00 {
 			compatible = "ti,keystone-aemif", "ti,davinci-aemif";
 			#address-cells = <2>;
 			#size-cells = <1>;
-- 
2.11.0
