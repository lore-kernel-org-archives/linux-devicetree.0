From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: fix clk_msr node
Date: Thu,  7 Feb 2019 14:26:02 +0100
Message-ID: <20190207132603.694-2-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207132603.694-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The clk-msr node should be in cbus.

Fixes: eeca2cf15e05 ("arm64: dts: meson: g12a: add clk measure support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index c9d53103a58b..05ea750b8c16 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -217,11 +217,11 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
-		};
 
-		clk_msr: clock-measure@ffd18000 {
-			compatible = "amlogic,meson-g12a-clk-measure";
-			reg = <0x0 0xffd18000 0x0 0x10>;
+			clk_msr: clock-measure@18000 {
+				compatible = "amlogic,meson-g12a-clk-measure";
+				reg = <0x0 0x18000 0x0 0x10>;
+			};
 		};
 	};
 
-- 
2.20.1
