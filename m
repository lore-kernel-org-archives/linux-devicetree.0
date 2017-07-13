From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2] ARM: dts: iwg20m: Add MMCIF0 support
Date: Thu, 13 Jul 2017 16:39:00 +0100
Message-ID: <1499960340-25310-1-git-send-email-chris.paterson2@renesas.com>
References: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Paterson <chris.paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Define the iwg20m board dependent part of the MMCIF0 device node.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
This patch is based on:
   renesas-devel-20170713-v4.12
 + pinctrl: sh-pfc: r8a7791: Add R8A7743 support
 + pinctrl: sh-pfc: r8a7791: Add missing mmc_data8_b pin group

v1->v2:
 - Corrected data pin group to mmc_data8_b - Thanks Geert.


 arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
index 001ca91..f78dbc5 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
@@ -22,8 +22,34 @@
 		device_type = "memory";
 		reg = <2 0x00000000 0 0x20000000>;
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
+		groups = "mmc_data8_b", "mmc_ctrl";
+		function = "mmc";
+	};
+};
+
+&mmcif0 {
+		pinctrl-0 = <&mmcif0_pins>;
+		pinctrl-names = "default";
+
+		vmmc-supply = <&reg_3p3v>;
+		bus-width = <8>;
+		non-removable;
+		status = "okay";
+};
-- 
1.9.1
