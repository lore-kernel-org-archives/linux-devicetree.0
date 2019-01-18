From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 3/4] arm64: dts: meson: axg: add clk measure support
Date: Fri, 18 Jan 2019 11:34:22 +0100
Message-ID: <20190118103423.15075-4-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock measure device to the axg SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f044473dc7d0..398b7ac1b107 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1610,6 +1610,11 @@
 				status = "disabled";
 			};
 
+			clk_msr: clock-measure@18000 {
+				compatible = "amlogic,meson-axg-clk-measure";
+				reg = <0x0 0x18000 0x0 0x10>;
+			};
+
 			i2c3: i2c@1c000 {
 				compatible = "amlogic,meson-axg-i2c";
 				reg = <0x0 0x1c000 0x0 0x20>;
-- 
2.20.1
