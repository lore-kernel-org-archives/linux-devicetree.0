From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] mtd: move code reading DT specified part probes to
 the common place
Date: Fri, 31 Mar 2017 09:42:13 +0200
Message-ID: <20170331094213.055149e1@bbrezillon>
References: <20170330215332.32699-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330215332.32699-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rafal,

On Thu, 30 Mar 2017 23:53:31 +0200
Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Handling (creating) partitions for flash devices requires using a proper
> driver that will read partition table (out of somewhere). We can't
> simply try all existing drivers one by one, so MTD subsystem allows
> drivers to specify a list of applicable part probes.
> 
> So far physmap_of was the only driver with support for linux,part-probe
> DT property. Other ones had list or probes hardcoded which wasn't making
> them really flexible. It prevented using common flash drivers on
> platforms that required some specific partition table access.

I agree that having each flash device driver specify the set of
partition parsers it supports is a bad idea (most of the time,
partition table format are devicetype agnostic). On the other hand, I'm
not a big fan of this property, and I would prefer a solution where all
parsers are tested on each MTD device.
But testing all parsers sequentially is not a perfect solution either
because it increases boot-time and you can't really define the order in
which partition parsers are tested (which means that if you have 2
different partition table in 2 different format, you can't choose the
one that has precedence on the other).

I guess I can live with this "linux,part-probe" property, even if,
as the names implies, it's not really describing hardware, and as
such, does not have its place in DT :-P.

> 
> This commit moves support for mentioned DT property to the common place
> so it can be reused by other drivers.

This property does not seem to be documented. Can you add a patch
documenting it in Documentation/devicetree/bindings/mtd/common.txt and
Cc the DT maintainers. Only then we'll see if this property is
acceptable for them.

> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> This patch is based on top of
> [PATCH] mtd: physmap_of: use OF helpers for reading strings
> ---
>  drivers/mtd/maps/physmap_of.c | 39 ++++++---------------------------------
>  drivers/of/Kconfig            |  6 ++++++
>  drivers/of/Makefile           |  1 +
>  drivers/of/of_mtd.c           | 30 ++++++++++++++++++++++++++++++
>  include/linux/of_mtd.h        | 25 +++++++++++++++++++++++++

No please, don't add these files back. If you need specific OF helpers
for the MTD subsystem, put them in drivers/mtd/mtdcore.c or
drivers/mtd/of.c if you think it really deserves a dedicated file (but
given the number of lines you add, I'm not sure it's the case).

>  5 files changed, 68 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/of/of_mtd.c
>  create mode 100644 include/linux/of_mtd.h
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 62fa6836f218..fa54c07eb118 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -22,6 +22,7 @@
>  #include <linux/mtd/concat.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_mtd.h>
>  #include <linux/of_platform.h>
>  #include <linux/slab.h>
>  #include "physmap_of_gemini.h"
> @@ -114,33 +115,6 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
>  static const char * const part_probe_types_def[] = {
>  	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
>  
> -static const char * const *of_get_probes(struct device_node *dp)
> -{
> -	const char **res;
> -	int count;
> -
> -	count = of_property_count_strings(dp, "linux,part-probe");
> -	if (count < 0)
> -		return part_probe_types_def;
> -
> -	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
> -	if (!res)
> -		return NULL;
> -
> -	count = of_property_read_string_array(dp, "linux,part-probe", res,
> -					      count);
> -	if (count < 0)
> -		return NULL;
> -
> -	return res;
> -}
> -
> -static void of_free_probes(const char * const *probes)
> -{
> -	if (probes != part_probe_types_def)
> -		kfree(probes);
> -}
> -
>  static const struct of_device_id of_flash_match[];
>  static int of_flash_probe(struct platform_device *dev)
>  {
> @@ -310,14 +284,13 @@ static int of_flash_probe(struct platform_device *dev)
>  
>  	info->cmtd->dev.parent = &dev->dev;
>  	mtd_set_of_node(info->cmtd, dp);
> -	part_probe_types = of_get_probes(dp);
> -	if (!part_probe_types) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> +	part_probe_types = of_mtd_get_probes(dp);
> +	if (!part_probe_types)
> +		part_probe_types = part_probe_types_def;

Let's automate that a bit. The OF node is attached to the MTD device
when you call mtd_set_of_node(), so you have everything you need to
extract the partition parser list in mtd_device_parse_register().
If you do that, all MTD drivers would gain "linux,part-probe" support
for free.

>  	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
>  			NULL, 0);
> -	of_free_probes(part_probe_types);
> +	if (part_probe_types != part_probe_types_def)
> +		of_mtd_free_probes(part_probe_types);
>  
>  	kfree(mtd_list);
>  
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index ba7b034b2b91..18ac835a1ce4 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -78,6 +78,12 @@ config OF_MDIO
>  	help
>  	  OpenFirmware MDIO bus (Ethernet PHY) accessors
>  
> +config OF_MTD
> +	def_tristate MTD
> +	depends on MTD
> +	help
> +	  OpenFirmware MTD accessors
> +
>  config OF_PCI
>  	def_tristate PCI
>  	depends on PCI
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index d7efd9d458aa..965c2a691337 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_NET)	+= of_net.o
>  obj-$(CONFIG_OF_UNITTEST) += unittest.o
>  obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
> +obj-$(CONFIG_OF_MTD)	+= of_mtd.o
>  obj-$(CONFIG_OF_PCI)	+= of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
>  obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> new file mode 100644
> index 000000000000..ff851d7742d5
> --- /dev/null
> +++ b/drivers/of/of_mtd.c
> @@ -0,0 +1,30 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_mtd.h>
> +
> +const char * const *of_mtd_get_probes(struct device_node *np)
> +{
> +	const char **res;
> +	int count;
> +
> +	count = of_property_count_strings(np, "linux,part-probe");
> +	if (count < 0)
> +		return NULL;
> +
> +	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		return NULL;
> +
> +	count = of_property_read_string_array(np, "linux,part-probe", res,
> +					      count);
> +	if (count < 0)
> +		return NULL;
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(of_mtd_get_probes);
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> new file mode 100644
> index 000000000000..d55f4aa684c5
> --- /dev/null
> +++ b/include/linux/of_mtd.h
> @@ -0,0 +1,25 @@
> +#ifndef __OF_MTD_H
> +#define __OF_MTD_H
> +
> +#include <linux/slab.h>
> +
> +struct device_node;
> +
> +#ifdef CONFIG_OF_MTD
> +const char * const *of_mtd_get_probes(struct device_node *np);
> +static inline void of_mtd_free_probes(const char * const *probes)
> +{
> +	kfree(probes);
> +}
> +#else
> +const char * const *of_mtd_get_probes(struct device_node *np)
> +{
> +	return NULL;
> +}
> +
> +static inline void of_mtd_free_probes(const char * const *probes)
> +{
> +}
> +#endif
> +
> +#endif

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
