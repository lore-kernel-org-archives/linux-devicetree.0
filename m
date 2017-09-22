From: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Subject: [RESEND PATCH v5 1/4] dt-bindings: Document the STM32 DMAMUX bindings
Date: Fri, 22 Sep 2017 09:31:29 +0200
Message-ID: <1506065492-31478-2-git-send-email-pierre-yves.mordret@st.com>
References: <1506065492-31478-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506065492-31478-1-git-send-email-pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the documentation of device tree bindings for the STM32
DMAMUX.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Version history:
    v5:
    v4:
        * Add multi-master ability for STM32 DMAMUX
        * Get rid of st,dmamux properties
    v3:
        * Change compatible to st,stm32h7-dmamux to be mode Soc specific
        * Add verbosity in dma-cells
    v2:
        * Move clock bindings from optional to mandatory one
        * Drop channelID bindings as managed dynamically from now on by
          DMAMUX driver.
---
---
 .../devicetree/bindings/dma/stm32-dmamux.txt       | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt

diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
new file mode 100644
index 0000000..1b893b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
@@ -0,0 +1,84 @@
+STM32 DMA MUX (DMA request router)
+
+Required properties:
+- compatible:	"st,stm32h7-dmamux"
+- reg:		Memory map for accessing module
+- #dma-cells:	Should be set to <3>.
+		First parameter is request line number.
+		Second is DMA channel configuration
+		Third is Fifo threshold
+		For more details about the three cells, please see
+		stm32-dma.txt documentation binding file
+- dma-masters:	Phandle pointing to the DMA controllers.
+		Several controllers are allowed. Only "st,stm32-dma" DMA
+		compatible are supported.
+
+Optional properties:
+- dma-channels : Number of DMA requests supported.
+- dma-requests : Number of DMAMUX requests supported.
+- resets: Reference to a reset controller asserting the DMA controller
+- clocks: Input clock of the DMAMUX instance.
+
+Example:
+
+/* DMA controller 1 */
+dma1: dma-controller@40020000 {
+	compatible = "st,stm32-dma";
+	reg = <0x40020000 0x400>;
+	interrupts = <11>,
+		     <12>,
+		     <13>,
+		     <14>,
+		     <15>,
+		     <16>,
+		     <17>,
+		     <47>;
+	clocks = <&timer_clk>;
+	#dma-cells = <4>;
+	st,mem2mem;
+	resets = <&rcc 150>;
+	dma-channels = <8>;
+	dma-requests = <8>;
+};
+
+/* DMA controller 1 */
+dma2: dma@40020400 {
+	compatible = "st,stm32-dma";
+	reg = <0x40020400 0x400>;
+	interrupts = <56>,
+		     <57>,
+		     <58>,
+		     <59>,
+		     <60>,
+		     <68>,
+		     <69>,
+		     <70>;
+	clocks = <&timer_clk>;
+	#dma-cells = <4>;
+	st,mem2mem;
+	resets = <&rcc 150>;
+	dma-channels = <8>;
+	dma-requests = <8>;
+};
+
+/* DMA mux */
+dmamux1: dma-router@40020800 {
+	compatible = "st,stm32h7-dmamux";
+	reg = <0x40020800 0x3c>;
+	#dma-cells = <3>;
+	dma-requests = <128>;
+	dma-channels = <16>;
+	dma-masters = <&dma1 &dma2>;
+	clocks = <&timer_clk>;
+};
+
+/* DMA client */
+usart1: serial@40011000 {
+	compatible = "st,stm32-usart", "st,stm32-uart";
+	reg = <0x40011000 0x400>;
+	interrupts = <37>;
+	clocks = <&timer_clk>;
+	dmas = <&dmamux1 41 0x414 0>,
+	       <&dmamux1 42 0x414 0>;
+	dma-names = "rx", "tx";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
