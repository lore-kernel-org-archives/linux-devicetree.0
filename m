From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/3] arm64: dts: meson-axg: s400: add spdifin to the sound card
Date: Thu, 13 Dec 2018 15:36:31 +0100
Message-ID: <20181213143631.19218-4-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable spdif input device on the S400 and add it to the card

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 2f622a0b599a..c8b531ce5c63 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -256,6 +256,9 @@
 				"TODDR_A IN 2", "TDMIN_C OUT",
 				"TODDR_B IN 2", "TDMIN_C OUT",
 				"TODDR_C IN 2", "TDMIN_C OUT",
+				"TODDR_A IN 3", "SPDIFIN Capture",
+				"TODDR_B IN 3", "SPDIFIN Capture",
+				"TODDR_C IN 3", "SPDIFIN Capture",
 				"TODDR_A IN 4", "PDM Capture",
 				"TODDR_B IN 4", "PDM Capture",
 				"TODDR_C IN 4", "PDM Capture",
@@ -333,6 +336,14 @@
 		};
 
 		dai-link-8 {
+			sound-dai = <&spdifin>;
+
+			codec {
+				sound-dai = <&spdif_dir>;
+			};
+		};
+
+		dai-link-9 {
 			sound-dai = <&pdm>;
 
 			codec {
@@ -489,6 +500,12 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
+&spdifin {
+	pinctrl-0 = <&spdif_in_a19_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &spdifout {
 	pinctrl-0 = <&spdif_out_a20_pins>;
 	pinctrl-names = "default";
-- 
2.19.2
