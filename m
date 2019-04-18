From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/6] arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
Date: Thu, 18 Apr 2019 14:27:10 +0200
Message-ID: <20190418122714.30805-3-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

While some 3.3v eMMC 4.0 are available from libretech, Only the 1.8v 5.0
modules are recommended and supported for the aml-s905x-cc.

the 1.8v is provided by LDOs on the eMMC card, from vcc 3.3v

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index d4d5e3e5439d..b0f22cdb586c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -115,11 +115,13 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
+	/* This is provided by LDOs on the eMMC daugther card */
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
 	};
 };
 
@@ -253,8 +255,9 @@
 
 	bus-width = <8>;
 	cap-mmc-highspeed;
-	mmc-ddr-3_3v;
-	max-frequency = <50000000>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
 	disable-wp;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
2.20.1
