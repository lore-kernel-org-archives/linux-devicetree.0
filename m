From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH v2 6/8] ARM: dts: artpec: add and utilize nbpfaxi DMA
 controllers
Date: Wed, 21 Feb 2018 09:59:58 +0100
Message-ID: <20180221090000.18091-7-niklas.cassel@axis.com>
References: <20180221090000.18091-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221090000.18091-1-niklas.cassel@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-kernel@axis.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add nodes for the nbpfaxi DMA controllers used in the artpec6 SoC,
and start using them for the exising UARTs.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 7a6d8f39823a..1c46df0c03ce 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -41,6 +41,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/dma/nbpfaxi.h>
 #include <dt-bindings/clock/axis,artpec6-clkctrl.h>
 #include "skeleton.dtsi"
 
@@ -213,6 +214,51 @@
 		ranges;
 		dma-ranges;
 
+		dma0: dma@f8019000 {
+			compatible = "renesas,nbpfaxi64dmac8b16";
+			reg = <0xf8019000 0x400>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* error */
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch12",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&clkctrl ARTPEC6_CLK_DMA_ACLK>;
+			#dma-cells = <2>;
+			dma-channels = <8>;
+			dma-requests = <8>;
+		};
+		dma1: dma@f8019400 {
+			compatible = "renesas,nbpfaxi64dmac8b16";
+			reg = <0xf8019400 0x400>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* error */
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch12",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&clkctrl ARTPEC6_CLK_DMA_ACLK>;
+			#dma-cells = <2>;
+			dma-channels = <8>;
+			dma-requests = <8>;
+		};
+
 		ethernet: ethernet@f8010000 {
 			clock-names = "stmmaceth", "ptp_ref";
 			clocks = <&clkctrl ARTPEC6_CLK_ETH_ACLK>,
@@ -266,6 +312,9 @@
 			clock-names = "uart_clk", "apb_pclk";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_uart0>;
+			dmas = <&dma0 4 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>,
+			       <&dma0 5 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		uart1: serial@f8037000 {
@@ -277,6 +326,9 @@
 			clock-names = "uart_clk", "apb_pclk";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_uart1>;
+			dmas = <&dma0 6 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>,
+			       <&dma0 7 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		uart2: serial@f8038000 {
@@ -288,6 +340,9 @@
 			clock-names = "uart_clk", "apb_pclk";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_uart2>;
+			dmas = <&dma1 0 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>,
+			       <&dma1 1 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		uart3: serial@f8039000 {
@@ -299,6 +354,9 @@
 			clock-names = "uart_clk", "apb_pclk";
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_uart3>;
+			dmas = <&dma1 2 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>,
+			       <&dma1 3 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 	};
-- 
2.14.2
