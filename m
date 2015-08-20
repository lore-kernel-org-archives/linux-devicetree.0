From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: dt: Add Xilinx zynqmp dma device
 tree binding documentation
Date: Thu, 20 Aug 2015 11:22:55 +0530
Message-ID: <20150820055255.GZ13546@localhost>
References: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438831173-8761-1-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 06, 2015 at 08:49:32AM +0530, Punnaiah Choudary Kalluri wrote:
> Device-tree binding documentation for Xilinx zynqmp dma engine used in
> Zynq UltraScale+ MPSoC.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  |   61 ++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> new file mode 100644
> index 0000000..e4f92b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
> @@ -0,0 +1,61 @@
> +Xilinx ZynqMP DMA engine, it does support memory to memory transfers,
> +memory to device and device to memory transfers. It also has flow
> +control and rate control support for slave/peripheral dma access.
> +
> +Required properties:
> +- compatible: Should be "xlnx,zynqmp-dma-1.0"
> +- #dma-cells: Should be <1>, a single cell holding a line request number
> +- reg: Memory map for module access
> +- interrupt-parent: Interrupt controller the interrupt is routed through
> +- interrupts: Should contain DMA channel interrupt
channel interrupt or interrupts, former says it is plural

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
