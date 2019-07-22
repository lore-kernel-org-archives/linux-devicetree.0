From: fugang.duan@nxp.com
Subject: [PATCH arm64/dts 1/2] arm64: dts: imx8qxp: add lpuart baud clock
Date: Mon, 22 Jul 2019 16:28:23 +0800
Message-ID: <20190722082824.15022-2-fugang.duan@nxp.com>
References: <20190722082824.15022-1-fugang.duan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722082824.15022-1-fugang.duan@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: festevam@gmail.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, daniel.baluta@gmail.com, fugang.duan@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Add imx8qxp lpuart baud clock.

V2:
- separate v1 patch to two patches, one is to add baud clock,
  the other is to add serial alias property.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05fa0b7..21bdd4d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -209,8 +209,9 @@
 			reg = <0x5a060000 0x1000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART0_BAUD_CLK>;
-			clock-names = "ipg";
+			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART0_IPG_CLK>,
+				 <&adma_lpcg IMX_ADMA_LPCG_UART0_BAUD_CLK>;
+			clock-names = "ipg", "baud";
 			power-domains = <&pd IMX_SC_R_UART_0>;
 			status = "disabled";
 		};
@@ -220,8 +221,9 @@
 			reg = <0x5a070000 0x1000>;
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART1_BAUD_CLK>;
-			clock-names = "ipg";
+			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART1_IPG_CLK>,
+				 <&adma_lpcg IMX_ADMA_LPCG_UART1_BAUD_CLK>;
+			clock-names = "ipg", "baud";
 			power-domains = <&pd IMX_SC_R_UART_1>;
 			status = "disabled";
 		};
@@ -231,8 +233,9 @@
 			reg = <0x5a080000 0x1000>;
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART2_BAUD_CLK>;
-			clock-names = "ipg";
+			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART2_IPG_CLK>,
+				 <&adma_lpcg IMX_ADMA_LPCG_UART2_BAUD_CLK>;
+			clock-names = "ipg", "baud";
 			power-domains = <&pd IMX_SC_R_UART_2>;
 			status = "disabled";
 		};
@@ -242,8 +245,9 @@
 			reg = <0x5a090000 0x1000>;
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART3_BAUD_CLK>;
-			clock-names = "ipg";
+			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART3_IPG_CLK>,
+				 <&adma_lpcg IMX_ADMA_LPCG_UART3_BAUD_CLK>;
+			clock-names = "ipg", "baud";
 			power-domains = <&pd IMX_SC_R_UART_3>;
 			status = "disabled";
 		};
-- 
2.7.4
