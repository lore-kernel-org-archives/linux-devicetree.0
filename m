From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v2 1/5] dt-bindings: Document the STM32 DMAMUX bindings
Date: Fri, 23 Jun 2017 15:00:49 +0200
Message-ID: <1498222853-11110-2-git-send-email-pierre-yves.mordret@st.com>
References: <1498222853-11110-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1498222853-11110-1-git-send-email-pierre-yves.mordret@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba
 Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the documentation of device tree bindings for the STM32
DMAMUX.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
 Version history:
    v2:
        * Move clock bindings from optional to mandatory one
        * Drop channelID bindings as managed dynamically from now on by
          DMAMUX driver.
---
---
 .../devicetree/bindings/dma/stm32-dmamux.txt       | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt

diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
new file mode 100644
index 0000000..1d413c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
@@ -0,0 +1,57 @@
+STM32 DMA MUX (DMA request router)
+
+Required properties:
+- compatible:	"st,stm32-dmamux"
+- reg:		Memory map for accessing module
+- #dma-cells:	Should be set to <3>.
+		For more details about the three cells, please see
+		stm32-dma.txt documentation binding file
+- dma-masters:	Phandle pointing to the DMA controller
+
+Optional properties:
+- dma-channels : Number of DMA channels supported.
+- dma-requests : Number of DMA requests supported.
+- resets: Reference to a reset controller asserting the DMA controller
+- clocks: Input clock of the DMAMUX instance.
+
+Example:
+
+/* DMA controller */
+dma2: dma-controller@40026400 {
+	compatible = "st,stm32-dma";
+	reg = <0x40026400 0x400>;
+	interrupts = <56>,
+		     <57>,
+		     <58>,
+		     <59>,
+		     <60>,
+		     <68>,
+		     <69>,
+		     <70>;
+	clocks = <&clk_hclk>;
+	#dma-cells = <4>;
+	st,mem2mem;
+	resets = <&rcc 150>;
+	st,dmamux;
+	dma-channels = <8>;
+};
+
+/* DMA mux */
+dmamux2: dma-router@40020820 {
+	compatible = "st,stm32-dmamux";
+	reg = <0x40020800 0x1c>;
+	#dma-cells = <3>;
+	dma-requests = <128>;
+	dma-masters = <&dma2>;
+};
+
+/* DMA client */
+usart1: serial@40011000 {
+	compatible = "st,stm32-usart", "st,stm32-uart";
+	reg = <0x40011000 0x400>;
+	interrupts = <37>;
+	clocks = <&clk_pclk2>;
+	dmas = <&dmamux2 41 0x414 0>,
+	       <&dmamux2 42 0x414 0>;
+	dma-names = "rx", "tx";
+};
-- 
1.9.1
