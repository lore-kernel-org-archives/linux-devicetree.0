From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] ARM: dts: imx6: add thermal sensor and cooling cells
Date: Mon,  5 Nov 2018 18:34:02 +0100
Message-ID: <20181105173402.30431-1-l.stach@pengutronix.de>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This allows a board to specify a custom thermal zone configuration
involving the SoC internal sensor, CPU and GPU nodes without having
to change those nodes.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm/boot/dts/imx6q.dtsi   | 1 +
 arch/arm/boot/dts/imx6qdl.dtsi | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 0193ee6fe964..01afef23efd9 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -202,6 +202,7 @@
 				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
 			clock-names = "bus", "core";
 			power-domains = <&pd_pu>;
+			#cooling-cells = <2>;
 		};
 
 		ipu2: ipu@2800000 {
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 61d2d26afbf4..81e9147e877c 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -77,6 +77,7 @@
 		fsl,tempmon = <&anatop>;
 		fsl,tempmon-data = <&ocotp>;
 		clocks = <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+		#thermal-sensor-cells = <0>;
 	};
 
 	ldb: ldb {
@@ -216,6 +217,7 @@
 				 <&clks IMX6QDL_CLK_GPU3D_SHADER>;
 			clock-names = "bus", "core", "shader";
 			power-domains = <&pd_pu>;
+			#cooling-cells = <2>;
 		};
 
 		gpu_2d: gpu@134000 {
@@ -226,6 +228,7 @@
 				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
 			clock-names = "bus", "core";
 			power-domains = <&pd_pu>;
+			#cooling-cells = <2>;
 		};
 
 		timer@a00600 {
-- 
2.19.1
