From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Date: Tue, 24 Jan 2017 15:13:53 +0100
Message-ID: <20170124151353.5bbffae0@bbrezillon>
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

Hi Cédric,

On Mon, 16 Jan 2017 14:27:03 +0100
Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
> 
> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
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

I realize this kind of thing would be better placed in mtd_set_of_node()
(see the patch below). Modifying the mtd->name pointer in the back of
MTD drivers is not such a good idea (suppose the driver allocated the
memory with a regular kmalloc() and tries to free mtd->name in the remove
path).

If we move that to mtd_set_of_node(), drivers that wants to support this
label property just have to check if mtd->name is NULL (after calling
mtd_set_of_node() or nand_set_flash_node()) before assigning a default
name.
For unmodified drivers we keep the existing behavior: they'll just
unconditionally override mtd->name with their own value (which might or
might not be dynamically allocated).

>  	if (mtd->dev.parent) {
>  		if (!mtd->owner && mtd->dev.parent->driver)
>  			mtd->owner = mtd->dev.parent->driver->owner;

--->8---
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..a12b68f941e3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -385,6 +385,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
                                   struct device_node *np)
 {
        mtd->dev.of_node = np;
+
+       of_property_read_string(np, "label", mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
