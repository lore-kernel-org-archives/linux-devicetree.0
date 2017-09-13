From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 8/8] ARM: drs: iwg22m: Add SPI NOR support
Date: Wed, 13 Sep 2017 18:05:41 +0100
Message-ID: <1505322341-9480-9-git-send-email-chris.paterson2@renesas.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Paterson <chris.paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add support for the SPI NOR device used to boot up the system
to the System on Module DT.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
This patch is based on renesas-devel-20170913-v4.13.

This patch is dependant on:
- "of: add vendor prefix for Silicon Storage Technology Inc."
- "doc: dt: mtd: Add sst25vf016b to the list of supported chip names"


 arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
index f7f9cef..ed9a8cf 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
+++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
@@ -39,6 +39,11 @@
 		function = "mmc";
 	};
 
+	qspi_pins: qspi {
+		groups = "qspi_ctrl", "qspi_data2";
+		function = "qspi";
+	};
+
 	sdhi1_pins: sd1 {
 		groups = "sdhi1_data4", "sdhi1_ctrl";
 		function = "sdhi1";
@@ -61,6 +66,27 @@
 	status = "okay";
 };
 
+&qspi {
+	pinctrl-0 = <&qspi_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WARNING - This device contains the bootloader. Handle with care. */
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "sst,sst25vf016b", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		m25p,fast-read;
+		spi-cpol;
+		spi-cpha;
+	};
+};
+
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
