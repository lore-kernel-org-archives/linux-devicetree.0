From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 4/5] ARM: dts: imx7d: move input header into base device tree
Date: Sun, 26 Jun 2016 01:47:54 -0700
Message-ID: <20160626084755.21925-5-stefan@agner.ch>
References: <20160626084755.21925-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626084755.21925-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, fabio.estevam@nxp.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, grinberg@compulab.co.il, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The base device tree uses KEY_POWER in the snvs-powerkey node,
hence include the input.h header file in the base device tree.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Acked-by: Igor Grinberg <grinberg@compulab.co.il>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 1 -
 arch/arm/boot/dts/imx7d-nitrogen7.dts   | 1 -
 arch/arm/boot/dts/imx7d-sdb.dts         | 1 -
 arch/arm/boot/dts/imx7s.dtsi            | 1 +
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 4863451..58b09bf 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -12,7 +12,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
 #include "imx7d.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index bef394e..ce08f18 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -42,7 +42,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
 #include "imx7d.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index d6da506..a0ae036 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -42,7 +42,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
 #include "imx7d.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 672dde2..7486c52 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -43,6 +43,7 @@
 
 #include <dt-bindings/clock/imx7d-clock.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "imx7d-pinfunc.h"
 #include "skeleton.dtsi"
-- 
2.8.3
