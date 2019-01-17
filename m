From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson-axg: add efuse device
Date: Thu, 17 Jan 2019 11:02:34 +0100
Message-ID: <20190117100234.30989-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add efuse to the AXG family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index ae336cb34e29..0e0abb1a03e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -111,6 +111,14 @@
 		compatible = "amlogic,meson-gxbb-sm";
 	};
 
+	efuse: efuse {
+		compatible = "amlogic,meson-gxbb-efuse";
+		clocks = <&clkc CLKID_EFUSE>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		read-only;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.20.1
