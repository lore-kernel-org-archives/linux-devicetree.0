From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/4] ARM64: dts: meson-axg: use hhi syscon for the clock controller
Date: Thu, 15 Mar 2018 12:55:44 +0100
Message-ID: <20180315115545.1884-4-jbrunet@baylibre.com>
References: <20180315115545.1884-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315115545.1884-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Like the meson-gx, the axg clock controller should go through a syscon
to access the hhi register region, and not directly map the region.
This way, the hhi register region can be used safely by multiple drivers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b58808eb3cc8..d4c5507fff30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -262,10 +262,14 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
 
-			clkc: clock-controller@0 {
-				compatible = "amlogic,axg-clkc";
-				#clock-cells = <1>;
-				reg = <0x0 0x0 0x0 0x320>;
+			sysctrl: system-controller@0 {
+				compatible = "amlogic,meson-axg-hhi-sysctrl", "syscon", "simple-mfd";
+				reg = <0 0 0 0x400>;
+
+				clkc: clock-controller {
+					compatible = "amlogic,axg-clkc";
+					#clock-cells = <1>;
+				};
 			};
 		};
 
-- 
2.14.3
