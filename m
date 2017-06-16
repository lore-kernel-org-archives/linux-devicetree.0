From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH v4 3/4] ARM: dts: imx6ul-geam: Skip suffix -kit from dts name
Date: Fri, 16 Jun 2017 12:34:39 +0530
Message-ID: <1497596680-3186-3-git-send-email-jteki@openedev.com>
References: <1497596680-3186-1-git-send-email-jteki@openedev.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497596680-3186-1-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

Engicam SOM's with mounted on starter kits like icorem6(rqs), isiot
usually not explicitly named with -kit in dts file names and
instead Model has mentioned 'Starter kit' So apply the same rule
for geam SOM as well.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- New patch

 arch/arm/boot/dts/Makefile                                 | 2 +-
 arch/arm/boot/dts/{imx6ul-geam-kit.dts => imx6ul-geam.dts} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-geam-kit.dts => imx6ul-geam.dts} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9449493..824db0e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -466,7 +466,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-udoo-neo-full.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
-	imx6ul-geam-kit.dtb \
+	imx6ul-geam.dtb \
 	imx6ul-isiot-emmc.dtb \
 	imx6ul-isiot-nand.dtb \
 	imx6ul-liteboard.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-geam-kit.dts b/arch/arm/boot/dts/imx6ul-geam.dts
similarity index 99%
rename from arch/arm/boot/dts/imx6ul-geam-kit.dts
rename to arch/arm/boot/dts/imx6ul-geam.dts
index d709252..e251ad2 100644
--- a/arch/arm/boot/dts/imx6ul-geam-kit.dts
+++ b/arch/arm/boot/dts/imx6ul-geam.dts
@@ -47,7 +47,7 @@
 #include "imx6ul.dtsi"
 
 / {
-	model = "Engicam GEAM6UL";
+	model = "Engicam GEAM6UL Starter Kit";
 	compatible = "engicam,imx6ul-geam", "fsl,imx6ul";
 
 	memory {
-- 
2.7.4
