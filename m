From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Date: Mon, 16 Jan 2017 14:32:30 +0100
Message-ID: <20170116143230.09b000ce@bbrezillon>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
        <1484573225-19095-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484573225-19095-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Jan 2017 14:27:03 +0100
Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
> 
> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  drivers/mtd/mtdcore.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 052772f7caef..bf61557b599d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>   */
>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  {
> +	/*
> +	 * If DT support is enabled and we have a valid of_node pointer, try to
> +	 * extract the MTD name from the label property.
> +	 */
> +	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
> +		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
> +
>  	if (mtd->dev.parent) {
>  		if (!mtd->owner && mtd->dev.parent->driver)
>  			mtd->owner = mtd->dev.parent->driver->owner;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
