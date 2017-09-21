From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Date: Thu, 21 Sep 2017 09:59:30 +0200
Message-ID: <20170921095930.4b473f91@bbrezillon>
References: <20170905202339.20732-1-wak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905202339.20732-1-wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "William A. Kennington III" <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+the DT maintainers

On Tue,  5 Sep 2017 13:23:39 -0700
"William A. Kennington III" <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:

> As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support

I didn't find this commit in mainline.

> adding a device tree entry which marks a flash device as not needing
> erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
> devices which have the property no-erase.
> 
> Signed-off-by: William A. Kennington III <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mtd/devices/powernv_flash.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index f5396f26ddb4..fab9f9121b4c 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct device *dev,
>  	mtd->name = of_get_property(dev->of_node, "name", NULL);
>  	mtd->type = MTD_NORFLASH;
>  	mtd->flags = MTD_WRITEABLE;
> +	if (of_property_read_bool(dev->of_node, "no-erase"))
> +		mtd->flags |= MTD_NO_ERASE;

I don't see this property document in a DT binding doc, which is
mandatory. Actually, there's no DT bindings doc at all for the
'ibm,opal-flash' device in mainline, is this normal?

>  	mtd->size = size;
>  	mtd->erasesize = erase_size;
>  	mtd->writebufsize = mtd->writesize = 1;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
