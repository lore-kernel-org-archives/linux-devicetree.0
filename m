From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v4 6/6] arm64: dts: imx8mq-evk: enable watchdog
Date: Wed, 14 Nov 2018 18:52:42 +0100
Message-ID: <20181114175242.12468-6-l.stach@pengutronix.de>
References: <20181114175242.12468-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181114175242.12468-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Baruch Siach <baruch@tkos.co.il>

The external nWDOG signal connects to the EVK board reset circuit.

Tested on the i.MX8MQ EVK rev B3.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v4:
 - added patch to series
 - rebased pinctrl to upstream accepted driver binding
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 04ce13f855c2..64acccc4bfcb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -160,6 +160,13 @@
 	status = "okay";
 };
 
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
@@ -287,4 +294,10 @@
 			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xc1
 		>;
 	};
+
+	pinctrl_wdog: wdog1grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0xc6
+		>;
+	};
 };
-- 
2.19.1
