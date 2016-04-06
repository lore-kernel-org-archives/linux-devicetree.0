From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v2 3/6] Documentation: DT: vdma: update binding
 doc for AXI DMA
Date: Wed, 6 Apr 2016 08:34:51 -0700
Message-ID: <20160406153428.GA29770@vkoul-mobl.iind.intel.com>
References: <1459919700-6692-1-git-send-email-appanad@xilinx.com>
 <1459919700-6692-4-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459919700-6692-4-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 06, 2016 at 10:44:57AM +0530, Kedareswara rao Appana wrote:
> This patch updates the device-tree binding doc for
> adding support for AXI DMA.
> 
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v2:
> ---> Modified commit message as suggested by Vinod.
> ---> Moved the patch to forward in the series as suggested by vinod.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index a86737c..5841421 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -3,8 +3,13 @@ It can be configured to have one channel or two channels. If configured
>  as two channels, one is to transmit to the video device and another is
>  to receive from the video device.
>  
> +Xilinx AXI DMA engine, it does transfers between memory and AXI4 stream
> +target devices. It can be configured to have one channel or two channels.
> +If configured as two channels, one is to transmit to the device and another
> +is to receive from the device.
> +
>  Required properties:
> -- compatible: Should be "xlnx,axi-vdma-1.00.a"
> +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00.a"
>  - #dma-cells: Should be <1>, see "dmas" property below
>  - reg: Should contain VDMA registers location and length.
>  - xlnx,num-fstores: Should be the number of framebuffers as configured in h/w.
> @@ -59,6 +64,21 @@ axi_vdma_0: axivdma@40030000 {
>  	} ;
>  } ;
>  
> +axi_dma_0: axidma@40400000 {

Why have you ignored Robs comment on this? Ideally you should have posted
these fixed.

> +	compatible = "xlnx,axi-dma-1.00.a";
> +	#dma-cells = <1>;
> +	reg = < 0x40400000 0x10000 >;
> +	dma-channel@40400000 {
> +		compatible = "xlnx,axi-dma-mm2s-channel";
> +		interrupts = < 0 59 4 >;
> +		xlnx,datawidth = <0x40>;
> +	} ;
> +	dma-channel@40400030 {
> +		compatible = "xlnx,axi-dma-s2mm-channel";
> +		interrupts = < 0 58 4 >;
> +		xlnx,datawidth = <0x40>;
> +	} ;
> +} ;
>  
>  * DMA client
>  
> -- 
> 2.1.2
> 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
