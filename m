From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Thu, 14 Apr 2016 10:04:13 -0500
Message-ID: <20160414150413.GA24644@rob-hp-laptop>
References: <1460524609-8722-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460524609-8722-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 10:46:48AM +0530, Kedareswara rao Appana wrote:
> Device-tree binding documentation for Xilinx zynqmp dma engine used in
> Zynq UltraScale+ MPSoC.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - Use dma-coherent flag for coherent transfers as suggested by rob.
> - Removed unnecessary properties from binding doc as suggested by Rob.
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - None.
> 
>  .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> new file mode 100644
> index 0000000..4ad0aea40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> @@ -0,0 +1,50 @@
> +Xilinx ZynqMP DMA engine, it does support memory to memory transfers,
> +memory to device and device to memory transfers. It also has flow
> +control and rate control support for slave/peripheral dma access.
> +
> +Required properties:
> +- compatible		: Should be "xlnx,zynqmp-dma-1.0"
> +- reg			: Memory map for gdma/adma module access.
> +- interrupt-parent	: Interrupt controller the interrupt is routed through
> +- interrupts		: Should contain DMA channel interrupt.
> +- xlnx,bus-width	: Axi buswidth in bits. Should contain 128 or 64
> +- clock-names		: List of input clocks "clk_main", "clk_apb"
> +			  (see clock bindings for details)
> +
> +Optional properties:
> +- xlnx,include-sg	: Indicates the controller to operate in simple or
> +			  scatter gather dma mode
> +- xlnx,ratectrl		: Scheduling interval in terms of clock cycles for
> +			  source AXI transaction
> +- xlnx,overfetch	: Tells whether the channel is allowed to over
> +			  fetch the data
> +- xlnx,src-issue	: Number of AXI outstanding transactions on source side
> +- xlnx,desc-axi-cache	: AXI cache bits to be used for descriptor fetch
> +- xlnx,src-axi-cache	: AXI cache bits to be used for data read
> +- xlnx,dst-axi-cache	: AXI cache bits to be used for data write

Shouldn't you be able to derive these values from whether dma-coherent 
is set. To put it another way, allowing setting both allows for lots of 
broken combinations.

> +- xlnx,src-burst-len	: AXI length for data read. Support only power of
> +			  2 values.
> +- xlnx,dst-burst-len	: AXI length for data write. Support only power of
> +			  2 values.

What unit? Seems to be beats from the example. I would suggest bytes 
instead.

> +- dma-coherent		: Present if dma operations are coherent.
> +
> +Example:
> +++++++++
> +fpd_dma_chan1: dma@FD500000 {

lowercase address.

> +	compatible = "xlnx,zynqmp-dma-1.0";
> +	reg = <0x0 0xFD500000 0x1000>;
> +	interrupt-parent = <&gic>;
> +	interrupts = <0 117 4>;
> +	clock-names = "clk_main", "clk_apb";
> +	xlnx,bus-width = <128>;
> +	xlnx,include-sg;
> +	xlnx,overfetch;
> +	dma-coherent;
> +	xlnx,ratectrl = <0>;
> +	xlnx,src-issue = <16>;
> +	xlnx,desc-axi-cache = <0xFF>;
> +	xlnx,src-axi-cache = <0xFF>;
> +	xlnx,dst-axi-cache = <0xFF>;

Last I checked, AXI only has 4 cache bits.

> +	xlnx,src-burst-len = <4>;
> +	xlnx,dst-burst-len = <4>;
> +};
> -- 
> 2.1.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
