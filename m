From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 08/10] ARM: dts: imx6ul: segin: Move ECSPI interface to board
 include file
Date: Tue, 9 Jul 2019 09:19:25 +0200
Message-ID: <1562656767-273566-9-git-send-email-s.riedmueller@phytec.de>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The ECSPI interface is available on the expansion connector of every
PHYTEC phyBOARD-Segin. Move its definition to the board include file
for better reuse.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts | 14 --------------
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi            | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
index c6ef13685a7c..32d90c67a6f2 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
@@ -28,9 +28,6 @@
 };
 
 &ecspi3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_ecspi3>;
-	cs-gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -93,14 +90,3 @@
 &usdhc1 {
 	status = "okay";
 };
-
-&iomuxc {
-	pinctrl_ecspi3: ecspi3grp {
-		fsl,pins = <
-			MX6UL_PAD_UART2_RTS_B__ECSPI3_MISO	0x10b0
-			MX6UL_PAD_UART2_CTS_B__ECSPI3_MOSI	0x10b0
-			MX6UL_PAD_UART2_RX_DATA__ECSPI3_SCLK	0x10b0
-			MX6UL_PAD_UART2_TX_DATA__GPIO1_IO20	0x10b0
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
index 7cd24ec40c36..8d5f8dc6ad58 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
@@ -103,6 +103,13 @@
 	assigned-clock-rates = <786432000>;
 };
 
+&ecspi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi3>;
+	cs-gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+	status = "disabled";
+};
+
 &fec2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>;
@@ -225,6 +232,15 @@
 		>;
 	};
 
+	pinctrl_ecspi3: ecspi3grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_RTS_B__ECSPI3_MISO	0x10b0
+			MX6UL_PAD_UART2_CTS_B__ECSPI3_MOSI	0x10b0
+			MX6UL_PAD_UART2_RX_DATA__ECSPI3_SCLK	0x10b0
+			MX6UL_PAD_UART2_TX_DATA__GPIO1_IO20	0x10b0
+		>;
+	};
+
 	pinctrl_enet2: enet2grp {
 		fsl,pins = <
 			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
-- 
2.7.4
