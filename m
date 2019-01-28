Return-Path: <SRS0=/eZE=QE=ysoft.com=michal.vokac@kernel.org>
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH RESEND v2 3/4] ARM: dts: imx28-cfa10036: Fix the reset gpio signal polarity
Date: Mon, 28 Jan 2019 12:53:02 +0100
Message-Id: <1548676383-29685-4-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
References: <1548676383-29685-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

The reset signal of the SSD1306 OLED display is actually active-low.
Adapt the DT to reflect the real world.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes in v2 resend:
 - Add Acked-by from Alexandre.

Changes from v1:
 - Add R-by from Rob

 arch/arm/boot/dts/imx28-cfa10036.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx28-cfa10036.dts b/arch/arm/boot/dts/imx28-cfa10036.dts
index d3e3622..de48b58 100644
--- a/arch/arm/boot/dts/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/imx28-cfa10036.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Crystalfontz CFA-10036 Board";
@@ -96,7 +97,7 @@
 					pinctrl-names = "default";
 					pinctrl-0 = <&ssd1306_cfa10036>;
 					reg = <0x3c>;
-					reset-gpios = <&gpio2 7 0>;
+					reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
 					solomon,height = <32>;
 					solomon,width = <128>;
 					solomon,page-offset = <0>;
-- 
2.1.4
