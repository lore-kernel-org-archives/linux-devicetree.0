From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] ARM: dts: imx51-zii-rdu1: cleanup eMMC node
Date: Wed, 16 May 2018 09:53:49 +0300
Message-ID: <20180516065349.11160-1-nikita.yoush@cogentembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On RDU1, sdhc1 is used for eMMC, and that is 3.3V only.

Thus configure device node not to probe it as SD/SDIO and not try 1.8V.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index 0c99ac04ad08..ad2a7c9b203e 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -462,7 +462,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_esdhc1>;
 	bus-width = <4>;
+	no-1-8-v;
 	non-removable;
+	no-sdio;
+	no-sd;
 	status = "okay";
 };
 
-- 
2.11.0
