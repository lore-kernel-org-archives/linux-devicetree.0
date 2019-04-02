From: Adam Ford <aford173@gmail.com>
Subject: [PATCH V2] ARM: dts: imx6q-logicpd: Enable Analog audio capture
Date: Tue,  2 Apr 2019 14:25:45 -0500
Message-ID: <20190402192547.4538-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The original submission had functional audio out and was based
on reviewing other boards using the same wm8962 codec. However,
the Logic PD board uses an analog microphone which was being
disabled for a digital mic.  This patch corrects that and
explicitly sets the gpio-cfg pins all to 0x0000 which allows the
analog microphone to capture audio.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Remove 'fixes' note reference Shawn's request.

diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
index e31b6923cb72..db6b5b900826 100644
--- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
@@ -248,9 +248,9 @@
 		gpio-cfg = <
 			0x0000 /* 0:Default */
 			0x0000 /* 1:Default */
-			0x0013 /* 2:FN_DMICCLK */
+			0x0000 /* 2:FN_DMICCLK */
 			0x0000 /* 3:Default */
-			0x8014 /* 4:FN_DMICCDAT */
+			0x0000 /* 4:FN_DMICCDAT */
 			0x0000 /* 5:Default */
 		>;
 	};
-- 
2.17.1
