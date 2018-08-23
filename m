From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 1/2] ARM: dts: imx6ull-14x14-evk: correct machine model name
Date: Thu, 23 Aug 2018 16:41:13 +0800
Message-ID: <1535013674-21356-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, stefan.wahren@i2se.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

i.MX6ULL is a lite version of i.MX6UL, its full name
is i.MX6 UltraLiteLite, NOT UlltraLite.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6ull-14x14-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ull-14x14-evk.dts b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
index 30ef603..0ba6454 100644
--- a/arch/arm/boot/dts/imx6ull-14x14-evk.dts
+++ b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
@@ -45,7 +45,7 @@
 #include "imx6ul-14x14-evk.dtsi"
 
 / {
-	model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
+	model = "Freescale i.MX6 UltraLiteLite 14x14 EVK Board";
 	compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
 };
 
-- 
2.7.4
