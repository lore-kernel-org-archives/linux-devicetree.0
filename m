Return-Path: <SRS0=Z3v4=OP=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 4/4] ARM: dts: iwg23s-sbc: Enable RTC
Date: Thu,  6 Dec 2018 08:55:59 +0000
Message-Id: <1544086559-47141-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable NXP pcf85263 real time clock for the iWave SBC based on RZ/G1C.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
	* No change
V2-->V3
	* No change
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 40b7f98..77d1824 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -84,12 +84,30 @@
 	clock-frequency = <20000000>;
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+	};
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii_tx_rx";
 		function = "avb";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3_c";
+		function = "i2c3";
+	};
+
 	mmc_pins_uhs: mmc_uhs {
 		groups = "mmc_data8", "mmc_ctrl";
 		function = "mmc";
-- 
2.7.4
