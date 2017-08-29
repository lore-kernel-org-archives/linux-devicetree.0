From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: iwg20d-q7: Add RTC support
Date: Tue, 29 Aug 2017 10:56:23 +0100
Message-ID: <1504000583-21996-3-git-send-email-biju.das@bp.renesas.com>
References: <1504000583-21996-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504000583-21996-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Define the iWave RainboW-G20D-Qseven board dependent part of the
RTC device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
v1-->v2
   * Added ti to bq32000 compatible string - Thanks Geert
   * Repositioned i2c2_pins node.

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index e30c586..2b58b53 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -50,6 +50,11 @@
 };
 
 &pfc {
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data_d";
 		function = "scif0";
@@ -107,3 +112,16 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@68 {
+		compatible = "ti,bq32000";
+		reg = <0x68>;
+	};
+};
-- 
1.9.1
