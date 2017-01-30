From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: Document the Synopsys DW AXI DMA
 bindings
Date: Mon, 30 Jan 2017 14:08:25 -0600
Message-ID: <20170130200825.buzj7dh2jfyovoyv@rob-hp-laptop>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485358457-22957-2-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 06:34:16PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> DesignWare AXI DMA controller.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
> new file mode 100644
> index 0000000..21318a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
> @@ -0,0 +1,33 @@
> +* Synopsys DesignWare AXI DMA Controller
> +
> +Required properties:
> +- compatible: "snps,axi-dma"

Too generic. This needs an IP version at least.

> +- reg: Address range of the DMAC registers. This should include
> +  all of the per-channel registers.
> +- interrupt: Should contain the DMAC interrupt number.
> +- interrupt-parent: Should be the phandle for the interrupt controller
> +  that services interrupts for this device.
> +- dma-channels: Number of channels supported by hardware.
> +- dma-masters: Number of AXI masters supported by the hardware.
> +- data-width: Maximum AXI data width supported by hardware.
> +  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)

> +- priority: Priority of channel. Array property. Priority value must be
> +  programmed within [0:dma-channels-1] range. (0 - minimum priority)
> +- block-size: Maximum block size supported by the controller channel. Array
> +  property.

Array size equal to the number of dma-channels?

Other than dma-channels, all these either need vendor prefix.

> +
> +Example:
> +
> +dmac: dmac@80000 {

dma-controller@...

> +	compatible = "snps,axi-dma";
> +	reg = <0x80000 0x400>;
> +	clocks = <&core_clk>;
> +	interrupt-parent = <&intc>;
> +	interrupts = <27>;
> +
> +	dma-channels = <4>;
> +	dma-masters = <2>;
> +	data-width = <3>;
> +	block-size = <4096 4096 4096 4096>;
> +	priority = <0 1 2 3>;
> +};
> -- 
> 2.5.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
