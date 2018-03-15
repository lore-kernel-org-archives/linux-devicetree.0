From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 4/4] ARM64: dts: meson-gx: fix gxl clock controller compatible
Date: Thu, 15 Mar 2018 12:55:45 +0100
Message-ID: <20180315115545.1884-5-jbrunet@baylibre.com>
References: <20180315115545.1884-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315115545.1884-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There are a few differences between the gxbb and gxl clock controllers
which makes them incompatible. The hdmi, gp0 and fixed pll are
different. The rate of these plls reported by gxbb driver on a gxl
device would be wrong.

Remove the gxbb compatible from the gxl clock controller node so only
the correct driver is matched.

Fixes: 973fbd55b53c ("ARM64: dts: meson-gxl: Add clock nodes")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 6b7dfa2d48e4..86f673017a1f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -208,7 +208,7 @@
 
 &sysctrl {
 	clkc: clock-controller {
-		compatible = "amlogic,gxl-clkc", "amlogic,gxbb-clkc";
+		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
 	};
 };
-- 
2.14.3
