From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 03/10] ARM: dts: imx6ul: segin: Reduce eth drive strength
Date: Tue, 9 Jul 2019 09:19:20 +0200
Message-ID: <1562656767-273566-4-git-send-email-s.riedmueller@phytec.de>
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

Reduce the drive strength for the MDC, MDIO and TX pins of FEC1 and FEC2
on the phyBOARD-Segin to improve signal quality and EMC. Also disable
internal pull-ups on the MDC and MDIO pins.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi | 12 ++++++------
 arch/arm/boot/dts/imx6ul-phytec-segin.dtsi       |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
index bff13d0eb064..1b745582911c 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
@@ -93,16 +93,16 @@
 &iomuxc {
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
-			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
-			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x10010
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x10010
 			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
 			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
 			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
 			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
-			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
-			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
-			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
-			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b010
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b010
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b010
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b010
 			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0x17059
 		>;
 	};
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
index 78425c3290a1..28ba3a4c4c74 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
@@ -230,10 +230,10 @@
 			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
 			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
 			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
-			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
-			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
-			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
-			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
+			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b010
+			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b010
+			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b010
+			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b010
 		>;
 	};
 
-- 
2.7.4
