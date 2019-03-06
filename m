From: Adam Ford <aford173@gmail.com>
Subject: [PATCH 3/3] ARM: DTS: imx6q-logicpd: Fix Analog audio capture
Date: Wed,  6 Mar 2019 08:04:01 -0600
Message-ID: <20190306140402.17122-3-aford173@gmail.com>
References: <20190306140402.17122-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306140402.17122-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The original submission had functional audio out and was based
on reviewing other boards using the same wm8962 codec. However,
the Logic PD board uses an analog microphone which was being
disabled for a digital mic.  This patch corrects that and
explicitly sets the gpio-cfg pins all to 0x0000 which allows the
analog microphone to capture audio.

Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
i.MX6QD EVM")

Signed-off-by: Adam Ford <aford173@gmail.com>

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
