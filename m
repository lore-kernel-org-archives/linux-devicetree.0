From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/4] ARM: dts: imx7s-warp: Fix watchdog pinmux
Date: Thu, 19 Jan 2017 10:09:21 +0100
Message-ID: <20170119090924.19636-2-s.hauer@pengutronix.de>
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

The watchdog pin is controlled by the iomuxc_lpsr, not the regular
iomux, so move it there.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm/boot/dts/imx7s-warp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 0345267f3390..cbb5bc16e713 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -437,7 +437,9 @@
 			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x1b
 		>;
 	};
+};
 
+&iomuxc_lpsr {
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B	0x74
-- 
2.11.0
