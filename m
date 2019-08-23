From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 14/14] arm64: dts: meson: fix boards regulators
 states format
Date: Fri, 23 Aug 2019 09:02:48 +0200
Message-ID: <20190823070248.25832-15-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This fixes the following DT schemas check errors:
meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts          | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts           | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi              | 4 ++--
 .../arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts   | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 6cfc2c69bb4f..7c0cf510fd16 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -66,8 +66,8 @@
 		gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
 
-		states = <3300000 0
-			  1800000 1>;
+		states = <3300000 0>,
+			 <1800000 1>;
 	};
 
 	flash_1v8: regulator-flash_1v8 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index b636912a2715..afcf8a9f667b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -75,8 +75,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 9972b1515da6..6039adda12ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -77,8 +77,8 @@
 		gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
 
-		states = <3300000 0
-			  1800000 1>;
+		states = <3300000 0>,
+			 <1800000 1>;
 	};
 
 	vcc1v8: regulator-vcc1v8 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index e8f925871edf..89f7b41b0e9e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -46,8 +46,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 
 		regulator-settling-time-up-us = <10000>;
 		regulator-settling-time-down-us = <150000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
index 796baea7a0bf..c8d74e61dec1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
@@ -38,8 +38,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 26907ac82930..c433a031841f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -38,8 +38,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
-- 
2.22.0
