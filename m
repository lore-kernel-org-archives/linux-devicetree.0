From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] mtd: m25p80: remove 'disabled' device check
Date: Fri, 25 Oct 2013 01:15:09 +0100
Message-ID: <20131025001509.1924FC403B6@trevor.secretlab.ca>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com> <1382583503-13748-5-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382583503-13748-5-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sourav.poddar-l0cyMroinI0@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 23 Oct 2013 19:58:23 -0700, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> It seems like the following commit was never necessary
> 
>     commit 5f949137952020214cd167093dd7be448f21c079
>     Author: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>     Date:   Fri Oct 14 15:49:00 2011 +0800
> 
>         mtd: m25p80: don't probe device which has status of 'disabled'
> 
> because it duplicates the code in of_platform_device_create_pdata()
> which ensures that 'disabled' nodes are never instantiated.
> 
> Also, drop the __maybe_unused.

Looks reasonable.

Reviewed-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> ---
>  drivers/mtd/devices/m25p80.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d6c5c57..a1dc49a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -935,12 +935,7 @@ static int m25p_probe(struct spi_device *spi)
>  	struct flash_info		*info;
>  	unsigned			i;
>  	struct mtd_part_parser_data	ppdata;
> -	struct device_node __maybe_unused *np = spi->dev.of_node;
> -
> -#ifdef CONFIG_MTD_OF_PARTS
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> -#endif
> +	struct device_node *np = spi->dev.of_node;
>  
>  	/* Platform data helps sort out which chip type we have, as
>  	 * well as how this board partitions it.  If we don't have
> -- 
> 1.8.4
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
