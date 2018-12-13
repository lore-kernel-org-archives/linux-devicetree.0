From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/3] arm64: dts: meson-axg: s400: add spdif-dir codec
Date: Thu, 13 Dec 2018 15:36:30 +0100
Message-ID: <20181213143631.19218-3-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the SPDIF capture codec to the axg s400 board

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index af2f2619bbc1..2f622a0b599a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -95,6 +95,13 @@
 		sound-name-prefix = "MIC";
 	};
 
+	spdif_dir: audio-codec-4 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dir";
+		status = "okay";
+		sound-name-prefix = "DIR";
+	};
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
-- 
2.19.2
