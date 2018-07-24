From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 10/14] arm64: dts: meson-axg: add linein codec
Date: Tue, 24 Jul 2018 14:52:34 +0200
Message-ID: <20180724125238.14567-11-jbrunet@baylibre.com>
References: <20180724125238.14567-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724125238.14567-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the es7241 analog to digital converter which is fed by the
lienin jack of the s400

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 7489b88f27d7..fb101a1c6660 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -178,6 +178,16 @@
 			gpios = <&gpio_speaker 2 0>;
 		};
 	};
+
+	linein: audio-codec@0 {
+		#sound-dai-cells = <0>;
+		compatible = "everest,es7241";
+		VDDA-supply = <&vcc_3v3>;
+		VDDP-supply = <&vcc_3v3>;
+		VDDD-supply = <&vcc_3v3>;
+		status = "okay";
+		sound-name-prefix = "Linein";
+	};
 };
 
 &ethmac {
-- 
2.17.1
