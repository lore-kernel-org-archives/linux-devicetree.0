From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH] arm64: dts: imx8mq: Fix boot from eMMC
Date: Tue, 22 Jan 2019 16:55:46 +0000
Message-ID: <20190122165546.11712-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, abailon@baylibre.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

The boot from eMMC is currently broken on the NXP i.MX8MQ EVK board.
When trying to boot from eMMC it fails with:

...
[    1.271938] mmc1: Tuning failed, falling back to fixed sampling clock
[    1.287429] print_req_error: I/O error, dev mmcblk1, sector 1 flags 0
[    1.306833] mmc1: Tuning failed, falling back to fixed sampling clock
[    1.322325] print_req_error: I/O error, dev mmcblk1, sector 2 flags 0
[    1.329559] Buffer I/O error on dev mmcblk1, logical block 0, async page read
[    1.336714]  mmcblk1: unable to read partition table
...

The problem is the result of a partial misconfiguration of the pins and
the missing assigned clock rate.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 44 ++++++++++----------
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    |  2 +
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 64acccc4bfcb..f74b13aa5aa5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -227,34 +227,34 @@
 
 	pinctrl_usdhc1_100mhz: usdhc1-100grp {
 		fsl,pins = <
-			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x85
-			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xc5
-			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xc5
-			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xc5
-			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xc5
-			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xc5
-			MX8MQ_IOMUXC_SD1_DATA4_USDHC1_DATA4		0xc5
-			MX8MQ_IOMUXC_SD1_DATA5_USDHC1_DATA5		0xc5
-			MX8MQ_IOMUXC_SD1_DATA6_USDHC1_DATA6		0xc5
-			MX8MQ_IOMUXC_SD1_DATA7_USDHC1_DATA7		0xc5
-			MX8MQ_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x85
+			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x8d
+			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xcd
+			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xcd
+			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xcd
+			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xcd
+			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xcd
+			MX8MQ_IOMUXC_SD1_DATA4_USDHC1_DATA4		0xcd
+			MX8MQ_IOMUXC_SD1_DATA5_USDHC1_DATA5		0xcd
+			MX8MQ_IOMUXC_SD1_DATA6_USDHC1_DATA6		0xcd
+			MX8MQ_IOMUXC_SD1_DATA7_USDHC1_DATA7		0xcd
+			MX8MQ_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x8d
 			MX8MQ_IOMUXC_SD1_RESET_B_USDHC1_RESET_B		0xc1
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200grp {
 		fsl,pins = <
-			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x87
-			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xc7
-			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xc7
-			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xc7
-			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xc7
-			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xc7
-			MX8MQ_IOMUXC_SD1_DATA4_USDHC1_DATA4		0xc7
-			MX8MQ_IOMUXC_SD1_DATA5_USDHC1_DATA5		0xc7
-			MX8MQ_IOMUXC_SD1_DATA6_USDHC1_DATA6		0xc7
-			MX8MQ_IOMUXC_SD1_DATA7_USDHC1_DATA7		0xc7
-			MX8MQ_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x87
+			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x9f
+			MX8MQ_IOMUXC_SD1_CMD_USDHC1_CMD			0xdf
+			MX8MQ_IOMUXC_SD1_DATA0_USDHC1_DATA0		0xdf
+			MX8MQ_IOMUXC_SD1_DATA1_USDHC1_DATA1		0xdf
+			MX8MQ_IOMUXC_SD1_DATA2_USDHC1_DATA2		0xdf
+			MX8MQ_IOMUXC_SD1_DATA3_USDHC1_DATA3		0xdf
+			MX8MQ_IOMUXC_SD1_DATA4_USDHC1_DATA4		0xdf
+			MX8MQ_IOMUXC_SD1_DATA5_USDHC1_DATA5		0xdf
+			MX8MQ_IOMUXC_SD1_DATA6_USDHC1_DATA6		0xdf
+			MX8MQ_IOMUXC_SD1_DATA7_USDHC1_DATA7		0xdf
+			MX8MQ_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x9f
 			MX8MQ_IOMUXC_SD1_RESET_B_USDHC1_RESET_B		0xc1
 		>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 8e9d6d5ed7b2..b6d31499fb43 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -360,6 +360,8 @@
 				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
 				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
+				assigned-clocks = <&clk IMX8MQ_CLK_USDHC1>;
+				assigned-clock-rates = <400000000>;
 				fsl,tuning-start-tap = <20>;
 				fsl,tuning-step = <2>;
 				bus-width = <4>;
-- 
2.19.1
