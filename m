From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 11:23:16 +0000
Message-ID: <b2df74bb-dd86-bac1-ab8b-cbff6ca29b6f@linaro.org>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488484223-844-3-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org



On 02/03/17 19:50, Alban wrote:
> Allow drivers that use the nvmem API to read data stored on MTD devices.
> This add a simple mtd user that register itself as a read-only nvmem
> device.
>
Good stuff!! and useful for MAC addresses.

Am not going to repeat the same comments as Boris, but I totally agree 
with his comments.

> Signed-off-by: Alban <albeu@free.fr>
> ---
>  drivers/mtd/Kconfig    |   9 ++++
>  drivers/mtd/Makefile   |   1 +
>  drivers/mtd/mtdnvmem.c | 121 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 drivers/mtd/mtdnvmem.c

May be we should move this driver to drivers/nvmem/
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index e83a279..9cad86c 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -322,6 +322,15 @@ config MTD_PARTITIONED_MASTER
>  	  the parent of the partition device be the master device, rather than
>  	  what lies behind the master.
>
> +config MTD_NVMEM
> +	tristate "Read config data from MTD devices"

May be..

"Read config data from MTD devices via NVMEM API".

Or

"MTD NVMEM Provider"

> +	default y

Do you really want it be ON by default?
> +	depends on NVMEM

Adding COMPILE_TEST would give us good test coverage.

> +	help
> +	  Provides support for reading config data from MTD devices. This can
> +	  be used by drivers to read device specific data such as MAC addresses
> +	  or calibration results.
> +
>  source "drivers/mtd/chips/Kconfig"
>
>  source "drivers/mtd/maps/Kconfig"
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 99bb9a1..f62f50b 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_SSFDC)		+= ssfdc.o
>  obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
>  obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
>  obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
> +obj-$(CONFIG_MTD_NVMEM)		+= mtdnvmem.o
>
>  nftl-objs		:= nftlcore.o nftlmount.o
>  inftl-objs		:= inftlcore.o inftlmount.o
> diff --git a/drivers/mtd/mtdnvmem.c b/drivers/mtd/mtdnvmem.c
> new file mode 100644
> index 0000000..6eb4216
> --- /dev/null
> +++ b/drivers/mtd/mtdnvmem.c
> @@ -0,0 +1,121 @@
> +/*
> + * Copyright (C) 2017 Alban Bedel <albeu@free.fr>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/nvmem-consumer.h>
??

> +#include <linux/slab.h>
> +#include <linux/of.h>
> +
> +struct mtd_nvmem {
> +	struct list_head list;
> +	struct mtd_info *mtd;
> +	struct nvmem_device *nvmem;
> +};
> +
> +static DEFINE_MUTEX(mtd_nvmem_list_lock);
> +static LIST_HEAD(mtd_nvmem_list);
> +
> +static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
> +			      void *val, size_t bytes)
> +{
> +	struct mtd_info *mtd = priv;
> +	size_t retlen;
> +	int err;
> +
> +	err = mtd_read(mtd, offset, bytes, &retlen, val);
> +	if (err && err != -EUCLEAN)
> +		return err;
> +
> +	return retlen == bytes ? 0 : -EIO;
> +}
> +
> +static void mtd_nvmem_add(struct mtd_info *mtd)
> +{
> +	struct device *dev = &mtd->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct nvmem_config config = {};
> +	struct mtd_nvmem *mtd_nvmem;
> +
> +	/* OF devices have to provide the nvmem node */
> +	if (np && !of_property_read_bool(np, "nvmem-provider"))
> +		return;

we should prefix the property with mtd to make to more explicit that 
this is very much specific to MTD.


> +
> +	config.dev = dev;
> +	config.owner = THIS_MODULE;
> +	config.reg_read = mtd_nvmem_reg_read;
> +	config.size = mtd->size;
> +	config.word_size = 1;
> +	config.stride = 1;
> +	config.read_only = true;
> +	config.priv = mtd;
> +
> +	/* Alloc our struct to keep track of the MTD NVMEM devices */
> +	mtd_nvmem = kzalloc(sizeof(*mtd_nvmem), GFP_KERNEL);
> +	if (!mtd_nvmem)
> +		return;
> +
> +	mtd_nvmem->mtd = mtd;
> +	mtd_nvmem->nvmem = nvmem_register(&config);
> +	if (IS_ERR(mtd_nvmem->nvmem)) {
> +		dev_err(dev, "Failed to register NVMEM device\n");
> +		kfree(mtd_nvmem);
> +		return;
> +	}
> +
> +	mutex_lock(&mtd_nvmem_list_lock);
> +	list_add_tail(&mtd_nvmem->list, &mtd_nvmem_list);
> +	mutex_unlock(&mtd_nvmem_list_lock);
> +}
> +
> +static void mtd_nvmem_remove(struct mtd_info *mtd)
> +{
> +	struct mtd_nvmem *mtd_nvmem;
> +	bool found = false;
> +

May be we can use of_nvmem_find() directly here and avoid all this list 
and lock thingy. It should make the driver much simpler.

Am sure we can add exception to make of_nvmem_find() symbol public if 
its helping providers like this.


> +	mutex_lock(&mtd_nvmem_list_lock);
> +	list_for_each_entry(mtd_nvmem, &mtd_nvmem_list, list) {
> +		if (mtd_nvmem->mtd == mtd) {
> +			list_del(&mtd_nvmem->list);
> +			found = true;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&mtd_nvmem_list_lock);
> +
> +	if (found) {
> +		if (nvmem_unregister(mtd_nvmem->nvmem))
> +			dev_err(&mtd->dev,
> +				"Failed to unregister NVMEM device\n");

I will be nice to feedback error to top layer, as it does not make sense 
to remove providers if there are active consumers using it.

del_mtd_device(), unregister_mtd_user() have return values, I see no 
reason why notifiers  should not return errors.
May be if we should fix the remove() call backs to handle and return errors.


> +		kfree(mtd_nvmem);
> +	}

> +}
> +
> +static struct mtd_notifier mtd_nvmem_notifier = {
> +	.add = mtd_nvmem_add,
> +	.remove = mtd_nvmem_remove,
> +};
> +
> +static int __init mtd_nvmem_init(void)
> +{
> +	register_mtd_user(&mtd_nvmem_notifier);
> +	return 0;
> +}
> +module_init(mtd_nvmem_init);
> +
> +static void __exit mtd_nvmem_exit(void)
> +{
> +	unregister_mtd_user(&mtd_nvmem_notifier);
> +}
> +module_exit(mtd_nvmem_exit);

> +
> +MODULE_LICENSE("GPL");

GPL V2  ??


Thanks,
srini
> +MODULE_AUTHOR("Alban Bedel <albeu@free.fr>");
> +MODULE_DESCRIPTION("Driver to read config data from MTD devices");
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
