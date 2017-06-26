From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: Document the STM32 DMAMUX bindings
Date: Mon, 26 Jun 2017 14:28:49 -0500
Message-ID: <20170626192849.zd5e53cidgen3ypq@rob-hp-laptop>
References: <1498222853-11110-1-git-send-email-pierre-yves.mordret@st.com>
 <1498222853-11110-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498222853-11110-2-git-send-email-pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 23, 2017 at 03:00:49PM +0200, Pierre-Yves MORDRET wrote:
> This patch adds the documentation of device tree bindings for the STM32
> DMAMUX.
> 
> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
> ---
>  Version history:
>     v2:
>         * Move clock bindings from optional to mandatory one
>         * Drop channelID bindings as managed dynamically from now on by
>           DMAMUX driver.
> ---
> ---
>  .../devicetree/bindings/dma/stm32-dmamux.txt       | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> new file mode 100644
> index 0000000..1d413c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> @@ -0,0 +1,57 @@
> +STM32 DMA MUX (DMA request router)
> +
> +Required properties:
> +- compatible:	"st,stm32-dmamux"

This should be SoC specific (or at least have f4, h7, etc.).

> +- reg:		Memory map for accessing module
> +- #dma-cells:	Should be set to <3>.
> +		For more details about the three cells, please see
> +		stm32-dma.txt documentation binding file

The example below has 4 cells for the dma ctrlr?

> +- dma-masters:	Phandle pointing to the DMA controller
> +
> +Optional properties:
> +- dma-channels : Number of DMA channels supported.
> +- dma-requests : Number of DMA requests supported.
> +- resets: Reference to a reset controller asserting the DMA controller
> +- clocks: Input clock of the DMAMUX instance.
> +
> +Example:
> +
> +/* DMA controller */
> +dma2: dma-controller@40026400 {
> +	compatible = "st,stm32-dma";
> +	reg = <0x40026400 0x400>;
> +	interrupts = <56>,
> +		     <57>,
> +		     <58>,
> +		     <59>,
> +		     <60>,
> +		     <68>,
> +		     <69>,
> +		     <70>;
> +	clocks = <&clk_hclk>;
> +	#dma-cells = <4>;
> +	st,mem2mem;
> +	resets = <&rcc 150>;
> +	st,dmamux;
> +	dma-channels = <8>;
> +};
> +
> +/* DMA mux */
> +dmamux2: dma-router@40020820 {
> +	compatible = "st,stm32-dmamux";
> +	reg = <0x40020800 0x1c>;
> +	#dma-cells = <3>;
> +	dma-requests = <128>;
> +	dma-masters = <&dma2>;
> +};
> +
> +/* DMA client */
> +usart1: serial@40011000 {
> +	compatible = "st,stm32-usart", "st,stm32-uart";
> +	reg = <0x40011000 0x400>;
> +	interrupts = <37>;
> +	clocks = <&clk_pclk2>;
> +	dmas = <&dmamux2 41 0x414 0>,
> +	       <&dmamux2 42 0x414 0>;
> +	dma-names = "rx", "tx";
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
