From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/2] arm64: dts: imx8mq: add GPC power domains
Date: Fri, 14 Dec 2018 11:55:10 +0100
Message-ID: <20181214105510.1174-2-l.stach@pengutronix.de>
References: <20181214105510.1174-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181214105510.1174-1-l.stach@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds support for the power domain controller found on the
i.MX8MQ SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 66 +++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index a55b9329376b..c521cd1b6820 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/imx8mq-clock.h>
+#include <dt-bindings/power/imx8mq-power.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "imx8mq-pinfunc.h"
@@ -252,6 +253,71 @@
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
 			};
+
+			gpc: gpc@303a0000 {
+				compatible = "fsl,imx8mq-gpc";
+				reg = <0x303a0000 0x10000>;
+
+				pgc {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pgc_mipi: pgc-power-domain@0 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_MIPI>;
+					};
+
+					pgc_pcie1: pgc-power-domain@1 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_PCIE1>;
+					};
+
+					pgc_otg1: pgc-power-domain@2 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_USB_OTG1>;
+					};
+
+					pgc_otg2: pgc-power-domain@3 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_USB_OTG2>;
+					};
+
+					pgc_ddr1: pgc-power-domain@4 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_DDR1>;
+					};
+
+					pgc_gpu: pgc-power-domain@5 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_GPU>;
+					};
+
+					pgc_vpu: pgc-power-domain@6 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_VPU>;
+					};
+
+					pgc_disp: pgc-power-domain@7 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_DISP>;
+					};
+
+					pgc_mipi_csi1: pgc-power-domain@8 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_MIPI_CSI1>;
+					};
+
+					pgc_mipi_csi2: pgc-power-domain@9 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_MIPI_CSI2>;
+					};
+
+					pgc_pcie2: pgc-power-domain@10 {
+						#power-domain-cells = <0>;
+						reg = <IMX8M_POWER_DOMAIN_PCIE2>;
+					};
+				};
+			};
 		};
 
 		bus@30400000 { /* AIPS2 */
-- 
2.19.1
