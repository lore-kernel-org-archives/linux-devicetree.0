Return-Path: <SRS0=5gDw=OO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/5] ARM: dts: r8a7744-iwg20m: Add SPI NOR support
Date: Wed,  5 Dec 2018 09:06:52 +0000
Message-Id: <1544000815-28069-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for the SPI NOR device used to boot up the system
to the iWave RZ/G1N Qseven System On Module DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
     * Removed compatible string "sst,sst25vf016b".
---
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
index 503583e..82ee3c1 100644
--- a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
@@ -36,6 +36,11 @@
 		function = "mmc";
 	};
 
+	qspi_pins: qspi {
+		groups = "qspi_ctrl", "qspi_data2";
+		function = "qspi";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -53,6 +58,27 @@
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
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+		m25p,fast-read;
+		spi-cpol;
+		spi-cpha;
+	};
+};
+
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
