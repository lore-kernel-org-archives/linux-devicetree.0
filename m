From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq-evk: VDD_ARM power rail is always ON
Date: Wed,  9 Oct 2019 15:04:19 +0800
Message-ID: <1570604659-28314-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de, ccaione@baylibre.com, daniel.baluta@nxp.com, andrew.smirnov@gmail.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On i.MX8MQ EVK board, VDD_ARM is from a DC-DC converter which
is always ON, the GPIO1_IO13 is ONLY to switch VDD_ARM's voltage
between 0.9V and 1V for CPU DVFS, so VDD_ARM's GPIO regulator
should be always ON to avoid below confusion after kernel boot
up:

imx8mqevk login:
[   31.776619] vdd_arm: disabling

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 6ede46f..4e0a281 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -48,6 +48,8 @@
 		gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		states = <1000000 0x0
 			  900000 0x1>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	wm8524: audio-codec {
-- 
2.7.4
