From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/4] ARM: dts: imx7d-sdp: Fix watchdog and pwm pinmux
Date: Thu, 19 Jan 2017 10:09:22 +0100
Message-ID: <20170119090924.19636-3-s.hauer@pengutronix.de>
References: <20170119090924.19636-1-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119090924.19636-1-s.hauer@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

The watchdog pin and the pwm output pin are controlled by the
iomuxc_lpsr, not the regular iomux, so move the pins there.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 2f33c463cbce..84f35a6cbb30 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -502,12 +502,6 @@
 			>;
 		};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX7D_PAD_GPIO1_IO01__PWM1_OUT		0x110b0
-			>;
-		};
-
 		pinctrl_tsc2046_pendown: tsc2046_pendown {
 			fsl,pins = <
 				MX7D_PAD_EPDC_BDR1__GPIO2_IO29		0x59
@@ -635,11 +629,19 @@
 				MX7D_PAD_SD3_STROBE__SD3_STROBE		0x1b
 			>;
 		};
-
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B	0x74
-			>;
-		};
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B	0x74
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO01__PWM1_OUT		0x110b0
+		>;
+	};
+};
\ No newline at end of file
-- 
2.11.0
