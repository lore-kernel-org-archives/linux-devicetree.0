From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH 2/3] arm64: dts: meson: g12a: add temperature sensor node
Date: Tue,  4 Jun 2019 16:47:13 +0200
Message-ID: <20190604144714.2009-3-glaroque@baylibre.com>
References: <20190604144714.2009-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604144714.2009-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, khilman@baylibre.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add two temperature sensor
the first near CPU and GPU, second near DDR

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 840dab606110..37f17087bdb1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1360,6 +1360,28 @@
 				};
 			};
 
+			cpu_temp: temperature-sensor@34800 {
+				compatible = "amlogic,meson-g12a-cpu-tsensor",
+					     "amlogic,meson-g12a-tsensor";
+				reg = <0x0 0x34800 0x0 0x50>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				status = "okay";
+				#io-channel-cells = <1>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
+			ddr_temp: temperature-sensor@34c00 {
+				compatible = "amlogic,meson-g12a-ddr-tsensor",
+					     "amlogic,meson-g12a-tsensor";
+				reg = <0x0 0x34c00 0x0 0x50>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				status = "okay";
+				#io-channel-cells = <1>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
 			usb2_phy0: phy@36000 {
 				compatible = "amlogic,g12a-usb2-phy";
 				reg = <0x0 0x36000 0x0 0x2000>;
-- 
2.17.1
