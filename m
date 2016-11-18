From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] DW DMAC: enable memory-to-memory transfers
 support
Date: Fri, 18 Nov 2016 21:27:04 +0200
Message-ID: <1479497224.22212.42.camel@linux.intel.com>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479496356-27834-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479496356-27834-2-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-11-18 at 22:12 +0300, Eugeniy Paltsev wrote:
> All known devices, which use DT for configuration, support
> memory-to-memory transfers. So enable it by default, if we read
> configuration from DT.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

You missed the given tag(s).

> ---
>  drivers/dma/dw/platform.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 5bda0eb..aa7a5c1 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  	if (of_property_read_bool(np, "is_private"))
>  		pdata->is_private = true;
>  
> +	/*
> +	 * All known devices, which use DT for configuration, support
> +	 * memory-to-memory transfers. So enable it by default.
> +	 */
> +	pdata->is_memcpy = true;
> +
>  	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
>  		pdata->chan_allocation_order = (unsigned char)tmp;
>  

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
