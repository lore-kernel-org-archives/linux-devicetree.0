From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 05/12] ARM: dts: imx7d: cl-som-imx7: update pfuze3000 max voltage
Date: Mon, 26 Aug 2019 16:37:53 +0100
Message-ID: <20190826153800.35400-5-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The max voltage of SW1A is 3.3V on PF3000 as per
http://cache.freescale.com/files/analog/doc/data_sheet/PF3000.pdf?fsrch=1&sr=1&pageNum=1

While at it, remove the unnecessary leading zero from
the i2c address.

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 481bd3971c55..78046633d91b 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -81,12 +81,12 @@
 
 	pmic: pmic@8 {
 		compatible = "fsl,pfuze3000";
-		reg = <0x08>;
+		reg = <0x8>;
 
 		regulators {
 			sw1a_reg: sw1a {
 				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1475000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <6250>;
-- 
2.23.0.rc1
