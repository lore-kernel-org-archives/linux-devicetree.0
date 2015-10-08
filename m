From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu,  8 Oct 2015 17:20:09 +0200
Message-ID: <1444317612-818-2-git-send-email-cedric.madianga@gmail.com>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mcoquelin.stm32@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, vinod.koul@intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32 dma
controller.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
---
 .../devicetree/bindings/dma/stm32-dma.txt          | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/stm32-dma.txt b/Documentation/devicetree/bindings/dma/stm32-dma.txt
new file mode 100644
index 0000000..9ce0d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/stm32-dma.txt
@@ -0,0 +1,98 @@
+* STMicroelectronics STM32 DMA controller
+
+The STM32 DMA is a general-purpose direct memory access controller capable of
+supporting 8 independent DMA channels. Each channel can have up to 8 requests.
+
+Required properties:
+- compatible: Should be "st,stm32-dma"
+- reg: Should contain DMA registers location and length. This should include
+  all of the per-channel registers.
+- interrupts: Should contain all of the per-channel DMA interrupts.
+- clocks: Should contain the input clock of the DMA instance.
+- #dma-cells : Must be <4>. See DMA client paragraph for more details.
+
+Optional properties:
+- resets: Reference to a reset controller asserting the DMA controller
+- st,mem2mem: boolean; if defined, it indicates that the controller supports
+  memory-to-memory transfer
+
+Example:
+
+	dma2: dma-controller@40026400 {
+		compatible = "st,stm32-dma";
+		reg = <0x40026400 0x400>;
+		interrupts = <56>,
+			     <57>,
+			     <58>,
+			     <59>,
+			     <60>,
+			     <68>,
+			     <69>,
+			     <70>;
+		clocks = <&clk_hclk>;
+		#dma-cells = <4>;
+		st,mem2mem;
+		resets = <&rcc 150>;
+	};
+
+* DMA client
+
+Required properties:
+- dmas: Comma separated list of dma channel requests
+- dma-names: Names of the aforementioned requested channels
+
+Each dmas request consists of 5 cells:
+1. A phandle pointing to the STM32 DMA controller
+2. The channel id
+3. The request line number
+4. A 32bit mask specifying the DMA channel configuration
+ -bit 1: Direct Mode Error Interrupt
+	0x0: disabled
+	0x1: enabled
+ -bit 2: Transfer Error Interrupt
+	0x0: disabled
+	0x1: enabled
+ -bit 3: Half Transfer Mode Error Interrupt
+	0x0: disabled
+	0x1: enabled
+ -bit 4: Transfer Complete Interrupt
+	0x0: disabled
+	0x1: enabled
+ -bit 9: Peripheral Increment Address
+	0x0: no address increment between transfers
+	0x1: increment address between transfers
+ -bit 10: Memory Increment Address
+	0x0: no address increment between transfers
+	0x1: increment address between transfers
+ -bit 15: Peripheral Increment Offset Size
+	0x0: offset size is linked to the peripheral bus width
+	0x1: offset size is fixed to 4 (32-bit alignment)
+ -bit 16-17: Priority level
+	0x0: low
+	0x1: medium
+	0x2: high
+	0x3: very high
+5. A 32bit mask specifying the DMA FIFO configuration
+ -bit 0-1: Fifo threshold
+	0x0: 1/4 full FIFO
+	0x1: 1/2 full FIFO
+	0x2: 3/4 full FIFO
+	0x3:full FIFO
+ -bit 2: Direct mode
+	0x0: enabled
+	0x1: disabled
+ -bit 7: FIFO Error Interrupt
+	0x0: disabled
+	0x1: enabled
+
+Example:
+
+	usart1: serial@40011000 {
+		compatible = "st,stm32-usart", "st,stm32-uart";
+		reg = <0x40011000 0x400>;
+		interrupts = <37>;
+		clocks = <&clk_pclk2>;
+		dmas = <&dma2 2 4 0x20610 0x3>,
+		       <&dma2 7 5 0x20610 0x3>;
+		dma-names = "rx", "tx";
+	};
-- 
1.9.1
