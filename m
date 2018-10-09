From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 11/14] mtd: maps: Merge physmap_of.c into physmap-core.c
Date: Tue, 9 Oct 2018 08:58:40 +0200
Message-ID: <CAPybu_1AA-fqSdS_+S=D8XEMaHs9SyECsf1SWq7cRBF8Z3oOzQ@mail.gmail.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-12-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181008201027.17952-12-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Boris
On Mon, Oct 8, 2018 at 10:10 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> There's no real reason to have two separate driver for the DT and pdata
> case. Just do what we do everywhere else and handle DT and pdata
> parsing in the same driver.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/maps/Kconfig           |   4 +-
>  drivers/mtd/maps/Makefile          |   7 +-
>  drivers/mtd/maps/physmap-core.c    | 260 +++++++++++++++++++++++---
>  drivers/mtd/maps/physmap_of_core.c | 368 -------------------------------------
>  4 files changed, 239 insertions(+), 400 deletions(-)
>  delete mode 100644 drivers/mtd/maps/physmap_of_core.c
>
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index afb36bff13a7..5bffebacce86 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -66,8 +66,8 @@ config MTD_PHYSMAP_BANKWIDTH
>           used internally by the CFI drivers.
>
>  config MTD_PHYSMAP_OF
> -       tristate "Memory device in physical memory map based on OF description"
> -       depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM)
> +       bool "Memory device in physical memory map based on OF description"
> +       depends on OF && MTD_PHYSMAP
>         help
>           This provides a 'mapping' driver which allows the NOR Flash, ROM
>           and RAM driver code to communicate with chips which are mapped
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 2574909edffd..ad32b185a120 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -18,13 +18,10 @@ obj-$(CONFIG_MTD_CK804XROM) += ck804xrom.o
>  obj-$(CONFIG_MTD_TSUNAMI)      += tsunami_flash.o
>  obj-$(CONFIG_MTD_PXA2XX)       += pxa2xx-flash.o
>  physmap-objs-y                 += physmap-core.o
> +physmap-objs-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE) += physmap_of_versatile.o
> +physmap-objs-$(CONFIG_MTD_PHYSMAP_OF_GEMINI) += physmap_of_gemini.o
>  physmap-objs                   := $(physmap-objs-y)
>  obj-$(CONFIG_MTD_PHYSMAP)      += physmap.o
> -physmap_of-objs-y              += physmap_of_core.o
> -physmap_of-objs-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE) += physmap_of_versatile.o
> -physmap_of-objs-$(CONFIG_MTD_PHYSMAP_OF_GEMINI) += physmap_of_gemini.o
> -physmap_of-objs                        := $(physmap_of-objs-y)
> -obj-$(CONFIG_MTD_PHYSMAP_OF)   += physmap_of.o
>  obj-$(CONFIG_MTD_PISMO)                += pismo.o
>  obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
>  obj-$(CONFIG_MTD_PCMCIA)       += pcmciamtd.o
> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
> index e27051bc5dc6..7a50ff9ef812 100644
> --- a/drivers/mtd/maps/physmap-core.c
> +++ b/drivers/mtd/maps/physmap-core.c
> @@ -6,6 +6,13 @@
>   * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
>   *
>   * 031022 - [jsun] add run-time configure and partition setup
> + *
> + * Device tree support:
> + *    Copyright (C) 2006 MontaVista Software Inc.
> + *    Author: Vitaly Wool <vwool@ru.mvista.com>
> + *
> + *    Revised to handle newer style flash binding by:
> + *    Copyright (C) 2007 David Gibson, IBM Corporation.
>   */
>
>  #include <linux/module.h>
> @@ -20,7 +27,12 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/physmap.h>
>  #include <linux/mtd/concat.h>
> +#include <linux/mtd/cfi_endian.h>
>  #include <linux/io.h>
> +#include <linux/of_device.h>
> +
> +#include "physmap_of_gemini.h"
> +#include "physmap_of_versatile.h"
>
>  struct physmap_flash_info {
>         unsigned int            nmaps;
> @@ -29,6 +41,10 @@ struct physmap_flash_info {
>         struct map_info         *maps;
>         spinlock_t              vpp_lock;
>         int                     vpp_refcnt;
> +       const char              *probe_type;
> +       const char * const      *part_types;
> +       unsigned int            nparts;
> +       const struct mtd_partition *parts;
>  };
>
>  static int physmap_flash_remove(struct platform_device *dev)
> @@ -41,8 +57,6 @@ static int physmap_flash_remove(struct platform_device *dev)
>         if (!info)
>                 return 0;
>
> -       physmap_data = dev_get_platdata(&dev->dev);
> -
>         if (info->cmtd) {
>                 err = mtd_device_unregister(info->cmtd);
>                 if (err)
> @@ -57,7 +71,8 @@ static int physmap_flash_remove(struct platform_device *dev)
>                         map_destroy(info->mtds[i]);
>         }
>
> -       if (physmap_data->exit)
> +       physmap_data = dev_get_platdata(&dev->dev);
> +       if (physmap_data && physmap_data->exit)
>                 physmap_data->exit(dev);
>
>         return 0;
> @@ -89,6 +104,172 @@ static void physmap_set_vpp(struct map_info *map, int state)
>         spin_unlock_irqrestore(&info->vpp_lock, flags);
>  }
>
> +#if IS_ENABLED(CONFIG_MTD_PHYSMAP_OF)
> +static const struct of_device_id of_flash_match[] = {
> +       {
> +               .compatible = "cfi-flash",
> +               .data = "cfi_probe",
> +       },
> +       {
> +               /*
> +                * FIXME: JEDEC chips can't be safely and reliably
> +                * probed, although the mtd code gets it right in
> +                * practice most of the time.  We should use the
> +                * vendor and device ids specified by the binding to
> +                * bypass the heuristic probe code, but the mtd layer
> +                * provides, at present, no interface for doing so
> +                * :(.
> +                */
> +               .compatible = "jedec-flash",
> +               .data = "jedec_probe",
> +       },
> +       {
> +               .compatible = "mtd-ram",
> +               .data = "map_ram",
> +       },
> +       {
> +               .compatible = "mtd-rom",
> +               .data = "map_rom",
> +       },
> +       {
> +               .type = "rom",
> +               .compatible = "direct-mapped"
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, of_flash_match);
> +
> +static const char * const of_default_part_probes[] = {
> +       "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL
> +};
> +
> +static const char * const *of_get_part_probes(struct platform_device *dev)
> +{
> +       struct device_node *dp = dev->dev.of_node;
> +       const char **res;
> +       int count;
> +
> +       count = of_property_count_strings(dp, "linux,part-probe");
> +       if (count < 0)
> +               return of_default_part_probes;
> +
> +       res = devm_kcalloc(&dev->dev, count + 1, sizeof(*res), GFP_KERNEL);
> +       if (!res)
> +               return NULL;
> +
> +       count = of_property_read_string_array(dp, "linux,part-probe", res,
> +                                             count);
> +       if (count < 0)
> +               return NULL;
> +
> +       return res;
> +}
> +
> +static const char *of_select_probe_type(struct platform_device *dev)
> +{
> +       struct device_node *dp = dev->dev.of_node;
> +       const struct of_device_id *match;
> +       const char *probe_type;
> +
> +       match = of_match_device(of_flash_match, &dev->dev);
> +       probe_type = match->data;
> +       if (probe_type)
> +               return probe_type;
> +
> +       dev_warn(&dev->dev,
> +                "Device tree uses obsolete \"direct-mapped\" flash binding\n");
> +
> +       of_property_read_string(dp, "probe-type", &probe_type);
> +       if (!probe_type)
> +               return NULL;
> +
> +       if (!strcmp(probe_type, "CFI")) {
> +               probe_type = "cfi_probe";
> +       } else if (!strcmp(probe_type, "JEDEC")) {
> +               probe_type = "jedec_probe";
> +       } else if (!strcmp(probe_type, "ROM")) {
> +               probe_type = "map_rom";
> +       } else {
> +               dev_warn(&dev->dev,
> +                        "obsolete_probe: don't know probe type '%s', mapping as rom\n",
> +                        probe_type);
> +               probe_type = "map_rom";
> +       }
> +
> +       return probe_type;
> +}
> +
> +static int physmap_flash_of_init(struct platform_device *dev)
> +{
> +       struct physmap_flash_info *info = platform_get_drvdata(dev);
> +       struct device_node *dp = dev->dev.of_node;
> +       const char *mtd_name = NULL;
> +       int err, swap = 0;
> +       bool map_indirect;
> +       unsigned int i;
> +       u32 bankwidth;
> +
> +       if (!dp)
> +               return -EINVAL;
> +
> +       info->probe_type = of_select_probe_type(dev);
> +
> +       info->part_types = of_get_part_probes(dev);
> +       if (!info->part_types)
> +               return -ENOMEM;
> +
> +       of_property_read_string(dp, "linux,mtd-name", &mtd_name);
> +
> +       map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
> +
> +       err = of_property_read_u32(dp, "bank-width", &bankwidth);
> +       if (err) {
> +               dev_err(&dev->dev, "Can't get bank width from device tree\n");
> +               return err;
> +       }
> +
> +       if (of_property_read_bool(dp, "big-endian"))
> +               swap = CFI_BIG_ENDIAN;
> +       else if (of_property_read_bool(dp, "little-endian"))
> +               swap = CFI_LITTLE_ENDIAN;
> +
> +       for (i = 0; i < info->nmaps; i++) {
> +               info->maps[i].name = mtd_name;
> +               info->maps[i].swap = swap;
> +               info->maps[i].bankwidth = bankwidth;
> +               info->maps[i].device_node = dp;
> +
> +               err = of_flash_probe_gemini(dev, dp, &info->maps[i]);
> +               if (err)
> +                       return err;
> +
> +               err = of_flash_probe_versatile(dev, dp, &info->maps[i]);
> +               if (err)
> +                       return err;
> +
> +               /*
> +                * On some platforms (e.g. MPC5200) a direct 1:1 mapping
> +                * may cause problems with JFFS2 usage, as the local bus (LPB)
> +                * doesn't support unaligned accesses as implemented in the
> +                * JFFS2 code via memcpy(). By setting NO_XIP, the
> +                * flash will not be exposed directly to the MTD users
> +                * (e.g. JFFS2) any more.
> +                */
> +               if (map_indirect)
> +                       info->maps[i].phys = NO_XIP;
> +       }
> +
> +       return 0;
> +}
> +#else /* IS_ENABLED(CONFIG_MTD_PHYSMAP_OF) */
> +#define of_flash_match NULL
> +
> +static int physmap_flash_of_init(struct platform_device *dev)
> +{
> +       return -ENOTSUPP;
> +}
> +#endif /* IS_ENABLED(CONFIG_MTD_PHYSMAP_OF) */
> +
>  static const char * const rom_probe_types[] = {
>         "cfi_probe", "jedec_probe", "qinfo_probe", "map_rom", NULL
>  };
> @@ -97,18 +278,46 @@ static const char * const part_probe_types[] = {
>         "cmdlinepart", "RedBoot", "afs", NULL
>  };
>
> -static int physmap_flash_probe(struct platform_device *dev)
> +static int physmap_flash_pdata_init(struct platform_device *dev)
>  {
> +       struct physmap_flash_info *info = platform_get_drvdata(dev);
>         struct physmap_flash_data *physmap_data;
> +       unsigned int i;
> +       int err;
> +
> +       physmap_data = dev_get_platdata(&dev->dev);
> +       if (!physmap_data)
> +               return -EINVAL;
> +
> +       info->probe_type = physmap_data->probe_type;
> +       info->part_types = physmap_data->part_probe_types ? : part_probe_types;
> +       info->parts = physmap_data->parts;
> +       info->nparts = physmap_data->nr_parts;
> +
> +       if (physmap_data->init) {
> +               err = physmap_data->init(dev);
> +               if (err)
> +                       return err;
> +       }
> +
> +       for (i = 0; i < info->nmaps; i++) {
> +               info->maps[i].bankwidth = physmap_data->width;
> +               info->maps[i].pfow_base = physmap_data->pfow_base;
> +               info->maps[i].set_vpp = physmap_set_vpp;
> +       }
> +
> +       return 0;
> +}
> +
> +static int physmap_flash_probe(struct platform_device *dev)
> +{
>         struct physmap_flash_info *info;
>         const char * const *probe_type;
> -       const char * const *part_types;
>         int err = 0;
>         int i;
>
> -       physmap_data = dev_get_platdata(&dev->dev);
> -       if (!physmap_data)
> -               return -ENODEV;
> +       if (!dev->dev.of_node && dev_get_platdata(&dev->dev))
> +               return -EINVAL;

Maybe you want:
            if (!dev->dev.of_node && !dev_get_platdata(&dev->dev))
>
>         info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
>         if (!info)
> @@ -132,14 +341,15 @@ static int physmap_flash_probe(struct platform_device *dev)
>         if (!info->mtds)
>                 return -ENOMEM;
>
> -       if (physmap_data->init) {
> -               err = physmap_data->init(dev);
> -               if (err)
> -                       goto err_out;
> -       }
> -
>         platform_set_drvdata(dev, info);
>
> +       err = physmap_flash_of_init(dev);
> +       if (err)
> +               err = physmap_flash_pdata_init(dev);
> +

Maybe replace this with:
  if (dev->dev.of_node)
     err = physmap_flash_of_init(dev);
 else
    err = physmap_flash_pdata_init(dev);

Otherwise we are hiding the returncode from  of_init, which might be
defered probing.

> +       if (err)
> +               return err;
> +
>         for (i = 0; i < info->nmaps; i++) {
>                 struct resource *res;
>
> @@ -154,22 +364,22 @@ static int physmap_flash_probe(struct platform_device *dev)
>                            res);
>
>                 info->maps[i].name = dev_name(&dev->dev);
> -               info->maps[i].phys = res->start;
> +
> +               if (!info->maps[i].phys)
> +                       info->maps[i].phys = res->start;
> +
>                 info->maps[i].size = resource_size(res);
> -               info->maps[i].bankwidth = physmap_data->width;
> -               info->maps[i].set_vpp = physmap_set_vpp;
> -               info->maps[i].pfow_base = physmap_data->pfow_base;
>                 info->maps[i].map_priv_1 = (unsigned long)dev;
>
>                 simple_map_init(&info->maps[i]);
>
>                 probe_type = rom_probe_types;
> -               if (!physmap_data->probe_type) {
> +               if (!info->probe_type) {
>                         for (; !info->mtds[i] && *probe_type; probe_type++)
>                                 info->mtds[i] = do_map_probe(*probe_type,
>                                                              &info->maps[i]);
>                 } else {
> -                       info->mtds[i] = do_map_probe(physmap_data->probe_type,
> +                       info->mtds[i] = do_map_probe(info->probe_type,
>                                                      &info->maps[i]);
>                 }
>
> @@ -197,11 +407,9 @@ static int physmap_flash_probe(struct platform_device *dev)
>
>         spin_lock_init(&info->vpp_lock);
>
> -       part_types = physmap_data->part_probe_types ? : part_probe_types;
> -
> -       err = mtd_device_parse_register(info->cmtd, part_types, NULL,
> -                                       physmap_data->parts,
> -                                       physmap_data->nr_parts);
> +       mtd_set_of_node(info->cmtd, dev->dev.of_node);
> +       err = mtd_device_parse_register(info->cmtd, info->part_types, NULL,
> +                                       info->parts, info->nparts);
>         if (err)
>                 goto err_out;
>
> @@ -232,6 +440,7 @@ static struct platform_driver physmap_flash_driver = {
>         .shutdown       = physmap_flash_shutdown,
>         .driver         = {
>                 .name   = "physmap-flash",
> +               .of_match_table = of_flash_match,
>         },
>  };
>
> @@ -286,6 +495,7 @@ module_exit(physmap_exit);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
> +MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
>  MODULE_DESCRIPTION("Generic configurable MTD map driver");
>
>  /* legacy platform drivers can't hotplug or coldplg */
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
> deleted file mode 100644
> index ece605d78c21..000000000000
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ /dev/null
> @@ -1,368 +0,0 @@
> -/*
> - * Flash mappings described by the OF (or flattened) device tree
> - *
> - * Copyright (C) 2006 MontaVista Software Inc.
> - * Author: Vitaly Wool <vwool@ru.mvista.com>
> - *
> - * Revised to handle newer style flash binding by:
> - *   Copyright (C) 2007 David Gibson, IBM Corporation.
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
> - */
> -
> -#include <linux/module.h>
> -#include <linux/types.h>
> -#include <linux/device.h>
> -#include <linux/mtd/mtd.h>
> -#include <linux/mtd/map.h>
> -#include <linux/mtd/partitions.h>
> -#include <linux/mtd/concat.h>
> -#include <linux/mtd/cfi_endian.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> -#include <linux/slab.h>
> -#include "physmap_of_gemini.h"
> -#include "physmap_of_versatile.h"
> -
> -struct of_flash_list {
> -       struct mtd_info *mtd;
> -       struct map_info map;
> -};
> -
> -struct of_flash {
> -       struct mtd_info         *cmtd;
> -       int list_size; /* number of elements in of_flash_list */
> -       struct of_flash_list    list[0];
> -};
> -
> -static int of_flash_remove(struct platform_device *dev)
> -{
> -       struct of_flash *info;
> -       int i;
> -
> -       info = dev_get_drvdata(&dev->dev);
> -       if (!info)
> -               return 0;
> -       dev_set_drvdata(&dev->dev, NULL);
> -
> -       if (info->cmtd) {
> -               mtd_device_unregister(info->cmtd);
> -               if (info->cmtd != info->list[0].mtd)
> -                       mtd_concat_destroy(info->cmtd);
> -       }
> -
> -       for (i = 0; i < info->list_size; i++)
> -               if (info->list[i].mtd)
> -                       map_destroy(info->list[i].mtd);
> -
> -       return 0;
> -}
> -
> -static const char * const rom_probe_types[] = {
> -       "cfi_probe", "jedec_probe", "map_rom" };
> -
> -/* Helper function to handle probing of the obsolete "direct-mapped"
> - * compatible binding, which has an extra "probe-type" property
> - * describing the type of flash probe necessary. */
> -static struct mtd_info *obsolete_probe(struct platform_device *dev,
> -                                      struct map_info *map)
> -{
> -       struct device_node *dp = dev->dev.of_node;
> -       const char *of_probe;
> -       struct mtd_info *mtd;
> -       int i;
> -
> -       dev_warn(&dev->dev, "Device tree uses obsolete \"direct-mapped\" "
> -                "flash binding\n");
> -
> -       of_probe = of_get_property(dp, "probe-type", NULL);
> -       if (!of_probe) {
> -               for (i = 0; i < ARRAY_SIZE(rom_probe_types); i++) {
> -                       mtd = do_map_probe(rom_probe_types[i], map);
> -                       if (mtd)
> -                               return mtd;
> -               }
> -               return NULL;
> -       } else if (strcmp(of_probe, "CFI") == 0) {
> -               return do_map_probe("cfi_probe", map);
> -       } else if (strcmp(of_probe, "JEDEC") == 0) {
> -               return do_map_probe("jedec_probe", map);
> -       } else {
> -               if (strcmp(of_probe, "ROM") != 0)
> -                       dev_warn(&dev->dev, "obsolete_probe: don't know probe "
> -                                "type '%s', mapping as rom\n", of_probe);
> -               return do_map_probe("map_rom", map);
> -       }
> -}
> -
> -/* When partitions are set we look for a linux,part-probe property which
> -   specifies the list of partition probers to use. If none is given then the
> -   default is use. These take precedence over other device tree
> -   information. */
> -static const char * const part_probe_types_def[] = {
> -       "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
> -
> -static const char * const *of_get_probes(struct device_node *dp)
> -{
> -       const char **res;
> -       int count;
> -
> -       count = of_property_count_strings(dp, "linux,part-probe");
> -       if (count < 0)
> -               return part_probe_types_def;
> -
> -       res = kcalloc(count + 1, sizeof(*res), GFP_KERNEL);
> -       if (!res)
> -               return NULL;
> -
> -       count = of_property_read_string_array(dp, "linux,part-probe", res,
> -                                             count);
> -       if (count < 0)
> -               return NULL;
> -
> -       return res;
> -}
> -
> -static void of_free_probes(const char * const *probes)
> -{
> -       if (probes != part_probe_types_def)
> -               kfree(probes);
> -}
> -
> -static const struct of_device_id of_flash_match[];
> -static int of_flash_probe(struct platform_device *dev)
> -{
> -       const char * const *part_probe_types;
> -       const struct of_device_id *match;
> -       struct device_node *dp = dev->dev.of_node;
> -       struct resource res;
> -       struct of_flash *info;
> -       const char *probe_type;
> -       const __be32 *width;
> -       int err;
> -       int i;
> -       int count;
> -       const __be32 *p;
> -       int reg_tuple_size;
> -       struct mtd_info **mtd_list = NULL;
> -       resource_size_t res_size;
> -       bool map_indirect;
> -       const char *mtd_name = NULL;
> -
> -       match = of_match_device(of_flash_match, &dev->dev);
> -       if (!match)
> -               return -EINVAL;
> -       probe_type = match->data;
> -
> -       reg_tuple_size = (of_n_addr_cells(dp) + of_n_size_cells(dp)) * sizeof(u32);
> -
> -       of_property_read_string(dp, "linux,mtd-name", &mtd_name);
> -
> -       /*
> -        * Get number of "reg" tuples. Scan for MTD devices on area's
> -        * described by each "reg" region. This makes it possible (including
> -        * the concat support) to support the Intel P30 48F4400 chips which
> -        * consists internally of 2 non-identical NOR chips on one die.
> -        */
> -       p = of_get_property(dp, "reg", &count);
> -       if (!p || count % reg_tuple_size != 0) {
> -               dev_err(&dev->dev, "Malformed reg property on %pOF\n",
> -                               dev->dev.of_node);
> -               err = -EINVAL;
> -               goto err_flash_remove;
> -       }
> -       count /= reg_tuple_size;
> -
> -       map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
> -
> -       err = -ENOMEM;
> -       info = devm_kzalloc(&dev->dev,
> -                           sizeof(struct of_flash) +
> -                           sizeof(struct of_flash_list) * count, GFP_KERNEL);
> -       if (!info)
> -               goto err_flash_remove;
> -
> -       dev_set_drvdata(&dev->dev, info);
> -
> -       mtd_list = kcalloc(count, sizeof(*mtd_list), GFP_KERNEL);
> -       if (!mtd_list)
> -               goto err_flash_remove;
> -
> -       for (i = 0; i < count; i++) {
> -               err = -ENXIO;
> -               if (of_address_to_resource(dp, i, &res)) {
> -                       /*
> -                        * Continue with next register tuple if this
> -                        * one is not mappable
> -                        */
> -                       continue;
> -               }
> -
> -               dev_dbg(&dev->dev, "of_flash device: %pR\n", &res);
> -
> -               err = -EBUSY;
> -               res_size = resource_size(&res);
> -               info->list[i].map.virt = devm_ioremap_resource(&dev->dev, &res);
> -               if (IS_ERR(info->list[i].map.virt)) {
> -                       err = PTR_ERR(info->list[i].map.virt);
> -                       goto err_out;
> -               }
> -
> -               err = -ENXIO;
> -               width = of_get_property(dp, "bank-width", NULL);
> -               if (!width) {
> -                       dev_err(&dev->dev, "Can't get bank width from device"
> -                               " tree\n");
> -                       goto err_out;
> -               }
> -
> -               info->list[i].map.name = mtd_name ?: dev_name(&dev->dev);
> -               info->list[i].map.phys = res.start;
> -               info->list[i].map.size = res_size;
> -               info->list[i].map.bankwidth = be32_to_cpup(width);
> -               info->list[i].map.device_node = dp;
> -
> -               if (of_property_read_bool(dp, "big-endian"))
> -                       info->list[i].map.swap = CFI_BIG_ENDIAN;
> -               else if (of_property_read_bool(dp, "little-endian"))
> -                       info->list[i].map.swap = CFI_LITTLE_ENDIAN;
> -
> -               err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
> -               if (err)
> -                       goto err_out;
> -               err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
> -               if (err)
> -                       goto err_out;
> -
> -               simple_map_init(&info->list[i].map);
> -
> -               /*
> -                * On some platforms (e.g. MPC5200) a direct 1:1 mapping
> -                * may cause problems with JFFS2 usage, as the local bus (LPB)
> -                * doesn't support unaligned accesses as implemented in the
> -                * JFFS2 code via memcpy(). By setting NO_XIP, the
> -                * flash will not be exposed directly to the MTD users
> -                * (e.g. JFFS2) any more.
> -                */
> -               if (map_indirect)
> -                       info->list[i].map.phys = NO_XIP;
> -
> -               if (probe_type) {
> -                       info->list[i].mtd = do_map_probe(probe_type,
> -                                                        &info->list[i].map);
> -               } else {
> -                       info->list[i].mtd = obsolete_probe(dev,
> -                                                          &info->list[i].map);
> -               }
> -
> -               /* Fall back to mapping region as ROM */
> -               if (!info->list[i].mtd) {
> -                       dev_warn(&dev->dev,
> -                               "do_map_probe() failed for type %s\n",
> -                                probe_type);
> -
> -                       info->list[i].mtd = do_map_probe("map_rom",
> -                                                        &info->list[i].map);
> -               }
> -               mtd_list[i] = info->list[i].mtd;
> -
> -               err = -ENXIO;
> -               if (!info->list[i].mtd) {
> -                       dev_err(&dev->dev, "do_map_probe() failed\n");
> -                       goto err_out;
> -               } else {
> -                       info->list_size++;
> -               }
> -               info->list[i].mtd->dev.parent = &dev->dev;
> -       }
> -
> -       err = 0;
> -       info->cmtd = NULL;
> -       if (info->list_size == 1) {
> -               info->cmtd = info->list[0].mtd;
> -       } else if (info->list_size > 1) {
> -               /*
> -                * We detected multiple devices. Concatenate them together.
> -                */
> -               info->cmtd = mtd_concat_create(mtd_list, info->list_size,
> -                                              dev_name(&dev->dev));
> -       }
> -       if (info->cmtd == NULL)
> -               err = -ENXIO;
> -
> -       if (err)
> -               goto err_out;
> -
> -       info->cmtd->dev.parent = &dev->dev;
> -       mtd_set_of_node(info->cmtd, dp);
> -       part_probe_types = of_get_probes(dp);
> -       if (!part_probe_types) {
> -               err = -ENOMEM;
> -               goto err_out;
> -       }
> -       mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
> -                       NULL, 0);
> -       of_free_probes(part_probe_types);
> -
> -       kfree(mtd_list);
> -
> -       return 0;
> -
> -err_out:
> -       kfree(mtd_list);
> -err_flash_remove:
> -       of_flash_remove(dev);
> -
> -       return err;
> -}
> -
> -static const struct of_device_id of_flash_match[] = {
> -       {
> -               .compatible     = "cfi-flash",
> -               .data           = (void *)"cfi_probe",
> -       },
> -       {
> -               /* FIXME: JEDEC chips can't be safely and reliably
> -                * probed, although the mtd code gets it right in
> -                * practice most of the time.  We should use the
> -                * vendor and device ids specified by the binding to
> -                * bypass the heuristic probe code, but the mtd layer
> -                * provides, at present, no interface for doing so
> -                * :(. */
> -               .compatible     = "jedec-flash",
> -               .data           = (void *)"jedec_probe",
> -       },
> -       {
> -               .compatible     = "mtd-ram",
> -               .data           = (void *)"map_ram",
> -       },
> -       {
> -               .compatible     = "mtd-rom",
> -               .data           = (void *)"map_rom",
> -       },
> -       {
> -               .type           = "rom",
> -               .compatible     = "direct-mapped"
> -       },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, of_flash_match);
> -
> -static struct platform_driver of_flash_driver = {
> -       .driver = {
> -               .name = "of-flash",
> -               .of_match_table = of_flash_match,
> -       },
> -       .probe          = of_flash_probe,
> -       .remove         = of_flash_remove,
> -};
> -
> -module_platform_driver(of_flash_driver);
> -
> -MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
> -MODULE_DESCRIPTION("Device tree based MTD map driver");
> --
> 2.14.1
>


-- 
Ricardo Ribalda

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
