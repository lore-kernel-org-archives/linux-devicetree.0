From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/5] ARM: dts: meson8b: add the Mali-450 MP2 GPU
Date: Sat,  8 Dec 2018 18:12:47 +0100
Message-ID: <20181208171247.22238-6-martin.blumenstingl@googlemail.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, mturquette@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Add the Mali-450 GPU and it's OPP table for Meson8. The GPU uses two
pixel processors in this configuration. The OPP table is taken from the
3.10 vendor kernel which uses the following table:
  FCLK_DEV5 | 1,     /* 255 Mhz */
  FCLK_DEV7 | 0,     /* 364 Mhz */
  FCLK_DEV3 | 1,     /* 425 Mhz */
  FCLK_DEV5 | 0,     /* 510 Mhz */
  FCLK_DEV4 | 0,     /* 637.5 Mhz */
This describes the mux (FCLK_DEVx) and a 0-based divider in the clock
controller. "FCLK" is "fixed_pll" which is running at 2550MHz.
The "turbo" setting is described by "turbo_clock = 4" where 4 is the
index of the table above.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 5d036842c355..dd498e681939 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -158,6 +158,32 @@
 		};
 	};
 
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-255000000 {
+			opp-hz = /bits/ 64 <255000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-364300000 {
+			opp-hz = /bits/ 64 <364300000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-510000000 {
+			opp-hz = /bits/ 64 <510000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-637500000 {
+			opp-hz = /bits/ 64 <637500000>;
+			opp-microvolt = <1150000>;
+			turbo-mode;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a5-pmu";
 		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
@@ -185,6 +211,26 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0xd0000000 0x200000>;
+
+		mali: gpu@c0000 {
+			compatible = "amlogic,meson8b-mali", "arm,mali-450";
+			reg = <0xc0000 0x40000>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp", "gpmmu", "pp", "pmu",
+					  "pp0", "ppmmu0", "pp1", "ppmmu1";
+			resets = <&reset RESET_MALI>;
+			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+			clock-names = "bus", "core";
+			operating-points-v2 = <&gpu_opp_table>;
+			switch-delay = <0xffff>;
+		};
 	};
 }; /* end of / */
 
-- 
2.19.2
