From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/6] ARM64: dts: meson-axg: remove spdif out from gpio a7
Date: Mon, 16 Jul 2018 12:11:48 +0200
Message-ID: <20180716101151.31109-4-jbrunet@baylibre.com>
References: <20180716101151.31109-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716101151.31109-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Spdif out in not multiplexed on gpio A7 (spdif in is)
Remove this entry to fix the problem.

Fixes: 53c03b0aff36 ("ARM64: dts: meson-axg: add spdif output pins")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 08e5f431c025..cc908c9b5306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -575,13 +575,6 @@
 					};
 				};
 
-				spdif_out_a7_pins: spdif_out_a7 {
-					mux {
-						groups = "spdif_out_a7";
-						function = "spdif_out";
-					};
-				};
-
 				spdif_out_a11_pins: spdif_out_a11 {
 					mux {
 						groups = "spdif_out_a11";
-- 
2.14.4
