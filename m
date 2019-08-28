From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0 regulator
Date: Wed, 28 Aug 2019 20:27:21 +0000
Message-ID: <20190828202723.1145-2-linux.amoon@gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As per shematics VDDIO_AO18, VDDIO_AO3V3/VDD3V3 DDR3_1V5/DDR_VDDC:
fixed regulator output which is supplied by P5V0.

Rename vcc3v3 regulator node to vddio_ao3v3 as per shematics.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 792698a60a12..98e742bf44c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -104,11 +104,34 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vcc3v3: regulator-vcc3v3 {
+	vddio_ao1v8: regulator-vddio-ao1v8 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC3V3";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/* U17 RT9179GB */
+		vin-supply = <&p5v0>;
+	};
+
+	vddio_ao3v3: regulator-vddio-ao3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		/* U11 MP2161GJ-C499 */
+		vin-supply = <&p5v0>;
+	};
+
+	vddc_ddr: regulator-vddc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "DDR_VDDC";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		/* U15 MP2161GJ-C499 */
+		vin-supply = <&p5v0>;
 	};
 
 	emmc_pwrseq: emmc-pwrseq {
@@ -301,7 +324,7 @@
 	mmc-hs200-1_8v;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-	vmmc-supply = <&vcc3v3>;
+	vmmc-supply = <&vddio_ao3v3>;
 	vqmmc-supply = <&vcc1v8>;
 };
 
-- 
2.23.0
