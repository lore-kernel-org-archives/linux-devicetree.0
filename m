From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM/USB: at91/ohci-at91: remove the use of irq_to_gpio
Date: Fri, 17 Feb 2012 10:41:32 +0100
Message-ID: <4F3E20CC.5090205@atmel.com>
References: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com> <fab15f7eaf6622e68e62bc3afa533b12f48ca27e.1329139662.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fab15f7eaf6622e68e62bc3afa533b12f48ca27e.1329139662.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, avictor.za-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/13/2012 03:43 PM, Nicolas Ferre :
> irq_to_gpio() macro will be removed from AT91 GPIO interrupt
> controller. So we replace it with the use of gpio_to_irq()
> and a reworked test.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Greg,

I would like to queue this patch through arm-soc git tree (with all AT91
material of this patch series).

So, can I have your "Acked-by" on this one?

> ---
>  drivers/usb/host/ohci-at91.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
> index 77afabc..8e855eb 100644
> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -448,10 +448,11 @@ static irqreturn_t ohci_hcd_at91_overcurrent_irq(int irq, void *data)
>  
>  	/* From the GPIO notifying the over-current situation, find
>  	 * out the corresponding port */
> -	gpio = irq_to_gpio(irq);
>  	for (port = 0; port < ARRAY_SIZE(pdata->overcurrent_pin); port++) {
> -		if (pdata->overcurrent_pin[port] == gpio)
> +		if (gpio_to_irq(pdata->overcurrent_pin[port]) == irq) {
> +			gpio = pdata->overcurrent_pin[port];
>  			break;
> +		}
>  	}
>  
>  	if (port == ARRAY_SIZE(pdata->overcurrent_pin)) {

Thanks, best regards,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
