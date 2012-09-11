From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] usb: gadget: at91_udc: dt: fix platform_data check
Date: Tue, 11 Sep 2012 14:20:19 +0200
Message-ID: <504F2C83.7080706@atmel.com>
References: <1347365267-7507-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347365267-7507-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/11/2012 02:07 PM, Fabio Porcedda :
> Don't fail the initialization check for the platform_data
> if there is avaiable an associated device tree node.
> 
> This patch fix the dt support introduced in 3.4-rc1 by commit
> ("d1494a3 USB: at91: Device udc add dt support").
> 
> Tested on a at91sam9260 based board (PRO3-EVK).
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> [v3.4+]
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Felipe, Greg, can we queue this one for 3.6-final ?

Best regards,

> ---
> v2:
>   - better description
>   - add stable tag
> 
>  drivers/usb/gadget/at91_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/at91_udc.c b/drivers/usb/gadget/at91_udc.c
> index 1e35963..660fd53 100644
> --- a/drivers/usb/gadget/at91_udc.c
> +++ b/drivers/usb/gadget/at91_udc.c
> @@ -1699,7 +1699,7 @@ static int __devinit at91udc_probe(struct platform_device *pdev)
>  	int		retval;
>  	struct resource	*res;
>  
> -	if (!dev->platform_data) {
> +	if (!dev->platform_data && !pdev->dev.of_node) {
>  		/* small (so we copy it) but critical! */
>  		DBG("missing platform_data\n");
>  		return -ENODEV;
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
