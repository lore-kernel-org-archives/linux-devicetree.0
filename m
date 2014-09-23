From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/9] rtc: at91sam9: replace devm_ioremap by devm_ioremap_resource
Date: Tue, 23 Sep 2014 10:15:38 +0200
Message-ID: <54212C2A.8000109@atmel.com>
References: <1411400563-570-1-git-send-email-boris.brezillon@free-electrons.com> <1411400563-570-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411400563-570-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/09/2014 17:42, Boris BREZILLON :
> Replace devm_ioremap calls by devm_ioremap_resource which already check
> resource consistency (resource != NULL) and print an error in case of
> failure.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/rtc/rtc-at91sam9.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 74a9ca0..38a2693 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -306,18 +306,11 @@ static const struct rtc_class_ops at91_rtc_ops = {
>   */
>  static int at91_rtc_probe(struct platform_device *pdev)
>  {
> -	struct resource	*r, *r_gpbr;
> +	struct resource	*r;
>  	struct sam9_rtc	*rtc;
>  	int		ret, irq;
>  	u32		mr;
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	r_gpbr = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!r || !r_gpbr) {
> -		dev_err(&pdev->dev, "need 2 ressources\n");
> -		return -ENODEV;
> -	}
> -
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		dev_err(&pdev->dev, "failed to get interrupt resource\n");
> @@ -335,18 +328,16 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  		device_init_wakeup(&pdev->dev, 1);
>  
>  	platform_set_drvdata(pdev, rtc);
> -	rtc->rtt = devm_ioremap(&pdev->dev, r->start, resource_size(r));
> -	if (!rtc->rtt) {
> -		dev_err(&pdev->dev, "failed to map registers, aborting.\n");
> -		return -ENOMEM;
> -	}
>  
> -	rtc->gpbr = devm_ioremap(&pdev->dev, r_gpbr->start,
> -				resource_size(r_gpbr));
> -	if (!rtc->gpbr) {
> -		dev_err(&pdev->dev, "failed to map gpbr registers, aborting.\n");
> -		return -ENOMEM;
> -	}
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rtc->rtt = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(rtc->rtt))
> +		return PTR_ERR(rtc->rtt);
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	rtc->gpbr = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(rtc->gpbr))
> +		return PTR_ERR(rtc->rtt);
>  
>  	mr = rtt_readl(rtc, MR);
>  
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
