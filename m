From: Nick Dyer <nick@shmanahar.org>
Subject: [PATCH v2] ARM: dts: imx51-zii-rdu1: fix touchscreen pinctrl
Date: Wed, 20 Jun 2018 20:42:39 +0100
Message-ID: <20180620194239.2730-1-nick@shmanahar.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Nick Dyer <nick@shmanahar.org>
List-Id: devicetree@vger.kernel.org

The pinctrl settings were incorrect for the touchscreen interrupt line, causing
an interrupt storm. This change has been tested with both the atmel_mxt_ts and
RMI4 drivers on the RDU1 units.

[v2: Use hex, only alter IRQ line config]

Signed-off-by: Nick Dyer <nick@shmanahar.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index df9eca94d812..8a878687197b 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -770,7 +770,7 @@
 
 	pinctrl_ts: tsgrp {
 		fsl,pins = <
-			MX51_PAD_CSI1_D8__GPIO3_12		0x85
+			MX51_PAD_CSI1_D8__GPIO3_12		0x04
 			MX51_PAD_CSI1_D9__GPIO3_13		0x85
 		>;
 	};
-- 
2.17.1
