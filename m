From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 4/4] arm64: dts: meson: g12a: add clk measure support
Date: Fri, 18 Jan 2019 11:34:23 +0100
Message-ID: <20190118103423.15075-5-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock measure device to the g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index bd24de947a5b..59900ddb7b43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -193,6 +193,11 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
+
+		clk_msr: clock-measure@ffd18000 {
+			compatible = "amlogic,meson-g12a-clk-measure";
+			reg = <0x0 0xffd18000 0x0 0x10>;
+		};
 	};
 
 	timer {
-- 
2.20.1
