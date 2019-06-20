From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH] arm64: dts: fsl: librem5: Limit the USB to 5V
Date: Thu, 20 Jun 2019 11:04:39 -0600
Message-ID: <20190620170439.18762-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The charge controller can handle 14V but the PTC on the devkit can only
handle 6V so limit the negotiated voltage to 5V.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 3f4736fd3cea..ec85ada77955 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -353,7 +353,7 @@
 			sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM |
 				PDO_FIXED_DUAL_ROLE |
 				PDO_FIXED_DATA_SWAP )
-			     PDO_VAR(5000, 12000, 2000)>;
+			     PDO_VAR(5000, 3000, 3000)>;
 			op-sink-microwatt = <10000000>;
 
 			ports {
-- 
2.17.1
