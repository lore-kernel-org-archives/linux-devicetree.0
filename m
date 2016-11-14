From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: dwc2: fixes host_dma logic
Date: Mon, 14 Nov 2016 14:53:18 -0800
Message-ID: <da778f8f-4038-17b5-6c9c-0585202aecff@synopsys.com>
References: <b1ec4a4425388cdee36be081971484db2a7d048a.1478897792.git.chunkeey@gmail.com>
 <4043f817106c8dffdc9a3f411d965465168b263d.1478897792.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4043f817106c8dffdc9a3f411d965465168b263d.1478897792.git.chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/11/2016 12:59 PM, Christian Lamparter wrote:
> This patch moves the the host_dma initialization
> before dwc2_set_param_dma_desc_enable and
> dwc2_set_param_dma_desc_fs_enable. The reason being
> that both function need it.
> 
> Fixes: 1205489cee75bf39 ("usb: dwc2: Get host DMA device properties")

This should probably be omitted since it's only in Felipe's
testing/next.

Otherwise looks good.

Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Regards,
John


> 
> Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Signed-off-by: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/dwc2/params.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 5d822c5..222a83c 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -1157,9 +1157,6 @@ static void dwc2_set_parameters(struct dwc2_hsotg *hsotg,
>  	bool dma_capable = !(hw->arch == GHWCFG2_SLAVE_ONLY_ARCH);
>  
>  	dwc2_set_param_otg_cap(hsotg, params->otg_cap);
> -	dwc2_set_param_dma_desc_enable(hsotg, params->dma_desc_enable);
> -	dwc2_set_param_dma_desc_fs_enable(hsotg, params->dma_desc_fs_enable);
> -
>  	if ((hsotg->dr_mode == USB_DR_MODE_HOST) ||
>  	    (hsotg->dr_mode == USB_DR_MODE_OTG)) {
>  		bool disable;
> @@ -1174,6 +1171,8 @@ static void dwc2_set_parameters(struct dwc2_hsotg *hsotg,
>  				    !disable, false,
>  				    dma_capable);
>  	}
> +	dwc2_set_param_dma_desc_enable(hsotg, params->dma_desc_enable);
> +	dwc2_set_param_dma_desc_fs_enable(hsotg, params->dma_desc_fs_enable);
>  
>  	dwc2_set_param_host_support_fs_ls_low_power(hsotg,
>  			params->host_support_fs_ls_low_power);
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
