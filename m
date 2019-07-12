From: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
Subject: [PATCH] arm: dts: imx6qdl: add gpio expander pca9535
Date: Fri, 12 Jul 2019 14:45:22 +0200
Message-ID: <20190712124522.571-1-gilles.doffe@savoirfairelinux.com>
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
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, festevam@gmail.com, s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

The pca9535 gpio expander is present on the Rex baseboard, but missing
from the dtsi.

Add the new gpio controller and the associated interrupt line
MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.

Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
---
 arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
index 97f1659144ea..d5324c6761c1 100644
--- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
@@ -136,6 +136,19 @@
 		compatible = "atmel,24c02";
 		reg = <0x57>;
 	};
+
+	gpio8: pca9535@27 {
+		compatible = "nxp,pca9535";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9535>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
 };
 
 &i2c3 {
@@ -237,6 +250,12 @@
 			>;
 		};
 
+		pinctrl_pca9535: pca9535 {
+			fsl,pins = <
+				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x00017059
+		   >;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins = <
 				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-- 
2.19.1
