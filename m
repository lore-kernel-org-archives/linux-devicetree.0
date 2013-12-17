From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 9/9] mtd: nand: davinci: don't request AEMIF address
 range
Date: Tue, 17 Dec 2013 00:42:38 -0800
Message-ID: <20131217084238.GJ12034@norris-Latitude-E6410>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386264358-9738-10-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386264358-9738-10-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 07:25:57PM +0200, Ivan Khoronzhuk wrote:
> The TI AEMIF driver registers are used to setup timings for each chip
> select. The same registers range is used to setup NAND settings.
> The AEMIF and NAND drivers not use the same registers in this range.
> 
> In case with TI AEMIF driver, the memory address range is requested
> already by AEMIF, so we cannot request it twice, just ioremap.
> 
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Taras Kondratiuk <taras-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/mtd/nand/davinci_nand.c |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index f7b21b8..0cd4dbc 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -636,9 +636,11 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
>  
> -	base = devm_ioremap_resource(&pdev->dev, res2);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));

Since it's important that we don't re-introduce the "request resource"
boilerplate later, can you add a comment describing the situation?

> +	if (!base) {
> +		dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
> +		return -EADDRNOTAVAIL;
> +	}
>  
>  	info->dev		= &pdev->dev;
>  	info->base		= base;

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
