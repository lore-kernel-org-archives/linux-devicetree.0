From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 6/7] arm64: dts: meson: g12a: add pdm
Date: Fri, 12 Apr 2019 14:51:35 +0200
Message-ID: <20190412125136.28232-7-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the PDM audio capture device of the g12a SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 90b23bacd51c..ab46b2b0fb86 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -239,6 +239,19 @@
 				};
 			};
 
+			pdm: audio-controller@40000 {
+				compatible = "amlogic,g12a-pdm",
+					     "amlogic,axg-pdm";
+				reg = <0x0 0x40000 0x0 0x34>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "PDM";
+				clocks = <&clkc_audio AUD_CLKID_PDM>,
+					 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+					 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+				clock-names = "pclk", "dclk", "sysclk";
+				status = "disabled";
+			};
+
 			audio: bus@42000 {
 				compatible = "simple-bus";
 				reg = <0x0 0x42000 0x0 0x2000>;
-- 
2.20.1
