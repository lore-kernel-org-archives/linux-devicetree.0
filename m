From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] mfd: Add TI LMU driver
Date: Mon, 17 Feb 2014 09:57:34 +0000
Message-ID: <20140217095734.GD17875@lee--X1>
References: <1392359450-6890-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392359450-6890-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> TI LMU (Lighting Management Unit) driver supports lighting devices su=
ch like
> LM3532, LM3631, LM3633, LM3695 and LM3697.
>=20
> LMU devices has common features as below.
>   - I2C interface for accessing device registers
>   - Hardware enable pin control
>   - Backlight brightness control
>   - Light effect driver for backlight and LED patterns
>=20
> It contains backlight, light effect, LED and regulator driver.
>=20
> Backlight
> ---------
>   It's handled by TI LMU backlight common driver and chip dependent d=
river.
>   Please refer to separate patches for ti-lmu-backlight.
>=20
> Light effect
> ------------
>   LMU effect driver is used for setting any light effects.
>   Each device has specific time value and register map.
>   Backlight and LED driver can use consitent APIs for light effects.
>=20
>   There are two lists for effect management. LMU effect list and pend=
ing list.
>   Light effect list is added when ti-lmu-effect driver is loaded by r=
eferencing
>   platform resource data.
>   However, it can be a problem because some LMU device requests the e=
ffect
>   in advance of loading ti-lmu-effect driver.
>=20
>   For example, LM3532 backlight driver requests light ramp effects be=
fore
>   ti-lmu-effect is loaded.
>   Then, requested effect can not be handled because it doesn't exist =
in the list.
>   To solve this situation, pending request list is used.
>   If requested effect is not in the list, just insert it into the pen=
ding list.
>   And then pending request is handled as soon as the effect is added.
>=20
> LED indicator
> -------------
>   LM3633 has 6 indicator LEDs. Programmable pattern is supported.
>=20
> Regulator
> ---------
>   LM3631 has 5 regulators for the display bias.
>=20
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/mfd/Kconfig                 |   12 +
>  drivers/mfd/Makefile                |    1 +
>  drivers/mfd/ti-lmu-effect.c         |  328 +++++++++++++++++++++++++
>  drivers/mfd/ti-lmu.c                |  464 +++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/ti-lmu-effect.h   |  109 ++++++++
>  include/linux/mfd/ti-lmu-register.h |  269 ++++++++++++++++++++
>  include/linux/mfd/ti-lmu.h          |  150 +++++++++++
>  7 files changed, 1333 insertions(+)
>  create mode 100644 drivers/mfd/ti-lmu-effect.c
>  create mode 100644 drivers/mfd/ti-lmu.c
>  create mode 100644 include/linux/mfd/ti-lmu-effect.h
>  create mode 100644 include/linux/mfd/ti-lmu-register.h
>  create mode 100644 include/linux/mfd/ti-lmu.h

<snip>

