From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/5] dmaengine: vdma: AXI DMA's enhancments
Date: Thu, 12 May 2016 11:59:58 +0530
Message-ID: <20160512062957.GA2274@localhost>
References: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460006985-14805-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2016 at 10:59:40AM +0530, Kedareswara rao Appana wrote:
> This patch series does some enhancments to the VDMA driver
> which includes
> --> Adding support for AXI DMA IP.
> --> Adding support for AXI CDMA IP.

Applied all, thanks

> 
> Kedareswara rao Appana (5):
>   dmaengine: vdma: Rename xilinx_vdma_ prefix to xilinx_dma
>   Documentation: DT: vdma: update binding doc for AXI DMA
>   dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access
>     Engine
>   Documentation: DT: vdma: update binding doc for AXI CDMA
>   dmaengine: vdma: Add Support for Xilinx AXI Central Direct Memory
>     Access Engine
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |   17 +-
>  drivers/dma/xilinx/xilinx_vdma.c                   | 1326 ++++++++++++++------
>  include/linux/dma/xilinx_dma.h                     |   14 +
>  3 files changed, 1003 insertions(+), 354 deletions(-)
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
