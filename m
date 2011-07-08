From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: add devicetree API for regulator
Date: Fri, 8 Jul 2011 08:51:17 -0600
Message-ID: <CACxGe6teb+-xYGUXAcjwubxNhNQ-9395PjjE=fDnmZQHbgR0tw@mail.gmail.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-3-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-4-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-6-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-7-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-8-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1310120428-22700-8-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, samuel.ortiz-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Haojian,

On Fri, Jul 8, 2011 at 4:20 AM, Haojian Zhuang
<haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

No commit description?

> ---
> =A0drivers/of/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +
> =A0drivers/of/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/of/of_regulator.c =A0 =A0| =A0166 ++++++++++++++++++++++++++++=
++++++++++++++
> =A0include/linux/of_regulator.h | =A0 34 +++++++++
> =A04 files changed, 205 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/of/of_regulator.c
> =A0create mode 100644 include/linux/of_regulator.h
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index d06a637..edb6601 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -75,4 +75,8 @@ config OF_PCI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0OpenFirmware PCI bus accessors
>
> +config OF_REGULATOR
> + =A0 =A0 =A0 def_tristate REGULATOR
> + =A0 =A0 =A0 depends on REGULATOR
> +
> =A0endmenu # OF
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index f7861ed..83ca06f 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_OF_NET) =A0+=3D of_net.o
> =A0obj-$(CONFIG_OF_SPI) =A0 +=3D of_spi.o
> =A0obj-$(CONFIG_OF_MDIO) =A0+=3D of_mdio.o
> =A0obj-$(CONFIG_OF_PCI) =A0 +=3D of_pci.o
> +obj-$(CONFIG_OF_REGULATOR) =A0 =A0 +=3D of_regulator.o
> diff --git a/drivers/of/of_regulator.c b/drivers/of/of_regulator.c
> new file mode 100644
> index 0000000..d523302
> --- /dev/null
> +++ b/drivers/of/of_regulator.c
> @@ -0,0 +1,166 @@
> +/*
> + * OF helpers for the Regulator API
> + *
> + * Copyright (c) 2011 Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/suspend.h>
> +
> +static int of_regulator_init_constraints(struct device_node *of_dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct regu=
lation_constraints *constraints)
> +{
> + =A0 =A0 =A0 const __be32 *p;
> + =A0 =A0 =A0 const char *cp;
> + =A0 =A0 =A0 const char *ops[] =3D {"voltage", "current", "mode", "statu=
s",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "drms"};
> + =A0 =A0 =A0 int i, size, len =3D 0, tmp =3D 0;
> +
> + =A0 =A0 =A0 memset(constraints, 0, sizeof(struct regulation_constraints=
));
> +
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "voltages", &size);
> + =A0 =A0 =A0 if (p && size / sizeof(int) =3D=3D 2) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->min_uV =3D be32_to_cpu(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->max_uV =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 }

You can probably simplify a lot of code by using
of_property_read_u32_array(), which is currently in devicetree/next

> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "currents", &size);
> + =A0 =A0 =A0 if (p && size / sizeof(int) =3D=3D 2) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->min_uA =3D be32_to_cpu(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->max_uA =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "modes-mask", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->valid_modes_mask =3D be32_to_c=
pu(*p);
> + =A0 =A0 =A0 cp =3D of_get_property(of_dev, "ops-mask", &size);
> + =A0 =A0 =A0 tmp =3D 0;
> + =A0 =A0 =A0 if (cp && size > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D strlen(ops[i]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strncmp(cp, ops[i], le=
n)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints=
->valid_ops_mask |=3D 1 << i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* need to =
handle '\0' */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp +=3D len=
 + 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size =3D si=
