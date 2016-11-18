From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] DW DMAC: add multi-block property to device tree
Date: Fri, 18 Nov 2016 21:33:13 +0200
Message-ID: <1479497593.22212.45.camel@linux.intel.com>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479496356-27834-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479496356-27834-3-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-11-18 at 22:12 +0300, Eugeniy Paltsev wrote:
> Several versions of DW DMAC have multi block transfers hardware
> support. Hardware support of multi block transfers is disabled
> by default if we use DT to configure DMAC and software emulation
> of multi block transfers used instead.
> Add multi-block property, so it is possible to enable hardware
> multi block transfers (if present) via DT.
> 
> Switch from per device is_nollp variable to multi_block array
> to be able enable/disable multi block transfers separately per
> channel.
> 

> Update DT documentation.
> 
> Update existing platform data.

Kinda useless for commit message, but might go after --- delimiter.

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/snps-dma.txt | 2 ++
>  drivers/dma/dw/core.c                              | 2 +-
>  drivers/dma/dw/platform.c                          | 5 +++++
>  drivers/tty/serial/8250/8250_lpss.c                | 2 +-
>  include/linux/platform_data/dma-dw.h               | 4 ++--
>  5 files changed, 11 insertions(+), 4 deletions(-)

> --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> @@ -27,6 +27,8 @@ Optional properties:
>    that services interrupts for this device
>  - is_private: The device channels should be marked as private and not
> for by the
>    general purpose DMA channel allocator. False if not passed.
> +- multi-block: Multi block transfers supported by hardware per AHB
> master.
> +  0 (default): not supported, 1: supported.
>  
>  Example:
>  
> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index c2c0a61..f2a3d06 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -1569,7 +1569,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
>  				(dwc_params >> DWC_PARAMS_MBLK_EN &
> 0x1) == 0;
>  		} else {
>  			dwc->block_size = pdata->block_size;
> -			dwc->nollp = pdata->is_nollp;
> +			dwc->nollp = pdata->multi_block[i];

You missed the point. You assign positive value to negative variable.
It's a bug. Have you tested this? How?

In case of positive property you have to update DTS. By the way, I'm
pretty sure that spare13xx boards has auto configuration enabled, though
it has to be checked with vendor (I assume you may have fast response
from them).

>  		}
>  	}
>  

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