> +static u8 ti_lmu_effect_get_ramp_index(struct ti_lmu_effect *lmu_eff=
ect,
> +				       int msec)
> +{
> +	const int *table =3D NULL;
> +	int size =3D 0;
> +	int index =3D 0;
> +	int i;
> +
> +	switch (lmu_effect->lmu->id) {
> +	case LM3532:
> +		table =3D lm3532_ramp_table;
> +		size =3D ARRAY_SIZE(lm3532_ramp_table);
> +		break;
> +	case LM3631:
> +		table =3D lm3631_ramp_table;
> +		size =3D ARRAY_SIZE(lm3631_ramp_table);
> +		break;
> +	case LM3633:
> +	case LM3697:	/* LM3697 has same ramp table as LM3633 */
> +		table =3D lm3633_ramp_table;
> +		size =3D ARRAY_SIZE(lm3633_ramp_table);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (msec <=3D table[0]) {
> +		index =3D 0;
> +		goto out;

Just:
  return 0;

> +	}
> +
> +	if (msec >=3D table[size-1]) {
> +		index =3D size - 1;
> +		goto out;

Just:
  return index;

> +	}
> +
> +	/* Find appropriate register index from the table */
> +	for (i =3D 1; i < size; i++) {
> +		if (msec >=3D table[i-1] && msec < table[i]) {
> +			index =3D i - 1;
> +			goto out;

Same here.

> +		}
> +	}
> +
> +	return 0;
> +out:
> +	return index;

Remove this.

> +}
> +
> +static u8 ti_lmu_effect_get_time_index(struct ti_lmu_effect *lmu_eff=
ect,
> +				       int msec)
> +{
> +	u8 idx, offset;
> +
> +	/*
> +	 * Find appropriate register index around input time value
> +	 *
> +	 *      0 <=3D time <=3D 1000 : 16ms step
> +	 *   1000 <  time <=3D 9700 : 131ms step, base index is 61
> +	 */
> +
> +	msec =3D min_t(int, msec, LMU_EFFECT_MAX_TIME_PERIOD);
> +
> +	if (msec >=3D 0 && msec <=3D 1000) {
> +		idx =3D msec / 16;
> +		if (idx > 1)
> +			idx--;
> +		offset =3D 0;
> +	} else {
> +		idx =3D (msec - 1000) / 131;
> +		offset =3D 61;

What are 131 and 61? Sounds like magic, require #defines or at least a
comment.

<snip>

> +	if (lmu_effect) {
> +		cbfunc(lmu_effect, req_id, data);
> +		goto out;

This doesn't do anything. Just return from here.

> +	}

<snip>

> +out:
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ti_lmu_effect_request);

<snip>

> diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
> new file mode 100644
> index 0000000..e97d686
> --- /dev/null
> +++ b/drivers/mfd/ti-lmu.c
> @@ -0,0 +1,464 @@
> +/*
> + * TI LMU(Lighting Management Unit) Core Driver
> + *
> + * Copyright 2014 Texas Instruments
> + *
> + * Author: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Move this to the bottom of the header.

> + * LMU MFD supports LM3532, LM3631, LM3633, LM3695 and LM3697.
> + *
> + *   LM3532: backlight + light effect
> + *   LM3631: backlight + light effect + regulators
> + *   LM3633: backlight + light effect + LED indicators
> + *   LM3695: backlight
> + *   LM3697: backlight + light effect
> + *
> + * Those devices have common features as below.
> + *
> + *   - I2C interface for accessing device registers
> + *   - Hardware enable pin control
> + *   - Backlight brightness control with current settings
> + *   - Light effect driver for backlight and LED patterns
> + */

kernel.h?
module.h?

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-effect.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/slab.h>
> +
> +#define LMU_IMAX_OFFSET		6
> +

<snip>

> +static const struct resource lm3633_effect_resources[] =3D {
> +	{
> +		.name  =3D LM3633_EFFECT_BL0_RAMPUP,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(BL0_RAMPUP),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_BL0_RAMPDOWN,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(BL0_RAMPDN),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_BL1_RAMPUP,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(BL1_RAMPUP),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_BL1_RAMPDOWN,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(BL1_RAMPDN),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN_DELAY,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(DELAY),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN_HIGHTIME,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(HIGHTIME),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN_LOWTIME,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(LOWTIME),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN0_RAMPUP,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(PTN0_RAMPUP),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN0_RAMPDOWN,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(PTN0_RAMPDN),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN1_RAMPUP,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(PTN1_RAMPUP),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN1_RAMPDOWN,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(PTN1_RAMPDN),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN_LOWBRT,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(LOWBRT),
> +	},
> +	{
> +		.name  =3D LM3633_EFFECT_PTN_HIGHBRT,
> +		.flags =3D IORESOURCE_REG,
> +		.start =3D LM3633_EFFECT_REGISTER(HIGHBRT),
> +	},
> +};

Can you define a MACRO to do all of these as one liners?

<snip>

> +static int ti_lmu_parse_dt(struct device *dev, struct ti_lmu *lmu)
> +{

<snip>

> +	pdata->en_gpio =3D of_get_named_gpio(node, "ti,enable-gpio", 0);

There is a global DT property for this already.

> +static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_devi=
ce_id *id)
> +{

<snip>

> +	lmu->id =3D id->driver_data;
> +	switch (lmu->id) {
> +	case LM3532:
> +		lmu_regmap_config.max_register =3D LM3532_MAX_REGISTERS;
> +		break;
> +	case LM3631:
> +		lmu_regmap_config.max_register =3D LM3631_MAX_REGISTERS;
> +		break;
> +	case LM3633:
> +		lmu_regmap_config.max_register =3D LM3633_MAX_REGISTERS;
> +		break;
> +	case LM3695:
> +		lmu_regmap_config.max_register =3D LM3695_MAX_REGISTERS;
> +		break;
> +	case LM3697:
> +		lmu_regmap_config.max_register =3D LM3697_MAX_REGISTERS;
> +		break;
> +	default:
> +		break;
> +	}

As there are so many of these, it might be nicer to pull these out
into a seperate function.

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
