From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/3] new Atmel DMA controller
Date: Wed, 5 Nov 2014 12:10:55 +0100
Message-ID: <20141105111054.GX20550@ldesroches-Latitude-E6320>
References: <1413991340-11617-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413991340-11617-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

Does this new version meet your expectations? I would not like to delay
xdma inclusion to 3.20 because we still have no DMA on sama5d4, that is
not very convenient.

Regards

Ludovic

On Wed, Oct 22, 2014 at 05:22:17PM +0200, Ludovic Desroches wrote:
> Hi,
> 
> This set of patches introduces support for the new Atmel DMA controller know as
> XDMAC and available on SAMA5D4.
> 
> Changes from:
> - v6
>   - change binding: merge the two dma-cells
>   - no more use direction in slave config
>   - remove cookie init
>   - return an error on a bad maxburst value
> - v5
>   - fix a bug when doing memcpy, condition to set the NDE was inverted
>   - replace irqsave locks by bh variant
>   - unmask channel errors
> - v4
>   - compile the driver if COMPILE_TEST is selected
>   - merge header file into at_xdmac.c
>   - use write memory barriers before starting the channel
>   - init active_xfer to false when taking a descriptor from the free
>   descriptors list
>   - remove dma capabilities mask
>   - use CONFIG_PM instead of CONFIG_PM_SLEEP for prepare function
>   - style fixes
>   - update documentation to add the <chip> compatible description
> - v3
>   - use dma_get_any_slave_channel instead of dma_request_channel
>   - fix tx_status behavior for non active transfers
>   - rename at_xdmac_terminate_xfer
>   - replace suspend/resume no irq variants by late/early variants
>   - no more use dev res to request the irq, use the legacy way
>   - add slave capabilities
> - v2
>   - documentation updated
>   - fix locking issues
> - v1
>   - add power management stuff
>   - check maxburst value
>   - revert subsys_initcall remove, EPROBE_DEFER not yet available on the kernel
>   version I use to do the tests, moreover other devices are not ready to use it
> - RFC:
>   - DMA_SUCCESS replaced by DMA_COMPLETE
>   - fix memcpy issue caused by a mistake in interfaces used
>   - add filter function
>   - remove some parameters from device tree since we can get them through the
>   dma slave configuration
>   - use readl/writel relaxed
>   - remove subsys_initcall
>   - synchronize irq before killing tasklets
>   - use BIT macro
>   - misc cleanup
> 
> 
> Ludovic Desroches (3):
>   dma: at_xdmac: creation of the atmel eXtended DMA Controller driver
>   ARM: dts: at_xdmac: add bindings documentation
>   MAINTAINERS: add entry for Atmel XDMA driver
> 
>  .../devicetree/bindings/dma/atmel-xdma.txt         |   54 +
>  MAINTAINERS                                        |    7 +
>  drivers/dma/Kconfig                                |    7 +
>  drivers/dma/Makefile                               |    1 +
>  drivers/dma/at_xdmac.c                             | 1510 ++++++++++++++++++++
>  include/dt-bindings/dma/at91.h                     |   25 +
>  6 files changed, 1604 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/atmel-xdma.txt
>  create mode 100644 drivers/dma/at_xdmac.c
> 
> -- 
> 2.0.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
