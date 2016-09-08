From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Thu, 8 Sep 2016 14:08:20 -0700
Message-ID: <57D1D344.8010306@gmail.com>
References: <001a113447d4718cb9053c04f991@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <001a113447d4718cb9053c04f991-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/08/16 13:35, dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org wrote:
> From e14eb45fa5a93c1bff8a6dfe7b6756e4ad72c579 Mon Sep 17 00:00:00 2001
> From: Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 24 Aug 2016 13:25:52 -0700
> Subject: [PATCH] of: Overlay manager
> 
> Overlay manager processes DT entries on demand.
> It is chosen by CONFIG_OF_OVERLAY_MGR option.
> These entries can be chosen from kernel command line:
> overlay_mgr.overlay_dt_entry=hardware_cfg_0
> DT contains main overlay_mng entry with all possible
> HW config setups. And then kernel command line option
> will allow to choose between them.
> 
>   Kernel DT entry:
>     overlay_mgr {
>         compatible = "linux,overlay_manager";
>         hardware_cfg_0 {
>             overlay@0 {
>                     fragment@0 {
>                             __overlay__ {
>                             };
>                     };
>             };
>             overlay@1 {
>                     fragment@0 {
>                             __overlay__ {
>                             };
>                     };
>             };
>         };
>     };

What problem(s) are you trying to solve with this?

What is the use case?

-Frank

> 
> Signed-off-by: Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/of/overlay_mgr.txt         | 32 ++++++++
>  drivers/of/Kconfig                                 | 10 +++
>  drivers/of/Makefile                                |  1 +
>  drivers/of/overlay_mgr.c                           | 90 ++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/of/overlay_mgr.txt
>  create mode 100644 drivers/of/overlay_mgr.c
> 
> diff --git a/Documentation/devicetree/bindings/of/overlay_mgr.txt b/Documentation/devicetree/bindings/of/overlay_mgr.txt
> new file mode 100644
> index 0000000..5f3ce4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/of/overlay_mgr.txt
> @@ -0,0 +1,32 @@
> +overlay_mgr
> +
> +Required properties:
> +- compatible: "linux,overlay_manager";
> +
> +Optional properties:
> +- starts from the word "hardware": hardware_cfg_0
> +
> +These properties can be chosen from kernel command line:
> +overlay_mgr.overlay_dt_entry=hardware_cfg_0
> +DT contains main overlay_mng entry with all possible
> +HW config setups. And then kernel command line option
> +will allow to choose between them.
> +
> +Example:
> +    overlay_mgr {
> +        compatible = "linux,overlay_manager";
> +        hardware_cfg_0 {
> +            overlay@0 {
> +                    fragment@0 {
> +                            __overlay__ {
> +                            };
> +                    };
> +            };
> +            overlay@1 {
> +                    fragment@0 {
> +                            __overlay__ {
> +                            };
> +                    };
> +            };
> +        };
> +    };
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index e2a4841..e3eb06d 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -112,4 +112,14 @@ config OF_OVERLAY
>        While this option is selected automatically when needed, you can
>        enable it manually to improve device tree unit test coverage.
> 
> +config OF_OVERLAY_MGR
> +    bool "Enable Overlay manager"
> +    default n
> +    depends on OF_OVERLAY
> +    help
> +      Enables Overlay manager - it accepts DT entry from command line
> +      overlay_mgr.overlay_dt_entry=<name> and applies all overlays in
> +      it to current DT. It is also possible to apply predefined DT
> +      entry on the fly by writing it to 'current_overlay' sysfs entry.
> +
>  endif # OF
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 156c072..3bddd19 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -14,5 +14,6 @@ obj-$(CONFIG_OF_MTD)    += of_mtd.o
>  obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
>  obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
> +obj-$(CONFIG_OF_OVERLAY_MGR) += overlay_mgr.o
> 
>  obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> diff --git a/drivers/of/overlay_mgr.c b/drivers/of/overlay_mgr.c
> new file mode 100644
> index 0000000..1fdeb0a
> --- /dev/null
> +++ b/drivers/of/overlay_mgr.c
> @@ -0,0 +1,90 @@
> +/*
> + * Overlay manager that allows to apply list of overlays from DT entry
> + *
> + * Copyright (C) 2016 Google, Inc.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static char *of_overlay_dt_entry;
> +module_param_named(overlay_dt_entry, of_overlay_dt_entry, charp, 0644);
> +
> +static int of_overlay_mgr_apply_overlay(struct device_node *onp)
> +{
> +    int ret;
> +
> +    ret = of_overlay_create(onp);
> +    if (ret < 0) {
> +        pr_err("overlay_mgr: fail to create overlay: %d\n", ret);
> +        of_node_put(onp);
> +        return ret;
> +    }
> +    pr_info("overlay_mgr: %s overlay applied\n", onp->name);
> +    return 0;
> +}
> +
> +static int of_overlay_mgr_apply_dt(struct device *dev, char *dt_entry)
> +{
> +    struct device_node *enp = dev->of_node;
> +    struct device_node *next;
> +    struct device_node *prev = NULL;
> +
> +    if (!enp) {
> +        pr_err("overlay_mgr: no dt entry\n");
> +        return -ENODEV;
> +    }
> +
> +    enp = of_get_child_by_name(enp, dt_entry);
> +    if (!enp) {
> +        pr_err("overlay_mgr: dt entry %s not found\n", dt_entry);
> +        return -ENODEV;
> +    }
> +    pr_info("overlay_mgr: apply %s dt entry\n", enp->name);
> +    while ((next = of_get_next_available_child(enp, prev)) != NULL) {
> +        if (strncmp(next->name, "overlay", 7) == 0)
> +            of_overlay_mgr_apply_overlay(next);
> +        prev = next;
> +    }
> +    return 0;
> +}
> +
> +static int of_overlay_mgr_probe(struct platform_device *pdev)
> +{
> +    if (!of_overlay_dt_entry)
> +        return 0;
> +    of_overlay_mgr_apply_dt(&pdev->dev, of_overlay_dt_entry);
> +    return 0;
> +}
> +
> +static const struct of_device_id of_overlay_mgr_match[] = {
> +    { .compatible = "linux,overlay_manager", },
> +    {}
> +};
> +
> +static struct platform_driver of_overlay_mgr_driver = {
> +    .probe    = of_overlay_mgr_probe,
> +    .driver    = {
> +        .name = "overlay_manager",
> +        .of_match_table = of_match_ptr(of_overlay_mgr_match),
> +    },
> +};
> +
> +static int __init of_overlay_mgr_init(void)
> +{
> +    return platform_driver_register(&of_overlay_mgr_driver);
> +}
> +
> +postcore_initcall(of_overlay_mgr_init);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
