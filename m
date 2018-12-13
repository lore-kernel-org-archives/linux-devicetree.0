From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/3] arm64: dts: meson-axg: add spdifin
Date: Thu, 13 Dec 2018 15:36:29 +0100
Message-ID: <20181213143631.19218-2-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the SPDIF input device of the axg audio subsystem

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index fffd55787981..781632bd60ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1260,6 +1260,18 @@
 				status = "disabled";
 			};
 
+			spdifin: audio-controller@400 {
+				compatible = "amlogic,axg-spdifin";
+				reg = <0x0 0x400 0x0 0x30>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "SPDIFIN";
+				interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+					 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+				clock-names = "pclk", "refclk";
+				status = "disabled";
+			};
+
 			spdifout: audio-controller@480 {
 				compatible = "amlogic,axg-spdifout";
 				reg = <0x0 0x480 0x0 0x50>;
-- 
2.19.2
