From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 2/2] arm64: dts: imx8qxp: sort LSIO subsystem devices
Date: Mon, 24 Jun 2019 09:12:03 +0800
Message-ID: <20190624011203.10711-2-shawnguo@kernel.org>
References: <20190624011203.10711-1-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190624011203.10711-1-shawnguo@kernel.org>
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

We prefer to sort device nodes under simple bus in order of unit
address.  Let's sort the devices under lsio_subsys properly.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 106 ++++++++++-----------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 33bf0a53db9e..2ce7030c5c4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -403,59 +403,6 @@
 		#size-cells = <1>;
 		ranges = <0x5d000000 0x0 0x5d000000 0x1000000>;
 
-		lsio_lpcg: clock-controller@5d400000 {
-			compatible = "fsl,imx8qxp-lpcg-lsio";
-			reg = <0x5d400000 0x400000>;
-			#clock-cells = <1>;
-		};
-
-		lsio_mu0: mailbox@5d1b0000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d1b0000 0x10000>;
-			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-			status = "disabled";
-		};
-
-		lsio_mu1: mailbox@5d1c0000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d1c0000 0x10000>;
-			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-		};
-
-		lsio_mu2: mailbox@5d1d0000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d1d0000 0x10000>;
-			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-			status = "disabled";
-		};
-
-		lsio_mu3: mailbox@5d1e0000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d1e0000 0x10000>;
-			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-			status = "disabled";
-		};
-
-		lsio_mu4: mailbox@5d1f0000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d1f0000 0x10000>;
-			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-			status = "disabled";
-		};
-
-		lsio_mu13: mailbox@5d280000 {
-			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
-			reg = <0x5d280000 0x10000>;
-			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells = <2>;
-			power-domains = <&pd IMX_SC_R_MU_13A>;
-		};
-
 		lsio_gpio0: gpio@5d080000 {
 			compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
 			reg = <0x5d080000 0x10000>;
@@ -543,5 +490,58 @@
 			#interrupt-cells = <2>;
 			power-domains = <&pd IMX_SC_R_GPIO_7>;
 		};
+
+		lsio_mu0: mailbox@5d1b0000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d1b0000 0x10000>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
+		lsio_mu1: mailbox@5d1c0000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d1c0000 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		lsio_mu2: mailbox@5d1d0000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d1d0000 0x10000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
+		lsio_mu3: mailbox@5d1e0000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d1e0000 0x10000>;
+			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
+		lsio_mu4: mailbox@5d1f0000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d1f0000 0x10000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
+		lsio_mu13: mailbox@5d280000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d280000 0x10000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			power-domains = <&pd IMX_SC_R_MU_13A>;
+		};
+
+		lsio_lpcg: clock-controller@5d400000 {
+			compatible = "fsl,imx8qxp-lpcg-lsio";
+			reg = <0x5d400000 0x400000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.18.0
