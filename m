From: Hans Ole Hatzel <hohatzel@jusst.de>
Subject: [PATCH 3/4] ARM: dts: imx7d: sbc imx7: add uart2
Date: Tue,  4 Dec 2018 12:07:40 +0100
Message-ID: <20181204110741.6943-4-hohatzel@jusst.de>
References: <20181204110741.6943-1-hohatzel@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204110741.6943-1-hohatzel@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, ilya@compulab.co.il, devicetree@vger.kernel.org, linux-imx@nxp.com, fabio.estevam@nxp.com, shawnguo@kernel.org
Cc: Julian Scheel <jscheel@jusst.de>, Hans Ole Hatzel <hohatzel@jusst.de>
List-Id: devicetree@vger.kernel.org

Adds uart2 connections as used on the sbc. This uart is connected via
the soc's pins 3 (TX) and 5 (RX). On the sbc it is pinned out on P4
using pins 31 (RX) and 33 (TX).

Signed-off-by: Hans Ole Hatzel <hohatzel@jusst.de>
Signed-off-by: Julian Scheel <jscheel@jusst.de>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/imx7d-sbc-imx7.dts    |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index e77e0cc7de39..6c2c844dc052 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -214,6 +214,15 @@
 	status = "okay";
 };
 
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	assigned-clocks = <&clks IMX7D_UART2_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
+	status = "disabled";
+	fsl;
+};
+
 &usbotg1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usbotg1>;
@@ -314,6 +323,13 @@
 		>;
 	};
 
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX7D_PAD_LCD_ENABLE__UART2_DCE_TX		0x79
+			MX7D_PAD_LCD_CLK__UART2_DCE_RX		0x79
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX7D_PAD_SD2_CMD__SD2_CMD			0x59
diff --git a/arch/arm/boot/dts/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
index f8a868552707..74904127fbc6 100644
--- a/arch/arm/boot/dts/imx7d-sbc-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
@@ -26,6 +26,10 @@
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-- 
2.19.2
