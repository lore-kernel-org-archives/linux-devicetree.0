From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] dmaengine: usb-dmac: Add Renesas USB DMA
 Controller
Date: Thu, 2 Apr 2015 12:58:21 +0530
Message-ID: <20150402072821.GW7192@intel.com>
References: <1427869365-2068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427869365-2068-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 01, 2015 at 03:22:43PM +0900, Yoshihiro Shimoda wrote:
> This patch set is based on slave-dma.git / next branch.
> (commit id = 739e9c81155e74ca7acfa152eea4e8c055fe35b8)
Applied, thanks

-- 
~Vinod
> 
> Changes from v3:
>  - Call devm_free_irq() in usb_dmac_chan_remove() to prevent the isr gets
>    triggered after this driver have freed up stuff.
> 
> Changes from v2:
>  - Change descriptor management to store the residue in descriptor instead
>    of the channel.
>  - Change acceptable any sg_len.
>  - Modify usb_dmac_tx_status() to calculate the residue for flight
>    descriptors.
>  - Remove a local tasklet.
>  - Remove #ifdef CONFIG_PM.
>  Remarks: No change in patch [1/2].
> 
> Changes from v1:
>  - Use virt-dma infrastructure instead of local descriptor management.
>  - Change acceptable sg_len to 1.
>    (because a client driver will use dmaengine_prep_slave_single().)
>  - Remove usb_dmac_sleep_{suspend,resume} functions.
>  - Add usb_dmac_chan_halt() in usb_dmac_runtime_suspend().
>  - Use a tasklet instead of a kernel thread.
>  - Add tasklet_kill() in usb_dmac_remove().
>  - Fix MODULE_AUTHOR string.
>  Remarks: No change in patch [1/2].
> 
> Yoshihiro Shimoda (2):
>   dmaengine: renesas,usb-dmac: Add device tree bindings documentation
>   dmaengine: usb-dmac: Add Renesas USB DMA Controller (USB-DMAC) driver
> 
>  .../devicetree/bindings/dma/renesas,usb-dmac.txt   |  37 +
>  drivers/dma/sh/Kconfig                             |   9 +
>  drivers/dma/sh/Makefile                            |   1 +
>  drivers/dma/sh/usb-dmac.c                          | 910 +++++++++++++++++++++
>  4 files changed, 957 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
>  create mode 100644 drivers/dma/sh/usb-dmac.c
> 
> -- 
> 1.9.1
> 

-- 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
