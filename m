From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dtsi: iwg22m: Add eMMC support
Date: Thu, 17 Aug 2017 18:31:43 +0100
Message-ID: <1502991103-2325-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1502991103-2325-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502991103-2325-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Add eMMC support for iW-RainboW-G22M-SM.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
index 9dbd854..afb1148 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
+++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
@@ -17,8 +17,34 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x20000000>;
 	};
+
+	reg_3p3v: 3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &extal_clk {
 	clock-frequency = <20000000>;
 };
+
+&pfc {
+	mmcif0_pins: mmc {
+		groups = "mmc_data8", "mmc_ctrl";
+		function = "mmc";
+	};
+};
+
+&mmcif0 {
+	pinctrl-0 = <&mmcif0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&reg_3p3v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
-- 
2.7.4
