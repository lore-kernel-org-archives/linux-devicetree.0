From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 01/10] ARM: dts: meson: use C preprocessor friendly include syntax
Date: Thu, 15 Jun 2017 23:33:43 +0200
Message-ID: <20170615213352.25134-2-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This replaces the "/include/" syntax with the "#include" syntax in all
Amlogic Meson .dts and .dtsi files. That is required to use preprocessor
defines (like GIC_SPI and IRQ_TYPE_EDGE_RISING) in meson.dtsi (all files
which directly or indirectly include meson.dtsi need to use the
"#include" syntax, otherwise the .dts files cannot be compiled).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson6-atv1200.dts | 2 +-
 arch/arm/boot/dts/meson6.dtsi        | 2 +-
 arch/arm/boot/dts/meson8.dtsi        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
index 1237faa63ce6..9444b0d9628f 100644
--- a/arch/arm/boot/dts/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/meson6-atv1200.dts
@@ -46,7 +46,7 @@
  */
 
 /dts-v1/;
-/include/ "meson6.dtsi"
+#include "meson6.dtsi"
 
 / {
 	model = "Geniatech ATV1200";
diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index b0fc91ffd6a1..8557b6117a4b 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -45,7 +45,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/include/ "meson.dtsi"
+#include "meson.dtsi"
 
 / {
 	model = "Amlogic Meson6 SoC";
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index e4f7357b4b31..c5d73b999773 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -45,7 +45,7 @@
 
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
-/include/ "meson.dtsi"
+#include "meson.dtsi"
 
 / {
 	model = "Amlogic Meson8 SoC";
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