ze - len - 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (i < ARRAY_SIZE(ops));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (size > 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Invali=
d string:%s\n", cp);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "input-uV", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->input_uV =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "state-pm-disk", &size);
> + =A0 =A0 =A0 if (p && size / sizeof(int) =3D=3D 3) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_disk.uV =3D be32_to_cpu(=
*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_disk.mode =3D be32_to_cp=
u(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_disk.enabled =3D (tmp) ?=
 1 : 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_disk.disabled =3D (tmp) =
? 0 : 1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "state-pm-mem", &size);
> + =A0 =A0 =A0 if (p && size / sizeof(int) =3D=3D 3) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_mem.uV =3D be32_to_cpu(*=
p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_mem.mode =3D be32_to_cpu=
(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_mem.enabled =3D (tmp) ? =
1 : 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_mem.disabled =3D (tmp) ?=
 0 : 1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "state-pm-standby", &size);
> + =A0 =A0 =A0 if (p && size / sizeof(int) =3D=3D 3) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_standby.uV =3D be32_to_c=
pu(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_standby.mode =3D be32_to=
_cpu(*p++);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D be32_to_cpu(*p);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_standby.enabled =3D (tmp=
) ? 1 : 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->state_standby.disabled =3D (tm=
p) ? 0 : 1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 cp =3D of_get_property(of_dev, "initial-state", &size);
> + =A0 =A0 =A0 if (cp) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strncmp(cp, "pm-suspend-on", size))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->initial_state =
=3D PM_SUSPEND_ON;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strncmp(cp, "pm-suspend-mem", size))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->initial_state =
=3D PM_SUSPEND_MEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strncmp(cp, "pm-suspend-standby", size=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->initial_state =
=3D PM_SUSPEND_STANDBY;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "initial_mode", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->initial_mode =3D be32_to_cpu(*=
p);
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "always-on", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->always_on =3D 1;
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "boot-on", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->boot_on =3D 1;
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "apply-uV", NULL);
> + =A0 =A0 =A0 if (p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 constraints->apply_uV =3D 1;
> + =A0 =A0 =A0 return 0;
> +}

This code is implementing a new binding which needs to be documented
in Documentation/devicetree/bindings.  It is hard to review the patch
without some accompanying documentation about how you expect it to be
used.

> +
> +int of_regulator_init_data(struct device_node *of_dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct regulator_init_data =
*data)
> +{
> + =A0 =A0 =A0 struct regulator_consumer_supply *supply;
> + =A0 =A0 =A0 const char *p, *str;
> + =A0 =A0 =A0 int ret, i, size, calc_size, len, count =3D 0;
> +
> + =A0 =A0 =A0 if (of_dev =3D=3D NULL || data =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "device_type", &size);
> + =A0 =A0 =A0 if (p =3D=3D NULL || strncmp(p, "regulator", size))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 ret =3D of_regulator_init_constraints(of_dev, &data->constr=
aints);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 p =3D of_get_property(of_dev, "supply-name", &size);
> + =A0 =A0 =A0 str =3D p;
> + =A0 =A0 =A0 calc_size =3D size;
> + =A0 =A0 =A0 while (str && calc_size > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D strlen(str);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (len =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 calc_size =3D calc_size - len - 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 str +=3D len + 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 count++;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (count =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 supply =3D kzalloc(sizeof(struct regulator_consumer_supply)=
 * count,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL);
> + =A0 =A0 =A0 if (supply =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 str =3D p;
> + =A0 =A0 =A0 calc_size =3D size;
> + =A0 =A0 =A0 i =3D 0;
> + =A0 =A0 =A0 while (str && calc_size > 0 && i < count) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D strlen(str);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (len =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 supply[i++].supply =3D str;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 calc_size =3D calc_size - len - 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 str +=3D len + 1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 data->consumer_supplies =3D supply;
> + =A0 =A0 =A0 data->num_consumer_supplies =3D count;
> + =A0 =A0 =A0 return 0;
> +}
> +
> +void of_regulator_deinit_data(struct regulator_init_data *data)
> +{
> + =A0 =A0 =A0 if (data && data->consumer_supplies)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(data->consumer_supplies);
> +}
> diff --git a/include/linux/of_regulator.h b/include/linux/of_regulator.h
> new file mode 100644
> index 0000000..0155bd8
> --- /dev/null
> +++ b/include/linux/of_regulator.h
> @@ -0,0 +1,34 @@
> +/*
> + * Generic Regulator API implementation
> + *
> + * Copyright (c) 2011 Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __LINUX_OF_REGULATOR_H
> +#define __LINUX_OF_REGULATOR_H
> +
> +#if defined(CONFIG_OF_REGULATOR) || defined(CONFIG_OF_REGULATOR_MODULE)
> +#include <linux/regulator/machine.h>
> +
> +extern int of_regulator_init_data(struct device_node *of_node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct regu=
lator_init_data *data);
> +extern void of_regulator_deinit_data(struct regulator_init_data *data);
> +
> +#else
> +static inline int of_regulator_init_data(struct device_node *of_node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct regu=
lator_init_data *data)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static inline void of_regulator_deinit_data(struct regulator_init_data *=
data)
> +{
> +}
> +#endif /* CONFIG_OF_REGULATOR */
> +
> +#endif /* __LINUX_OF_REGULATOR_H */
> --
> 1.5.6.5
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
