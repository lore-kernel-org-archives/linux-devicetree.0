From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 4/4] ARM: dts: rskrza1: add mmc DT support
Date: Thu, 15 Sep 2016 15:34:05 -0400
Message-ID: <20160915193405.26943-5-chris.brandt@renesas.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160915193405.26943-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Since the MMC and SDHI1 on the RSK share the same socket connector (CN1),
you cannot enabled MMC and SDHI1 at the same time. Therefore the status
has been set to disabled because SDHI is more popular with this board.
However, keeping this code in here serves as a good way to document how
the MMC on the RZ/A1 has been known to work for someone that does want
to use MMC instead of SDHI1.

A fixed 3.3 regulator is included because it is required by the mmc
driver.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index e5dea5b..9228b04 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -33,6 +33,15 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
+
+	d3_3v: regulator-d3-3v {
+		compatible = "regulator-fixed";
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
@@ -56,6 +65,14 @@
 	};
 };
 
+&mmcif {
+	vmmc-supply = <&d3_3v>;
+	vqmmc-supply = <&d3_3v>;
+	bus-width = <8>;
+	non-removable;
+	status = "disabled"; /* shares CN1 with sdhi1 */
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.9.2
