From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 05/10] ARM: dts: imx6ul: segin: Make FEC and ethphy
 configurable in dts
Date: Tue, 9 Jul 2019 09:19:22 +0200
Message-ID: <1562656767-273566-6-git-send-email-s.riedmueller@phytec.de>
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

To disable Ethernet interfaces in case they are not populated
make the FEC and Ethernet PHY status configurable in the dts files.

Also change the Ethernet PHYs labels to make them correspond to
the MDIO address.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi      |  7 ++++---
 arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts | 12 ++++++++++++
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi            |  5 +++--
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
index 73266b4a889b..fee7a7e938ee 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
@@ -42,20 +42,21 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet1>;
 	phy-mode = "rmii";
-	phy-handle = <&ethphy0>;
-	status = "okay";
+	phy-handle = <&ethphy1>;
+	status = "disabled";
 
 	mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy0: ethernet-phy@1 {
+		ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			interrupt-parent = <&gpio1>;
 			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 			micrel,led-mode = <1>;
 			clocks = <&clks IMX6UL_CLK_ENET_REF>;
 			clock-names = "rmii-ref";
+			status = "disabled";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
index dc06029c5701..81a82dd65019 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
@@ -34,6 +34,18 @@
 	status = "okay";
 };
 
+&ethphy1 {
+	status = "okay";
+};
+
+&ethphy2 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
 &fec2 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
index 28ba3a4c4c74..7cd24ec40c36 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
@@ -107,7 +107,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>;
 	phy-mode = "rmii";
-	phy-handle = <&ethphy1>;
+	phy-handle = <&ethphy2>;
 	status = "disabled";
 };
 
@@ -160,11 +160,12 @@
 };
 
 &mdio {
-	ethphy1: ethernet-phy@2 {
+	ethphy2: ethernet-phy@2 {
 		reg = <2>;
 		micrel,led-mode = <1>;
 		clocks = <&clks IMX6UL_CLK_ENET2_REF>;
 		clock-names = "rmii-ref";
+		status = "disabled";
 	};
 };
 
-- 
2.7.4
