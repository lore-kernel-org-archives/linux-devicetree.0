From: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: 88pm88x: initialize 88pm886/88pm880 base
 support
Date: Fri, 26 Jun 2015 20:49:28 +0800
Message-ID: <20150626124928.GF32687@yizhang>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
 <1434098601-3498-3-git-send-email-yizhang@marvell.com>
 <20150625083248.GT15013@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150625083248.GT15013@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhouqiao-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 25, 2015 at 09:32:48AM +0100, Lee Jones wrote:
> On Fri, 12 Jun 2015, Yi Zhang wrote:
>=20
> > 88pm886 and 88pm880 are combo PMIC chip, which integrates
> > regulator, onkey, rtc, gpadc, charger, fuelgauge function;
> >=20
> > this patch add the basic support for them, adding related resource,=
 such as
> > interrupt, preparing for the client-device driver
> >=20
> > Signed-off-by: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/mfd/88pm880-table.c     | 173 ++++++++++++
> >  drivers/mfd/88pm886-table.c     | 173 ++++++++++++
> >  drivers/mfd/88pm88x-core.c      | 584 ++++++++++++++++++++++++++++=
++++++++++++
> >  drivers/mfd/88pm88x-i2c.c       | 167 ++++++++++++
> >  drivers/mfd/88pm88x-irq.c       | 171 ++++++++++++
> >  drivers/mfd/88pm88x.h           |  51 ++++
>=20
  Hi, Lee:

  Thanks very much for your patience on such a long patch, it is my
  fault, I will modify according to your precious comments and split
  them in the next version, thanks very much;

> I'm initially concerned that you aren't (re)using _any_ of the 88pm*
> files already in the subsystem.=20

  sorry for confusing you, this patch is for the 88pm886/88pm880, a new
  series PMIC which is very different from the previous chips(88pm8*) i=
n
  register mapping and function;
  after investigation, we tried to add this patch.
>=20
> >  drivers/mfd/Kconfig             |  12 +
> >  drivers/mfd/Makefile            |   3 +
> >  include/linux/mfd/88pm880-reg.h |  98 +++++++
> >  include/linux/mfd/88pm880.h     |  59 ++++
> >  include/linux/mfd/88pm886-reg.h |  59 ++++
> >  include/linux/mfd/88pm886.h     |  55 ++++
> >  include/linux/mfd/88pm88x-reg.h | 118 ++++++++
> >  include/linux/mfd/88pm88x.h     | 202 ++++++++++++++
> >  14 files changed, 1925 insertions(+)
>=20
> Sending 2k line patches doesn't make reviewing a particularly pleasan=
t
> experience.  Please divide it up into a properly separated set.  If
> you feel as though the set can't be split up, then you're probably
> coding it wrongly.

  thanks, I will modify;
>=20
> >  create mode 100644 drivers/mfd/88pm880-table.c
> >  create mode 100644 drivers/mfd/88pm886-table.c
> >  create mode 100644 drivers/mfd/88pm88x-core.c
> >  create mode 100644 drivers/mfd/88pm88x-i2c.c
> >  create mode 100644 drivers/mfd/88pm88x-irq.c
> >  create mode 100644 drivers/mfd/88pm88x.h
> >  create mode 100644 include/linux/mfd/88pm880-reg.h
> >  create mode 100644 include/linux/mfd/88pm880.h
> >  create mode 100644 include/linux/mfd/88pm886-reg.h
> >  create mode 100644 include/linux/mfd/88pm886.h
> >  create mode 100644 include/linux/mfd/88pm88x-reg.h
> >  create mode 100644 include/linux/mfd/88pm88x.h
> >=20
> > diff --git a/drivers/mfd/88pm880-table.c b/drivers/mfd/88pm880-tabl=
e.c
> > new file mode 100644
> > index 0000000..28ca860
> > --- /dev/null
> > +++ b/drivers/mfd/88pm880-table.c
> > @@ -0,0 +1,173 @@
> > +/*
> > + * Marvell 88PM880 specific setting
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>=20
> Tea Maker, Project Manger, CEO, Janitor?
>=20
> Or "Author: "

  My fault, thanks;
>=20
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +#include <linux/mfd/88pm88x.h>
> > +#include <linux/mfd/88pm880.h>
> > +#include <linux/mfd/88pm880-reg.h>
> > +#include <linux/mfd/88pm88x-reg.h>
> > +
> > +#include "88pm88x.h"
> > +
> > +#define PM880_BUCK_NAME		"88pm880-buck"
> > +#define PM880_LDO_NAME		"88pm880-ldo"
> > +
> > +const struct regmap_config pm880_base_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm880_power_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm880_gpadc_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm880_battery_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm880_test_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +static const struct resource buck_resources[] =3D {
> > +	{
> > +	.name =3D PM880_BUCK_NAME,
>=20
> Tabbing.
 =20
  Got it;
>=20
> > +	},
> > +};
> > +
> > +static const struct resource ldo_resources[] =3D {
> > +	{
> > +	.name =3D PM880_LDO_NAME,
>=20
> Tabbing.

  Yes;
>=20
> > +	},
> > +};
> > +
> > +const struct mfd_cell pm880_cell_devs[] =3D {
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck1a=
", 0),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck2"=
, 1),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck3"=
, 2),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck4"=
, 3),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck5"=
, 4),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck6"=
, 5),
> > +	CELL_DEV(PM880_BUCK_NAME, buck_resources, "marvell,88pm880-buck7"=
, 6),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo1", 7=
),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo2", 8=
),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo3", 9=
),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo4", 1=
0),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo5", 1=
1),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo6", 1=
2),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo7", 1=
3),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo8", 1=
4),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo9", 1=
5),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo10", =
16),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo11", =
17),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo12", =
18),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo13", =
19),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo14", =
20),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo15", =
21),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo16", =
22),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo17", =
23),
> > +	CELL_DEV(PM880_LDO_NAME, ldo_resources, "marvell,88pm880-ldo18", =
24),
> > +};
>=20
> You don't want an MFD for each regulator.  See the DT documentation
> for regulators.
 =20
  OK, I will change
>=20
> > +struct pmic_cell_info pm880_cell_info =3D {
> > +	.cells   =3D pm880_cell_devs,
> > +	.cell_nr =3D ARRAY_SIZE(pm880_cell_devs),
> > +};
>=20
> No need for this, please remove it.
  Yes, you are right, if I change to use one MFD for all of the
  regulators
>=20
> > +static const struct reg_default pm880_base_patch[] =3D {
> > +	{PM88X_WDOG, 0x1},	 /* disable watchdog */
>=20
> Pad it out like you did the others "0x01".
  OK;
>=20
> > +	{PM88X_AON_CTRL2, 0x2a},  /* output 32kHZ from XO */
>=20
> kHz
=20
  Thanks very much for pointing it out; got it;
>=20
> > +	{PM88X_BK_OSC_CTRL1, 0x0f}, /* OSC_FREERUN =3D 1, to lock FLL */
>=20
> Don't put bit names in comments -- you should define them instead.

  OK
>=20
> > +	{PM88X_LOWPOWER2, 0x20}, /* XO_LJ =3D 1, enable low jitter for 32=
kHZ */
>=20
> Remove the bit name -- second part is fine.
  Yes, you are right;
>=20
> > +	/* enable LPM for internal reference group in sleep */
>=20
> I see you're not a fan of using capital letter to start a sentence?
  ..Yes, I just feel capital letter means "see me, I am important.."
  OK, I will change to use it to start a sentence
>=20
> > +	{PM88X_LOWPOWER4, 0xc0},
>=20
> No comment?
  I will add it;
>=20
> > +	{PM88X_BK_OSC_CTRL3, 0xc0}, /* set the duty cycle of charger DC/D=
C to max */
> > +};
>=20
> This would be easier to read if you lined it up:
>=20
> 	{PM88X_WDOG,		0x01}, /* disable watchdog */
> 	{PM88X_AON_CTRL2,	0x2a}, /* output 32kHZ from XO */
> 	{PM88X_BK_OSC_CTRL1,	0x0f}, /* OSC_FREERUN =3D 1, to lock FLL */
> 	{PM88X_LOWPOWER2,	0x20}, /* XO_LJ =3D 1, enable low jitter for 32kHZ=
 */
> 	/* enable LPM for internal reference group in sleep */
> 	{PM88X_LOWPOWER4,	0xc0},
> 	{PM88X_BK_OSC_CTRL3,	0xc0}, /* set the duty cycle of charger DC/DC t=
o max */
>=20
> ... don't you think?
>=20
> I also think the values should be defined.  If you disagree, at the
> _very least_ please sharpen up the comments.

   I will modify them, agree with you, macro is better
>=20
> > +static const struct reg_default pm880_power_patch[] =3D {
> > +};
>=20
> What's the point of this?
 =20
   I just leave it here to get ready for the next patch, I got your
   point, I should add it when I really use it.
   thanks;
>=20
> > +static const struct reg_default pm880_gpadc_patch[] =3D {
> > +	{PM88X_GPADC_CONFIG6, 0x03}, /* enable non-stop mode */
> > +};
>=20
> I personally prefer spaces after the first and before the second curl=
y
> bracket.

  Got it;
>=20
> > +static const struct reg_default pm880_battery_patch[] =3D {
> > +	{PM88X_CHGBK_CONFIG6, 0xe1},
> > +};
>=20
> As above.
   Yes;
>=20
> > +static const struct reg_default pm880_test_patch[] =3D {
> > +};
>=20
> Why do you have an empty struct const?
  As for the above, I will remove it in this patch
>=20
> > +/* 88pm880 chip itself related */
>=20
> I have no idea what this means?
  Sorry for confusing you, I mean the following setting tries to cover
  the change related to chip itself, for the board specific requirement=
,
  it should not be here;
  I will modify this comments, thanks for pointing this out;
>=20
> > +int pm880_apply_patch(struct pm88x_chip *chip)
> > +{
> > +	int ret, size;
> > +
> > +	if (!chip || !chip->base_regmap || !chip->power_regmap ||
> > +	    !chip->gpadc_regmap || !chip->battery_regmap ||
> > +	    !chip->test_regmap)
> > +		return -EINVAL;
>=20
> You already checked for this in pm88x_post_init_chip().

  OK, I will remove;
>=20
> > +	size =3D ARRAY_SIZE(pm880_base_patch);
> > +	if (size =3D=3D 0)
> > +		goto power;
> > +	ret =3D regmap_register_patch(chip->base_regmap, pm880_base_patch=
, size);
> > +	if (ret < 0)
>=20
> I assume any non-zero return value is bad.  If so, please change all
> of these too "if (ret)".

  Yes, you are right, I will change
>=20
> > +		return ret;
> > +
> > +power:
> > +	size =3D ARRAY_SIZE(pm880_power_patch);
> > +	if (size =3D=3D 0)
> > +		goto gpadc;
> > +	ret =3D regmap_register_patch(chip->power_regmap, pm880_power_pat=
ch, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +gpadc:
> > +	size =3D ARRAY_SIZE(pm880_gpadc_patch);
> > +	if (size =3D=3D 0)
> > +		goto battery;
> > +	ret =3D regmap_register_patch(chip->gpadc_regmap, pm880_gpadc_pat=
ch, size);
> > +	if (ret < 0)
> > +		return ret;
>=20
> '\n'
   Yes;
>=20
> > +battery:
> > +	size =3D ARRAY_SIZE(pm880_battery_patch);
> > +	if (size =3D=3D 0)
> > +		goto test;
> > +	ret =3D regmap_register_patch(chip->battery_regmap, pm880_battery=
_patch, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +test:
> > +	size =3D ARRAY_SIZE(pm880_test_patch);
> > +	if (size =3D=3D 0)
> > +		goto out;
> > +	ret =3D regmap_register_patch(chip->test_regmap, pm880_test_patch=
, size);
> > +	if (ret < 0)
> > +		return ret;
>=20
> '\n'

   Yes;
>=20
> > +out:
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pm880_apply_patch);
> > diff --git a/drivers/mfd/88pm886-table.c b/drivers/mfd/88pm886-tabl=
e.c
> > new file mode 100644
> > index 0000000..897ee82
> > --- /dev/null
> > +++ b/drivers/mfd/88pm886-table.c
> > @@ -0,0 +1,173 @@
> > +/*
> > + * Marvell 88PM886 specific setting
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +#include <linux/mfd/88pm88x.h>
> > +#include <linux/mfd/88pm886.h>
> > +#include <linux/mfd/88pm886-reg.h>
> > +#include <linux/mfd/88pm88x-reg.h>
> > +
> > +#include "88pm88x.h"
> > +
> > +#define PM886_BUCK_NAME		"88pm886-buck"
> > +#define PM886_LDO_NAME		"88pm886-ldo"
> > +
> > +const struct regmap_config pm886_base_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm886_power_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm886_gpadc_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm886_battery_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +const struct regmap_config pm886_test_i2c_regmap =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xfe,
> > +};
> > +
> > +static const struct resource buck_resources[] =3D {
> > +	{
> > +	.name =3D PM886_BUCK_NAME,
> > +	},
> > +};
> > +
> > +static const struct resource ldo_resources[] =3D {
> > +	{
> > +	.name =3D PM886_LDO_NAME,
> > +	},
> > +};
> > +
> > +const struct mfd_cell pm886_cell_devs[] =3D {
> > +	CELL_DEV(PM886_BUCK_NAME, buck_resources, "marvell,88pm886-buck1"=
, 0),
> > +	CELL_DEV(PM886_BUCK_NAME, buck_resources, "marvell,88pm886-buck2"=
, 1),
> > +	CELL_DEV(PM886_BUCK_NAME, buck_resources, "marvell,88pm886-buck3"=
, 2),
> > +	CELL_DEV(PM886_BUCK_NAME, buck_resources, "marvell,88pm886-buck4"=
, 3),
> > +	CELL_DEV(PM886_BUCK_NAME, buck_resources, "marvell,88pm886-buck5"=
, 4),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo1", 5=
),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo2", 6=
),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo3", 7=
),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo4", 8=
),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo5", 9=
),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo6", 1=
0),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo7", 1=
1),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo8", 1=
2),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo9", 1=
3),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo10", =
14),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo11", =
15),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo12", =
16),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo13", =
17),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo14", =
18),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo15", =
19),
> > +	CELL_DEV(PM886_LDO_NAME, ldo_resources, "marvell,88pm886-ldo16", =
20),
> > +};
>=20
> You don't want an MFD for each regulator.  See the DT documentation
> for regulators.

  Yes;
>=20
> > +struct pmic_cell_info pm886_cell_info =3D {
> > +	.cells   =3D pm886_cell_devs,
> > +	.cell_nr =3D ARRAY_SIZE(pm886_cell_devs),
> > +};
>=20
> No need for this, please remove it.
  Yes;
>=20
> > +static const struct reg_default pm886_base_patch[] =3D {
> > +	{PM88X_WDOG, 0x1},	 /* disable watchdog */
> > +	{PM88X_GPIO_CTRL1, 0x40}, /* gpio1: dvc    , gpio0: input   */
> > +	{PM88X_GPIO_CTRL2, 0x00}, /*               , gpio2: input   */
> > +	{PM88X_GPIO_CTRL3, 0x44}, /* dvc2          , dvc1           */
> > +	{PM88X_GPIO_CTRL4, 0x00}, /* gpio5v_1:input, gpio5v_2: input*/
> > +	{PM88X_AON_CTRL2, 0x2a},  /* output 32kHZ from XO */
> > +	{PM88X_BK_OSC_CTRL1, 0x0f}, /* OSC_FREERUN =3D 1, to lock FLL */
> > +	{PM88X_LOWPOWER2, 0x20}, /* XO_LJ =3D 1, enable low jitter for 32=
kHZ */
> > +	/* enable LPM for internal reference group in sleep */
> > +	{PM88X_LOWPOWER4, 0xc0},
> > +	{PM88X_BK_OSC_CTRL3, 0xc0}, /* set the duty cycle of charger DC/D=
C to max */
> > +};
> > +
> > +static const struct reg_default pm886_power_patch[] =3D {
> > +};
> > +
> > +static const struct reg_default pm886_gpadc_patch[] =3D {
> > +	{PM88X_GPADC_CONFIG6, 0x03}, /* enable non-stop mode */
> > +};
> > +
> > +static const struct reg_default pm886_battery_patch[] =3D {
> > +	{PM88X_CHGBK_CONFIG6, 0xe1},
> > +};
> > +
> > +static const struct reg_default pm886_test_patch[] =3D {
> > +};
> > +
> > +/* 88pm886 chip itself related */
> > +int pm886_apply_patch(struct pm88x_chip *chip)
> > +{
> > +	int ret, size;
> > +
> > +	if (!chip || !chip->base_regmap || !chip->power_regmap ||
> > +	    !chip->gpadc_regmap || !chip->battery_regmap ||
> > +	    !chip->test_regmap)
> > +		return -EINVAL;
>=20
> You already checked for this in pm88x_post_init_chip().
  Yes;
>=20
> > +	size =3D ARRAY_SIZE(pm886_base_patch);
> > +	if (size =3D=3D 0)
> > +		goto power;
> > +	ret =3D regmap_register_patch(chip->base_regmap, pm886_base_patch=
, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +power:
> > +	size =3D ARRAY_SIZE(pm886_power_patch);
> > +	if (size =3D=3D 0)
> > +		goto gpadc;
> > +	ret =3D regmap_register_patch(chip->power_regmap, pm886_power_pat=
ch, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +gpadc:
> > +	size =3D ARRAY_SIZE(pm886_gpadc_patch);
> > +	if (size =3D=3D 0)
> > +		goto battery;
> > +	ret =3D regmap_register_patch(chip->gpadc_regmap, pm886_gpadc_pat=
ch, size);
> > +	if (ret < 0)
> > +		return ret;
> > +battery:
> > +	size =3D ARRAY_SIZE(pm886_battery_patch);
> > +	if (size =3D=3D 0)
> > +		goto test;
> > +	ret =3D regmap_register_patch(chip->battery_regmap, pm886_battery=
_patch, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +test:
> > +	size =3D ARRAY_SIZE(pm886_test_patch);
> > +	if (size =3D=3D 0)
> > +		goto out;
> > +	ret =3D regmap_register_patch(chip->test_regmap, pm886_test_patch=
, size);
> > +	if (ret < 0)
> > +		return ret;
> > +out:
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pm886_apply_patch);
>=20
> A lot of this code looks identical to the previous *-table.c file and
> a bunch of it is duplicated line from line.  Please amalgamate them
> and find a way to reduce the amount of lines.  I can think of several
> ways this can be done.=20

  OK, I will modify in next patchset;
>=20
> > diff --git a/drivers/mfd/88pm88x-core.c b/drivers/mfd/88pm88x-core.=
c
> > new file mode 100644
> > index 0000000..343e0a0
> > --- /dev/null
> > +++ b/drivers/mfd/88pm88x-core.c
> > @@ -0,0 +1,584 @@
> > +/*
> > + * Base driver for Marvell 88PM886/88PM880 PMIC
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/irq.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/88pm88x.h>
> > +#include <linux/mfd/88pm886.h>
> > +#include <linux/mfd/88pm880.h>
> > +#include <linux/regulator/machine.h>
> > +
> > +#include "88pm88x.h"
> > +
> > +#define PM88X_POWER_UP_LOG		(0x17)
> > +#define PM88X_POWER_DOWN_LOG1		(0xe5)
> > +#define PM88X_POWER_DOWN_LOG2		(0xe6)
> > +#define PM88X_SW_PDOWN			(1 << 5)
> > +
> > +static const struct resource onkey_resources[] =3D {
> > +	CELL_IRQ_RESOURCE(PM88X_ONKEY_NAME, PM88X_IRQ_ONKEY),
> > +};
> > +
> > +static const struct resource rtc_resources[] =3D {
> > +	CELL_IRQ_RESOURCE(PM88X_RTC_NAME, PM88X_IRQ_RTC),
> > +};
> > +
> > +static const struct resource charger_resources[] =3D {
> > +	CELL_IRQ_RESOURCE("88pm88x-chg-fail", PM88X_IRQ_CHG_FAIL),
> > +	CELL_IRQ_RESOURCE("88pm88x-chg-done", PM88X_IRQ_CHG_DONE),
> > +	CELL_IRQ_RESOURCE("88pm88x-chg-good", PM88X_IRQ_CHG_GOOD),
> > +};
> > +
> > +static const struct resource battery_resources[] =3D {
> > +	CELL_IRQ_RESOURCE("88pm88x-bat-cc", PM88X_IRQ_CC),
> > +	CELL_IRQ_RESOURCE("88pm88x-bat-volt", PM88X_IRQ_VBAT),
> > +	CELL_IRQ_RESOURCE("88pm88x-bat-detect", PM88X_IRQ_BAT_DET),
> > +};
> > +
> > +static const struct resource headset_resources[] =3D {
> > +	CELL_IRQ_RESOURCE("88pm88x-headset-det", PM88X_IRQ_HS_DET),
> > +	CELL_IRQ_RESOURCE("88pm88x-mic-det", PM88X_IRQ_MIC_DET),
> > +};
> > +
> > +static const struct resource vbus_resources[] =3D {
> > +	CELL_IRQ_RESOURCE("88pm88x-vbus-det", PM88X_IRQ_VBUS),
> > +	CELL_IRQ_RESOURCE("88pm88x-gpadc0", PM88X_IRQ_GPADC0),
> > +	CELL_IRQ_RESOURCE("88pm88x-gpadc1", PM88X_IRQ_GPADC1),
> > +	CELL_IRQ_RESOURCE("88pm88x-gpadc2", PM88X_IRQ_GPADC2),
> > +	CELL_IRQ_RESOURCE("88pm88x-gpadc3", PM88X_IRQ_GPADC3),
> > +	CELL_IRQ_RESOURCE("88pm88x-otg-fail", PM88X_IRQ_OTG_FAIL),
> > +};
> > +
> > +static const struct resource leds_resources[] =3D {
> > +	CELL_IRQ_RESOURCE("88pm88x-cfd-fail", PM88X_IRQ_CFD_FAIL),
> > +};
> > +
> > +static const struct resource dvc_resources[] =3D {
> > +	{
> > +	.name =3D PM88X_DVC_NAME,
> > +	},
> > +};
> > +
> > +static const struct resource rgb_resources[] =3D {
> > +	{
> > +	.name =3D PM88X_RGB_NAME,
> > +	},
> > +};
> > +
> > +static const struct resource gpadc_resources[] =3D {
> > +	{
> > +	.name =3D PM88X_GPADC_NAME,
> > +	},
> > +};
>=20
> Tabbing for all of the above.

  Sure, thanks;
>=20
> In fact, for one line struct entries, I would prefer:
>=20
>    { .name =3D PM88X_GPADC_NAME },
>=20
> > +static const struct mfd_cell common_cell_devs[] =3D {
> > +	CELL_DEV(PM88X_RTC_NAME, rtc_resources, "marvell,88pm88x-rtc", -1=
),
> > +	CELL_DEV(PM88X_ONKEY_NAME, onkey_resources, "marvell,88pm88x-onke=
y", -1),
> > +	CELL_DEV(PM88X_CHARGER_NAME, charger_resources, "marvell,88pm88x-=
charger", -1),
> > +	CELL_DEV(PM88X_BATTERY_NAME, battery_resources, "marvell,88pm88x-=
battery", -1),
> > +	CELL_DEV(PM88X_HEADSET_NAME, headset_resources, "marvell,88pm88x-=
headset", -1),
> > +	CELL_DEV(PM88X_VBUS_NAME, vbus_resources, "marvell,88pm88x-vbus",=
 -1),
> > +	CELL_DEV(PM88X_CFD_NAME, leds_resources, "marvell,88pm88x-leds", =
PM88X_FLASH_LED),
> > +	CELL_DEV(PM88X_CFD_NAME, leds_resources, "marvell,88pm88x-leds", =
PM88X_TORCH_LED),
> > +	CELL_DEV(PM88X_DVC_NAME, dvc_resources, "marvell,88pm88x-dvc", -1=
),
> > +	CELL_DEV(PM88X_RGB_NAME, rgb_resources, "marvell,88pm88x-rgb0", P=
M88X_RGB_LED0),
> > +	CELL_DEV(PM88X_RGB_NAME, rgb_resources, "marvell,88pm88x-rgb1", P=
M88X_RGB_LED1),
> > +	CELL_DEV(PM88X_RGB_NAME, rgb_resources, "marvell,88pm88x-rgb2", P=
M88X_RGB_LED2),
>=20
> This isn't how it works.  You should have one LED entry here, then le=
t
> the LED driver take care of all this stuff.

  OK, I will modify it;
>=20
> > +	CELL_DEV(PM88X_GPADC_NAME, gpadc_resources, "marvell,88pm88x-gpad=
c", -1),
> > +};
>=20
>=20
> > +const struct of_device_id pm88x_of_match[] =3D {
> > +	{ .compatible =3D "marvell,88pm886", .data =3D (void *)PM886 },
> > +	{ .compatible =3D "marvell,88pm880", .data =3D (void *)PM880 },
> > +	{},
> > +};
> > +
> > +struct pm88x_chip *pm88x_init_chip(struct i2c_client *client)
>=20
> Why is this in a seperate file to the one it's called from?  I
> suggest you move it into the *-i2c.c file.

  OK, I'll do it; yes, it can be there;
>=20
> > +{
> > +	struct pm88x_chip *chip;
> > +
> > +	chip =3D devm_kzalloc(&client->dev, sizeof(struct pm88x_chip), GF=
P_KERNEL);
>=20
> Calling this 'chip' is confusing, as it has different connotations
> depending on the subsystem.
>=20
> ddata (for device data) or priv for (private) is more common.

  So thank you; I prefer ddata;
>=20
> > +	if (!chip)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	chip->client =3D client;
> > +	chip->irq =3D client->irq;
> > +	chip->dev =3D &client->dev;
>=20
> Why are you storing 'client' AND 'dev'?  Do you use 'client' directly=
?
> If not, ditch it.  If you do, then just store 'client' and extract
> 'client->dev' when you require it.

  OK, I am in the second case, I will modify it;
>=20
> > +	chip->ldo_page_addr =3D client->addr + 1;
> > +	chip->power_page_addr =3D client->addr + 1;
> > +	chip->gpadc_page_addr =3D client->addr + 2;
> > +	chip->battery_page_addr =3D client->addr + 3;
> > +	chip->buck_page_addr =3D client->addr + 4;
> > +	chip->test_page_addr =3D client->addr + 7;
>=20
> I have no idea what's going on here, but it's almost certainly not
> correct.  Instead of separating these out per device have a base
> address and create DEFINES for each of them.

  it is because this PMIC has several i2c address, each has different
  function, the offset vesus the client->addr is fixed, the client->add=
r
  is 0x30 from device tree, then the gpadc_page_addr is 0x32, that is
  why I use client->addr + 2;

  you mean the DEFINES are better?

>=20
> > +	dev_set_drvdata(chip->dev, chip);
> > +	i2c_set_clientdata(chip->client, chip);
>=20
> Why do you have both of these?

   I think i2c_set_clientdata() is enough for my case, thanks;
>=20
> > +	device_init_wakeup(&client->dev, 1);
> > +
> > +	return chip;
>=20
> You're wearing a belt and 2 pairs of braces here.  You just stored
> 'chip' into the device's private data area, why are you returning it
> too?=20

  my fault, I will change
>=20
> > +}
> > +
> > +int pm88x_parse_dt(struct device_node *np, struct pm88x_chip *chip=
)
> > +{
> > +	if (!chip)
> > +		return -EINVAL;
> > +
> > +	chip->irq_mode =3D
> > +		!of_property_read_bool(np, "marvell,88pm88x-irq-write-clear");
>=20
> A new function for just one line?  Just move it into probe()

   I planned to add this function in case more properties are needed,
   OK, I will move to probe()
>=20
> > +	return 0;
> > +}
> > +
> > +
>=20
> Superfluous '\n'.
   I will remove;
>=20
> > +static void parse_powerup_down_log(struct pm88x_chip *chip)
> > +{
> > +	int powerup, powerdown1, powerdown2, bit;
> > +	int powerup_bits, powerdown1_bits, powerdown2_bits;
> > +	static const char * const powerup_name[] =3D {
> > +		"ONKEY_WAKEUP	",
> > +		"CHG_WAKEUP	",
> > +		"EXTON_WAKEUP	",
> > +		"SMPL_WAKEUP	",
> > +		"ALARM_WAKEUP	",
> > +		"FAULT_WAKEUP	",
> > +		"BAT_WAKEUP	",
> > +		"WLCHG_WAKEUP	",
> > +	};
> > +	static const char * const powerdown1_name[] =3D {
> > +		"OVER_TEMP ",
> > +		"UV_VANA5  ",
> > +		"SW_PDOWN  ",
> > +		"FL_ALARM  ",
> > +		"WD        ",
> > +		"LONG_ONKEY",
> > +		"OV_VSYS   ",
> > +		"RTC_RESET "
> > +	};
> > +	static const char * const powerdown2_name[] =3D {
> > +		"HYB_DONE   ",
> > +		"UV_VBAT    ",
> > +		"HW_RESET2  ",
> > +		"PGOOD_PDOWN",
> > +		"LONKEY_RTC ",
> > +		"HW_RESET1  ",
> > +	};
> > +
> > +	regmap_read(chip->base_regmap, PM88X_POWER_UP_LOG, &powerup);
> > +	regmap_read(chip->base_regmap, PM88X_POWER_DOWN_LOG1, &powerdown1=
);
> > +	regmap_read(chip->base_regmap, PM88X_POWER_DOWN_LOG2, &powerdown2=
);
> > +
> > +	/*
> > +	 * mask reserved bits
> > +	 *
> > +	 * note: HYB_DONE and HW_RESET1 are kept,
> > +	 *       but should not be considered as power down events
> > +	 */
> > +	switch (chip->type) {
> > +	case PM886:
> > +		powerup &=3D 0x7f;
> > +		powerdown2 &=3D 0x1f;
> > +		powerup_bits =3D 7;
> > +		powerdown1_bits =3D 8;
> > +		powerdown2_bits =3D 5;
> > +		break;
> > +	case PM880:
> > +		powerdown2 &=3D 0x3f;
> > +		powerup_bits =3D 8;
> > +		powerdown1_bits =3D 8;
> > +		powerdown2_bits =3D 6;
> > +		break;
> > +	default:
> > +		return;
> > +	}
> > +
> > +	/* keep globals for external usage */
> > +	chip->powerup =3D powerup;
> > +	chip->powerdown1 =3D powerdown1;
> > +	chip->powerdown2 =3D powerdown2;
> > +
> > +	/* power up log */
> > +	dev_info(chip->dev, "powerup log 0x%x: 0x%x\n",
> > +		 PM88X_POWER_UP_LOG, powerup);
> > +	dev_info(chip->dev, " ----------------------------\n");
> > +	dev_info(chip->dev, "|  name(power up) |  status  |\n");
> > +	dev_info(chip->dev, "|-----------------|----------|\n");
> > +	for (bit =3D 0; bit < powerup_bits; bit++)
> > +		dev_info(chip->dev, "|  %s  |    %x     |\n",
> > +			powerup_name[bit], (powerup >> bit) & 1);
> > +	dev_info(chip->dev, " ----------------------------\n");
> > +
> > +	/* power down log1 */
> > +	dev_info(chip->dev, "PowerDW Log1 0x%x: 0x%x\n",
> > +		PM88X_POWER_DOWN_LOG1, powerdown1);
> > +	dev_info(chip->dev, " -------------------------------\n");
> > +	dev_info(chip->dev, "| name(power down1)  |  status  |\n");
> > +	dev_info(chip->dev, "|--------------------|----------|\n");
> > +	for (bit =3D 0; bit < powerdown1_bits; bit++)
> > +		dev_info(chip->dev, "|    %s      |    %x     |\n",
> > +			powerdown1_name[bit], (powerdown1 >> bit) & 1);
> > +	dev_info(chip->dev, " -------------------------------\n");
> > +
> > +	/* power down log2 */
> > +	dev_info(chip->dev, "PowerDW Log2 0x%x: 0x%x\n",
> > +		PM88X_POWER_DOWN_LOG2, powerdown2);
> > +	dev_info(chip->dev, " -------------------------------\n");
> > +	dev_info(chip->dev, "|  name(power down2) |  status  |\n");
> > +	dev_info(chip->dev, "|--------------------|----------|\n");
> > +	for (bit =3D 0; bit < powerdown2_bits; bit++)
> > +		dev_info(chip->dev, "|    %s     |    %x     |\n",
> > +			powerdown2_name[bit], (powerdown2 >> bit) & 1);
> > +	dev_info(chip->dev, " -------------------------------\n");
> > +
> > +	/* write to clear power down log */
> > +	regmap_write(chip->base_regmap, PM88X_POWER_DOWN_LOG1, 0xff);
> > +	regmap_write(chip->base_regmap, PM88X_POWER_DOWN_LOG2, 0xff);
> > +}
> > +
> > +static const char *chip_stepping_to_string(unsigned int id)
> > +{
> > +	switch (id) {
> > +	case 0xa1:
> > +		return "88pm886 A1";
> > +	case 0xb1:
> > +		return "88pm880 A1";
> > +	default:
> > +		return "Unknown";
> > +	}
> > +}
> > +
> > +int pm88x_post_init_chip(struct pm88x_chip *chip)
> > +{
> > +	int ret;
> > +	unsigned int val;
> > +
> > +	if (!chip || !chip->base_regmap || !chip->power_regmap ||
> > +	    !chip->gpadc_regmap || !chip->battery_regmap)
> > +		return -EINVAL;
> > +
> > +	/* save chip stepping */
> > +	ret =3D regmap_read(chip->base_regmap, PM88X_ID_REG, &val);
> > +	if (ret < 0) {
> > +		dev_err(chip->dev, "Failed to read chip ID: %d\n", ret);
> > +		return ret;
> > +	}
> > +	chip->chip_id =3D val;
> > +
> > +	dev_info(chip->dev, "PM88X chip ID =3D 0x%x(%s)\n", val,
> > +			chip_stepping_to_string(chip->chip_id));
> > +
> > +	/* read before alarm wake up bit before initialize interrupt */
> > +	ret =3D regmap_read(chip->base_regmap, PM88X_RTC_ALARM_CTRL1, &va=
l);
> > +	if (ret < 0) {
> > +		dev_err(chip->dev, "Failed to read RTC register: %d\n", ret);
> > +		return ret;
> > +	}
> > +	chip->rtc_wakeup =3D !!(val & PM88X_ALARM_WAKEUP);
> > +
> > +	parse_powerup_down_log(chip);
> > +
> > +	return 0;
> > +}
> > +
> > +int pm88x_init_pages(struct pm88x_chip *chip)
> > +{
> > +	struct i2c_client *client =3D chip->client;
> > +	const struct regmap_config *base_regmap_config;
> > +	const struct regmap_config *power_regmap_config;
> > +	const struct regmap_config *gpadc_regmap_config;
> > +	const struct regmap_config *battery_regmap_config;
> > +	const struct regmap_config *test_regmap_config;
> > +	int ret =3D 0;
> > +
> > +	if (!chip || !chip->power_page_addr ||
> > +	    !chip->gpadc_page_addr || !chip->battery_page_addr)
> > +		return -ENODEV;
> > +
> > +	chip->type =3D pm88x_of_get_type(&client->dev);
> > +	switch (chip->type) {
> > +	case PM886:
> > +		base_regmap_config =3D &pm886_base_i2c_regmap;
> > +		power_regmap_config =3D &pm886_power_i2c_regmap;
> > +		gpadc_regmap_config =3D &pm886_gpadc_i2c_regmap;
> > +		battery_regmap_config =3D &pm886_battery_i2c_regmap;
> > +		test_regmap_config =3D &pm886_test_i2c_regmap;
> > +		break;
> > +	case PM880:
> > +		base_regmap_config =3D &pm880_base_i2c_regmap;
> > +		power_regmap_config =3D &pm880_power_i2c_regmap;
> > +		gpadc_regmap_config =3D &pm880_gpadc_i2c_regmap;
> > +		battery_regmap_config =3D &pm880_battery_i2c_regmap;
> > +		test_regmap_config =3D &pm880_test_i2c_regmap;
> > +		break;
> > +	default:
> > +		return -ENODEV;
>=20
> You could probably do with an error message here.
  I got your point, good suggestion, thank you;
>=20
> > +	}
> > +
> > +	/* base page */
> > +	chip->base_regmap =3D devm_regmap_init_i2c(client, base_regmap_co=
nfig);
> > +	if (IS_ERR(chip->base_regmap)) {
> > +		dev_err(chip->dev, "Failed to init base_regmap: %d\n", ret);
> > +		ret =3D PTR_ERR(chip->base_regmap);
> > +		goto out;
> > +	}
> > +
> > +	/* power page */
> > +	chip->power_page =3D i2c_new_dummy(client->adapter, chip->power_p=
age_addr);
> > +	if (!chip->power_page) {
> > +		dev_err(chip->dev, "Failed to new power_page: %d\n", ret);
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	chip->power_regmap =3D devm_regmap_init_i2c(chip->power_page,
> > +						  power_regmap_config);
> > +	if (IS_ERR(chip->power_regmap)) {
> > +		dev_err(chip->dev, "Failed to init power_regmap: %d\n", ret);
> > +		ret =3D PTR_ERR(chip->power_regmap);
> > +		goto out;
> > +	}
> > +
> > +	/* gpadc page */
> > +	chip->gpadc_page =3D i2c_new_dummy(client->adapter, chip->gpadc_p=
age_addr);
> > +	if (!chip->gpadc_page) {
> > +		dev_err(chip->dev, "Failed to new gpadc_page: %d\n", ret);
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	chip->gpadc_regmap =3D devm_regmap_init_i2c(chip->gpadc_page,
> > +						  gpadc_regmap_config);
> > +	if (IS_ERR(chip->gpadc_regmap)) {
> > +		dev_err(chip->dev, "Failed to init gpadc_regmap: %d\n", ret);
> > +		ret =3D PTR_ERR(chip->gpadc_regmap);
> > +		goto out;
> > +	}
> > +
> > +	/* battery page */
> > +	chip->battery_page =3D i2c_new_dummy(client->adapter, chip->batte=
ry_page_addr);
> > +	if (!chip->battery_page) {
> > +		dev_err(chip->dev, "Failed to new gpadc_page: %d\n", ret);
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	chip->battery_regmap =3D devm_regmap_init_i2c(chip->battery_page,
> > +						  battery_regmap_config);
> > +	if (IS_ERR(chip->battery_regmap)) {
> > +		dev_err(chip->dev, "Failed to init battery_regmap: %d\n", ret);
> > +		ret =3D PTR_ERR(chip->battery_regmap);
> > +		goto out;
> > +	}
> > +
> > +	/* test page */
> > +	chip->test_page =3D i2c_new_dummy(client->adapter, chip->test_pag=
e_addr);
> > +	if (!chip->test_page) {
> > +		dev_err(chip->dev, "Failed to new test_page: %d\n", ret);
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	chip->test_regmap =3D devm_regmap_init_i2c(chip->test_page,
> > +						 test_regmap_config);
> > +	if (IS_ERR(chip->test_regmap)) {
> > +		dev_err(chip->dev, "Failed to init test_regmap: %d\n", ret);
> > +		ret =3D PTR_ERR(chip->test_regmap);
> > +		goto out;
> > +	}
>=20
> There's a lot of duplicated code here.  You can save quite a few line=
s
> if you thought about it I'm sure.

  I will try to fix it in next patchset, thanks for your reminder;
  I am ashamed about this=20
>=20
> > +	chip->type =3D pm88x_of_get_type(&client->dev);
> > +	switch (chip->type) {
> > +	case PM886:
> > +		/* ldo page */
> > +		chip->ldo_page =3D chip->power_page;
> > +		chip->ldo_regmap =3D chip->power_regmap;
> > +		/* buck page */
> > +		chip->buck_regmap =3D chip->power_regmap;
> > +		break;
> > +	case PM880:
> > +		/* ldo page */
> > +		chip->ldo_page =3D chip->power_page;
> > +		chip->ldo_regmap =3D chip->power_regmap;
> > +
> > +		/* buck page */
> > +		chip->buck_page =3D i2c_new_dummy(client->adapter,
> > +						chip->buck_page_addr);
> > +		if (!chip->buck_page) {
> > +			dev_err(chip->dev, "Failed to new buck_page: %d\n", ret);
> > +			ret =3D -ENODEV;
> > +			goto out;
> > +		}
> > +		chip->buck_regmap =3D devm_regmap_init_i2c(chip->buck_page,
> > +							 power_regmap_config);
> > +		if (IS_ERR(chip->buck_regmap)) {
> > +			dev_err(chip->dev, "Failed to init buck_regmap: %d\n", ret);
> > +			ret =3D PTR_ERR(chip->buck_regmap);
> > +			goto out;
> > +		}
> > +
> > +		break;
> > +	default:
> > +		ret =3D -EINVAL;
>=20
> Firstly, this probably won't happen, as the first switch() succeeded.
> Secondly, you are returning a different error value, why?  Thirdly,
> you probably want an error message here.

  for the first question, you are right, I will re-org this function to
  make it clearer;
  for the second question, my fault, I should write -ENODEV here;
  for third, definitly an error message is right, thank you;
>=20
> > +		break;
> > +	}
> > +out:
> > +	return ret;
> > +}
> > +
> > +void pm800_exit_pages(struct pm88x_chip *chip)
> > +{
> > +	if (!chip)
> > +		return;
> > +
> > +	if (chip->ldo_page)
> > +		i2c_unregister_device(chip->ldo_page);
> > +	if (chip->gpadc_page)
> > +		i2c_unregister_device(chip->gpadc_page);
> > +	if (chip->test_page)
> > +		i2c_unregister_device(chip->test_page);
>=20
> '\n'
   Yes;
>=20
> > +	/* no need to unregister ldo_page */
> > +	switch (chip->type) {
> > +	case PM886:
> > +		break;
> > +	case PM880:
> > +		if (chip->buck_page)
> > +			i2c_unregister_device(chip->buck_page);
> > +		break;
> > +	default:
> > +		break;
> > +	}
>=20
> No need for this big switch().  Just do:
=20
  Good, it's much cleaner than mine, thank you;
>=20
> 	if (chip->buck_page)
> 		i2c_unregister_device(chip->buck_page);
>=20
> > +}
> > +
> > +int pm88x_init_subdev(struct pm88x_chip *chip)
> > +{
> > +	int ret;
>=20
> '\n'
  OK;
>=20
> This will raise a Checkpatch error.  Did you run this set though
> checkpatch.pl?

  I am sorry to say it's my fault, I promise it will not happen again.
>=20
> > +	if (!chip)
> > +		return -EINVAL;
>=20
> I'm pretty sure you can't get here if !chip.

  Yes, I will change
>=20
> > +	ret =3D mfd_add_devices(chip->dev, 0, common_cell_devs,
>=20
> What does 0 mean?

  I should use -1 here, though it _seems_ works..
>=20
> > +			      ARRAY_SIZE(common_cell_devs), NULL, 0,
> > +			      regmap_irq_get_domain(chip->irq_data));
> > +	if (ret < 0)
>=20
> if (ret)

  OK
>=20
> > +		return ret;
> > +
> > +	switch (chip->type) {
> > +	case PM886:
> > +		ret =3D mfd_add_devices(chip->dev, 0, pm886_cell_info.cells,
> > +				      pm886_cell_info.cell_nr, NULL, 0,
> > +				      regmap_irq_get_domain(chip->irq_data));
> > +		break;
> > +	case PM880:
> > +		ret =3D mfd_add_devices(chip->dev, 0, pm880_cell_info.cells,
> > +				      pm880_cell_info.cell_nr, NULL, 0,
> > +				      regmap_irq_get_domain(chip->irq_data));
>=20
> switch() on {pm880_cell_info|pm886_cell_info.cells}.cells etc and jus=
t
> call mfd_add_devices() once.

  Yes, you are right
>=20
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +	return ret;
> > +}
> > +
> > +static int (*apply_to_chip)(struct pm88x_chip *chip);
> > +/* PMIC chip itself related */
> > +int pm88x_apply_patch(struct pm88x_chip *chip)
> > +{
> > +	if (!chip || !chip->client)
> > +		return -EINVAL;
> > +
> > +	chip->type =3D pm88x_of_get_type(&chip->client->dev);
> > +	switch (chip->type) {
> > +	case PM886:
> > +		apply_to_chip =3D pm886_apply_patch;
> > +		break;
> > +	case PM880:
> > +		apply_to_chip =3D pm880_apply_patch;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +	if (apply_to_chip)
> > +		apply_to_chip(chip);
> > +	return 0;
> > +}
>=20
> What on earth is going on here?
>=20
> Why bother assigning the *fn()?

  because 88pm886 and 88pm880 have different pages, the latter has one
  more page, so I added two function here by assigning the *fn(), after
  more thoughts, I think this is not needed, I will modify to use a
  better method, thanks for your criticism
>=20
> > +int pm88x_stepping_fixup(struct pm88x_chip *chip)
> > +{
> > +	if (!chip || !chip->client)
> > +		return -EINVAL;
>=20
> I don't think this can happen.

  I will remove;
>=20
> > +	chip->type =3D pm88x_of_get_type(&chip->client->dev);
> > +	switch (chip->type) {
> > +	case PM886:
> > +	case PM880:
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> This function appears to do nothing.  Why is it here?

  I planed to implement in the following patchset, now I know I should
  merge it into the next one;
>=20
> > +int pm88x_apply_board_fixup(struct pm88x_chip *chip, struct device=
_node *np)
> > +{
> > +	/* add board design specific setting, parsed via device tree */
> > +	return 0;
> > +}
>=20
> What's this?  Another empty function.

  same with above;
>=20
> > +long pm88x_of_get_type(struct device *dev)
> > +{
> > +	const struct of_device_id *id =3D of_match_device(pm88x_of_match,=
 dev);
> > +
> > +	if (id)
> > +		return (long)id->data;
> > +	else
> > +		return 0;
> > +}
>=20
> Just do this once, in probe and store the value in driver data.  No
> need for a function to do this.
 =20
  got it;
>=20
> > +void pm88x_dev_exit(struct pm88x_chip *chip)
> > +{
> > +	mfd_remove_devices(chip->dev);
> > +	pm88x_irq_exit(chip);
> > +}
> > +
> > +void pm88x_power_off(void)
> > +{
> > +	pr_info("powers off the system.");
> > +	/* TODO: implement later */
>=20
> Why can't you implement this now?
 =20
  OK, I will add in the next version
>=20
> > +	for (;;)
> > +		cpu_relax();
>=20
> What's the point of this?

  I just would like to busy loop at the end of the power_off callback;
>=20
> > +}
> > +
> > +int pm88x_reboot_notifier_callback(struct notifier_block *this,
> > +				   unsigned long code, void *unused)
> > +{
> > +	struct pm88x_chip *chip =3D
> > +		container_of(this, struct pm88x_chip, reboot_notifier);
> > +
> > +	switch (code) {
> > +	case SYS_HALT:
> > +	case SYS_POWER_OFF:
> > +		dev_info(chip->dev, "system is down.\n");
> > +		break;
> > +	case SYS_RESTART:
> > +	default:
> > +		dev_info(chip->dev, "system will reboot.\n");
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> This function is pointless.
=20
  my intention is to record what has happened to the system, I will
  double consider of it; thanks;
>=20
> > diff --git a/drivers/mfd/88pm88x-i2c.c b/drivers/mfd/88pm88x-i2c.c
> > new file mode 100644
> > index 0000000..36842ed
> > --- /dev/null
> > +++ b/drivers/mfd/88pm88x-i2c.c
> > @@ -0,0 +1,167 @@
> > +/*
> > + * 88pm88x-i2c.c  --  88pm88x i2c bus interface
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/88pm886.h>
> > +#include <linux/mfd/88pm880.h>
> > +#include <linux/mfd/88pm88x.h>
> > +
> > +static int pm88x_i2c_probe(struct i2c_client *client,
> > +		       const struct i2c_device_id *id)
> > +{
> > +	struct pm88x_chip *chip;
> > +	struct device_node *node =3D client->dev.of_node;
> > +	int ret =3D 0;
> > +
> > +	chip =3D pm88x_init_chip(client);
>=20
> This function doesn't actually do any chip initialisation.

  actually, yes, it only does some software work.. I will find a better
  name in next version
>=20
> ... and the code should be moved into here.
>=20
> > +	if (IS_ERR(chip)) {
> > +		ret =3D PTR_ERR(chip);
> > +		dev_err(chip->dev, "initialize 88pm88x chip fails!\n");
>=20
> "Failed to initialise chip"

   OK, I will scan and modify all of the error log. thanks very much;
>=20
> > +		goto err;
>=20
> Just return.

  OK;
>=20
> > +	}
> > +
> > +	ret =3D pm88x_parse_dt(node, chip);
> > +	if (ret < 0) {
> > +		dev_err(chip->dev, "parse dt fails!\n");
>=20
> "Failed to parse DT"
   got it;
>=20
> > +		goto err;
>=20
> Just return.
>=20
> > +	}
> > +
> > +	ret =3D pm88x_init_pages(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "initialize 88pm88x pages fails!\n");
>=20
> Etc ...
  got it;
>=20
> > +		goto err;
>=20
> Just return.
  got it;
>=20
> > +	}
> > +
> > +	ret =3D pm88x_post_init_chip(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "post initialize 88pm88x fails!\n");
> > +		goto err;
>=20
> Just return.
  got it;
>=20
> > +	}
> > +
> > +	ret =3D pm88x_irq_init(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "initialize 88pm88x interrupt fails!\n");
> > +		goto err_init_irq;
> > +	}
> > +
> > +	ret =3D pm88x_init_subdev(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "initialize 88pm88x sub-device fails\n");
> > +		goto err_init_subdev;
> > +	}
> > +
> > +	/* patch for PMIC chip itself */
> > +	ret =3D pm88x_apply_patch(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "apply 88pm88x register patch fails\n");
> > +		goto err_apply_patch;
> > +	}
> > +
> > +	/* fixup according PMIC stepping */
>=20
> This comment doesn't make any sense.

  I will change, my intention is add chip stepping specific setting
>=20
> > +	ret =3D pm88x_stepping_fixup(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "fixup according to chip stepping\n");
> > +		goto err_apply_patch;
> > +	}
> > +
> > +	/* patch for board configuration */
> > +	ret =3D pm88x_apply_board_fixup(chip, node);
> > +	if (ret) {
> > +		dev_err(chip->dev, "apply 88pm88x register for board fails\n");
> > +		goto err_apply_patch;
> > +	}
> > +
> > +	pm_power_off =3D pm88x_power_off;
> > +
> > +	chip->reboot_notifier.notifier_call =3D pm88x_reboot_notifier_cal=
lback;
> > +	register_reboot_notifier(&(chip->reboot_notifier));
> > +
> > +	return 0;
> > +
> > +err_apply_patch:
> > +	mfd_remove_devices(chip->dev);
> > +err_init_subdev:
> > +	regmap_del_irq_chip(chip->irq, chip->irq_data);
> > +err_init_irq:
> > +	pm800_exit_pages(chip);
> > +err:
>=20
> Remove this label.

  Yes, you are right;
>=20
> > +	return ret;
> > +}
> > +
> > +static int pm88x_i2c_remove(struct i2c_client *i2c)
> > +{
> > +	struct pm88x_chip *chip =3D dev_get_drvdata(&i2c->dev);
> > +	pm88x_dev_exit(chip);
> > +	return 0;
> > +}
>=20
> Checkpatch will warn you about this function.

  Sorry for my fault
>=20
> > +static const struct i2c_device_id pm88x_i2c_id[] =3D {
> > +	{ "88pm886", PM886 },
> > +	{ "88pm880", PM880 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, pm88x_i2c_id);
> > +
> > +static int pm88x_i2c_suspend(struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int pm88x_i2c_resume(struct device *dev)
> > +{
> > +	return 0;
> > +}
>=20
> Why even supply them?

  I planned to implement in the next patch, now I understand I should
  remove it. thanks;
>=20
> > +static SIMPLE_DEV_PM_OPS(pm88x_pm_ops, pm88x_i2c_suspend, pm88x_i2=
c_resume);
> > +
> > +static struct i2c_driver pm88x_i2c_driver =3D {
> > +	.driver =3D {
> > +		.name	=3D "88pm88x",
> > +		.owner	=3D THIS_MODULE,
>=20
> Remove this line.
  got your point
>=20
> > +		.pm	=3D &pm88x_pm_ops,
> > +		.of_match_table	=3D of_match_ptr(pm88x_of_match),
> > +	},
> > +	.probe		=3D pm88x_i2c_probe,
> > +	.remove		=3D pm88x_i2c_remove,
> > +	.id_table	=3D pm88x_i2c_id,
> > +};
> > +
> > +static int __init pm88x_i2c_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret =3D i2c_add_driver(&pm88x_i2c_driver);
> > +	if (ret !=3D 0) {
> > +		pr_err("88pm88x I2C registration failed %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +subsys_initcall(pm88x_i2c_init);
> > +
> > +static void __exit pm88x_i2c_exit(void)
> > +{
> > +	i2c_del_driver(&pm88x_i2c_driver);
> > +}
> > +module_exit(pm88x_i2c_exit);
>=20
> I think you want to remove all of this and replace with
> module_i2c_driver().

  Yes, I should use module_i2c_driver();
>=20
> > +MODULE_DESCRIPTION("88pm88x I2C bus interface");
> > +MODULE_AUTHOR("Yi Zhang<yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>");
>=20
> Missing a space.
  Yes
>=20
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/mfd/88pm88x-irq.c b/drivers/mfd/88pm88x-irq.c
> > new file mode 100644
> > index 0000000..0126df0
> > --- /dev/null
> > +++ b/drivers/mfd/88pm88x-irq.c
> > @@ -0,0 +1,171 @@
> > +/*
> > + * 88pm886 interrupt support
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/mfd/88pm88x.h>
> > +#include <linux/mfd/88pm886.h>
> > +#include <linux/mfd/88pm880.h>
> > +
> > +/* interrupt status registers */
> > +#define PM88X_INT_STATUS1		(0x05)
> > +
> > +#define PM88X_INT_ENA_1			(0x0a)
> > +#define PM88X_ONKEY_INT_ENA1		(1 << 0)
> > +#define PM88X_EXTON_INT_ENA1		(1 << 1)
> > +#define PM88X_CHG_INT_ENA1		(1 << 2)
> > +#define PM88X_BAT_INT_ENA1		(1 << 3)
> > +#define PM88X_RTC_INT_ENA1		(1 << 4)
> > +#define PM88X_CLASSD_INT_ENA1		(1 << 5)
> > +#define PM88X_XO_INT_ENA1		(1 << 6)
> > +#define PM88X_GPIO_INT_ENA1		(1 << 7)
> > +
> > +#define PM88X_INT_ENA_2			(0x0b)
> > +#define PM88X_VBAT_INT_ENA2		(1 << 0)
> > +#define PM88X_RSVED1_INT_ENA2		(1 << 1)
> > +#define PM88X_VBUS_INT_ENA2		(1 << 2)
> > +#define PM88X_ITEMP_INT_ENA2		(1 << 3)
> > +#define PM88X_BUCK_PGOOD_INT_ENA2	(1 << 4)
> > +#define PM88X_LDO_PGOOD_INT_ENA2	(1 << 5)
> > +#define PM88X_RSVED6_INT_ENA2		(1 << 6)
> > +#define PM88X_RSVED7_INT_ENA2		(1 << 7)
> > +
> > +#define PM88X_INT_ENA_3			(0x0c)
> > +#define PM88X_GPADC0_INT_ENA3		(1 << 0)
> > +#define PM88X_GPADC1_INT_ENA3		(1 << 1)
> > +#define PM88X_GPADC2_INT_ENA3		(1 << 2)
> > +#define PM88X_GPADC3_INT_ENA3		(1 << 3)
> > +#define PM88X_MIC_INT_ENA3		(1 << 4)
> > +#define PM88X_HS_INT_ENA3		(1 << 5)
> > +#define PM88X_GND_INT_ENA3		(1 << 6)
> > +#define PM88X_RSVED7_INT_ENA3		(1 << 7)
> > +
> > +#define PM88X_INT_ENA_4			(0x0d)
> > +#define PM88X_CHG_FAIL_INT_ENA4		(1 << 0)
> > +#define PM88X_CHG_DONE_INT_ENA4		(1 << 1)
> > +#define PM88X_RSVED2_INT_ENA4		(1 << 2)
> > +#define PM88X_OTG_FAIL_INT_ENA4		(1 << 3)
> > +#define PM88X_RSVED4_INT_ENA4		(1 << 4)
> > +#define PM88X_CHG_ILIM_INT_ENA4		(1 << 5)
> > +#define PM88X_CC_INT_ENA4		(1 << 6)
> > +#define PM88X_RSVED7_INT_ENA4		(1 << 7)
> > +
> > +#define PM88X_MISC_CONFIG2		(0x15)
> > +#define PM88X_INV_INT			(1 << 0)
> > +#define PM88X_INT_CLEAR			(1 << 1)
> > +#define PM88X_INT_RC			(0 << 1)
> > +#define PM88X_INT_WC			(1 << 1)
> > +#define PM88X_INT_MASK_MODE		(1 << 2)
>=20
> Replace all "1 <<" with BIT()
>=20
> > +static const struct regmap_irq pm88x_irqs[] =3D {
> > +	/* INT0 */
> > +	[PM88X_IRQ_ONKEY] =3D {.reg_offset =3D 0, .mask =3D PM88X_ONKEY_I=
NT_ENA1,},
> > +	[PM88X_IRQ_EXTON] =3D {.reg_offset =3D 0, .mask =3D PM88X_EXTON_I=
NT_ENA1,},
> > +	[PM88X_IRQ_CHG_GOOD] =3D {.reg_offset =3D 0, .mask =3D PM88X_CHG_=
INT_ENA1,},
> > +	[PM88X_IRQ_BAT_DET] =3D {.reg_offset =3D 0, .mask =3D PM88X_BAT_I=
NT_ENA1,},
> > +	[PM88X_IRQ_RTC] =3D {.reg_offset =3D 0, .mask =3D PM88X_RTC_INT_E=
NA1,},
> > +	[PM88X_IRQ_CLASSD] =3D { .reg_offset =3D 0, .mask =3D PM88X_CLASS=
D_INT_ENA1,},
> > +	[PM88X_IRQ_XO] =3D {.reg_offset =3D 0, .mask =3D PM88X_XO_INT_ENA=
1,},
> > +	[PM88X_IRQ_GPIO] =3D {.reg_offset =3D 0, .mask =3D PM88X_GPIO_INT=
_ENA1,},
> > +
> > +	/* INT1 */
> > +	[PM88X_IRQ_VBAT] =3D {.reg_offset =3D 1, .mask =3D PM88X_VBAT_INT=
_ENA2,},
> > +	[PM88X_IRQ_VBUS] =3D {.reg_offset =3D 1, .mask =3D PM88X_VBUS_INT=
_ENA2,},
> > +	[PM88X_IRQ_ITEMP] =3D {.reg_offset =3D 1, .mask =3D PM88X_ITEMP_I=
NT_ENA2,},
> > +	[PM88X_IRQ_BUCK_PGOOD] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D PM88X_BUCK_PGOOD_INT_ENA2,
> > +	},
> > +	[PM88X_IRQ_LDO_PGOOD] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D PM88X_LDO_PGOOD_INT_ENA2,
> > +	},
> > +	/* INT2 */
> > +	[PM88X_IRQ_GPADC0] =3D {.reg_offset =3D 2, .mask =3D PM88X_GPADC0=
_INT_ENA3,},
> > +	[PM88X_IRQ_GPADC1] =3D {.reg_offset =3D 2, .mask =3D PM88X_GPADC1=
_INT_ENA3,},
> > +	[PM88X_IRQ_GPADC2] =3D {.reg_offset =3D 2, .mask =3D PM88X_GPADC2=
_INT_ENA3,},
> > +	[PM88X_IRQ_GPADC3] =3D {.reg_offset =3D 2, .mask =3D PM88X_GPADC3=
_INT_ENA3,},
> > +	[PM88X_IRQ_MIC_DET] =3D {.reg_offset =3D 2, .mask =3D PM88X_MIC_I=
NT_ENA3,},
> > +	[PM88X_IRQ_HS_DET] =3D {.reg_offset =3D 2, .mask =3D PM88X_HS_INT=
_ENA3,},
> > +	[PM88X_IRQ_GND_DET] =3D {.reg_offset =3D 2, .mask =3D PM88X_GND_I=
NT_ENA3,},
>=20
> This is not how we lay out structures (your code below is correct).
  got your point.
>=20
> > +	/* INT3 */
> > +	[PM88X_IRQ_CHG_FAIL] =3D {
> > +		.reg_offset =3D 3,
> > +		.mask =3D PM88X_CHG_FAIL_INT_ENA4,
> > +	},
> > +	[PM88X_IRQ_CHG_DONE] =3D {
> > +		.reg_offset =3D 3,
> > +		.mask =3D PM88X_CHG_DONE_INT_ENA4,
> > +	},
> > +	[PM88X_IRQ_OTG_FAIL] =3D {
> > +		.reg_offset =3D 3,
> > +		.mask =3D PM88X_OTG_FAIL_INT_ENA4,
> > +	},
> > +	[PM88X_IRQ_CHG_ILIM] =3D {
> > +		.reg_offset =3D 3,
> > +		.mask =3D PM88X_CHG_ILIM_INT_ENA4,
> > +	},
> > +	[PM88X_IRQ_CC] =3D {.reg_offset =3D 3, .mask =3D PM88X_CC_INT_ENA=
4,},
> > +};
> > +
> > +struct regmap_irq_chip pm88x_irq_chip =3D {
> > +	.name =3D "88pm88x",
> > +	.irqs =3D pm88x_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(pm88x_irqs),
> > +
>=20
> No need for the '\n'.
  thanks;
>=20
> > +	.num_regs =3D 4,
> > +	.status_base =3D PM88X_INT_STATUS1,
> > +	.mask_base =3D PM88X_INT_ENA_1,
> > +	.ack_base =3D PM88X_INT_STATUS1,
> > +	.mask_invert =3D 1,
> > +};
> > +
> > +int pm88x_irq_init(struct pm88x_chip *chip)
> > +{
> > +	int mask, data, ret;
> > +	struct regmap *map;
>=20
> Not sure this variable is even needed, but if you want to keep it,
> please rename to regmap.

  fine, I will use regmap
>=20
> > +	if (!chip || !chip->base_regmap || !chip->irq) {
> > +		pr_err("cannot initialize interrupt!\n");
> > +		return -EINVAL;
> > +	}
> > +	map =3D chip->base_regmap;
> > +
> > +	/*
> > +	 * irq_mode defines the way of clearing interrupt.
> > +	 * it's read-clear by default.
> > +	 */
> > +	mask =3D PM88X_INV_INT | PM88X_INT_CLEAR | PM88X_INT_MASK_MODE;
> > +	data =3D (chip->irq_mode) ? PM88X_INT_WC : PM88X_INT_RC;
> > +	ret =3D regmap_update_bits(map, PM88X_MISC_CONFIG2, mask, data);
> > +	if (ret < 0) {
> > +		dev_err(chip->dev, "cannot set interrupt mode!\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D regmap_add_irq_chip(map, chip->irq, IRQF_ONESHOT, -1,
> > +				  &pm88x_irq_chip, &chip->irq_data);
> > +	return ret;
> > +}
> > +
> > +int pm88x_irq_exit(struct pm88x_chip *chip)
> > +{
> > +	regmap_del_irq_chip(chip->irq, chip->irq_data);
> > +	return 0;
> > +}
> > diff --git a/drivers/mfd/88pm88x.h b/drivers/mfd/88pm88x.h
> > new file mode 100644
> > index 0000000..a85a486
> > --- /dev/null
> > +++ b/drivers/mfd/88pm88x.h
> > @@ -0,0 +1,51 @@
> > +#ifndef _MFD_88PM88X_H
> > +#define _MFD_88PM88X_H
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/core.h>
> > +
> > +struct pmic_cell_info {
> > +	const struct mfd_cell *cells;
> > +	int		cell_nr;
> > +};
>=20
> No need for this, please move it.
  Yes;
>=20
> > +#define CELL_IRQ_RESOURCE(_name, _irq) { \
> > +	.name =3D _name, \
> > +	.start =3D _irq, .end =3D _irq, \
> > +	.flags =3D IORESOURCE_IRQ, \
> > +	}
>=20
> This already exists, DEFINE_RES*.

  Thanks for reminder, yes;
>=20
> > +#define CELL_DEV(_name, _r, _compatible, _id) { \
> > +	.name =3D _name, \
> > +	.of_compatible =3D _compatible, \
> > +	.num_resources =3D ARRAY_SIZE(_r), \
> > +	.resources =3D _r, \
> > +	.id =3D _id, \
> > +	}
>=20
> This is not required.
>=20
> If you feel the need for an MFD Cell macro, you probably have too man=
y
> MFD cells and you have done something wrong..

  Yes, I should use one MFD to cover regulators and one MFD to cover
  LEDs, I will remember this lesson; thanks;
>=20
> > +/* 88pm886 */
> > +extern const struct regmap_config pm886_base_i2c_regmap;
> > +extern const struct regmap_config pm886_power_i2c_regmap;
> > +extern const struct regmap_config pm886_gpadc_i2c_regmap;
> > +extern const struct regmap_config pm886_battery_i2c_regmap;
> > +extern const struct regmap_config pm886_test_i2c_regmap;
> > +
> > +extern const struct mfd_cell pm886_cell_devs[];
> > +extern struct pmic_cell_info pm886_cell_info;
> > +
> > +int pm886_apply_patch(struct pm88x_chip *chip);
> > +
> > +/* 88pm880 */
> > +extern const struct regmap_config pm880_base_i2c_regmap;
> > +extern const struct regmap_config pm880_power_i2c_regmap;
> > +extern const struct regmap_config pm880_gpadc_i2c_regmap;
> > +extern const struct regmap_config pm880_battery_i2c_regmap;
> > +extern const struct regmap_config pm880_test_i2c_regmap;
> > +
> > +extern const struct mfd_cell pm880_cell_devs[];
> > +extern struct pmic_cell_info pm880_cell_info;
> > +
> > +int pm880_apply_patch(struct pm88x_chip *chip);
>=20
> Place all of your code in the correct files and all these horrible
> global externs should vanish.
=20
  I will think carefully, thanks;
>=20
> > +#endif
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index d5ad04d..bdebca9 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -390,6 +390,18 @@ config MFD_KEMPLD
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called kempld-core.
> > =20
> > +config MFD_88PM88X
> > +	tristate "Marvell 88PM886/880 PMIC"
> > +	depends on I2C=3Dy
> > +	select REGMAP_I2C
> > +	select MFD_CORE
> > +	help
> > +	  This supports for Marvell 88PM88X Series Power Management IC:
> > +	  88pm886 and 88pm880;
> > +	  This includes the I2C driver, the interrupt resource distributi=
on
> > +	  and the core APIs, for individual sub-device as voltage regulat=
ors,
> > +	  RTC, charger, fuelgauge, etc, select under the corresponding me=
nus.
> > +
> >  config MFD_88PM800
> >  	tristate "Marvell 88PM800"
> >  	depends on I2C=3Dy
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 0e5cfeb..365d1fa 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -6,6 +6,9 @@
> >  obj-$(CONFIG_MFD_88PM860X)	+=3D 88pm860x.o
> >  obj-$(CONFIG_MFD_88PM800)	+=3D 88pm800.o 88pm80x.o
> >  obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
> > +88pm88x-objs			:=3D 88pm88x-core.o 88pm88x-i2c.o 88pm88x-irq.o 88p=
m886-table.o 88pm880-table.o
> > +obj-$(CONFIG_MFD_88PM88X)	+=3D 88pm88x.o
> > +
> >  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
> >  obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
> >  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
> > diff --git a/include/linux/mfd/88pm880-reg.h b/include/linux/mfd/88=
pm880-reg.h
> > new file mode 100644
> > index 0000000..fdf2315
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm880-reg.h
>=20
> You don't need a seperate header file for register values.  Just put
> them in include/linux/mfd/88pm880.h.

  OK, got it;
>=20
> > @@ -0,0 +1,98 @@
> > +/*
> > + * Marvell 88PM880 registers
> > + *
> > + * Copyright (C) 2014 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM880_REG_H
> > +#define __LINUX_MFD_88PM880_REG_H
> > +
> > +#define PM880_BUCK1_VOUT	(0x28)
> > +
> > +#define PM880_BUCK1A_VOUT	(0x28) /* voltage 0 */
> > +#define PM880_BUCK1A_1_VOUT	(0x29)
> > +#define PM880_BUCK1A_2_VOUT	(0x2a)
> > +#define PM880_BUCK1A_3_VOUT	(0x2b)
> > +#define PM880_BUCK1A_4_VOUT	(0x2c)
> > +#define PM880_BUCK1A_5_VOUT	(0x2d)
> > +#define PM880_BUCK1A_6_VOUT	(0x2e)
> > +#define PM880_BUCK1A_7_VOUT	(0x2f)
> > +#define PM880_BUCK1A_8_VOUT	(0x30)
> > +#define PM880_BUCK1A_9_VOUT	(0x31)
> > +#define PM880_BUCK1A_10_VOUT	(0x32)
> > +#define PM880_BUCK1A_11_VOUT	(0x33)
> > +#define PM880_BUCK1A_12_VOUT	(0x34)
> > +#define PM880_BUCK1A_13_VOUT	(0x35)
> > +#define PM880_BUCK1A_14_VOUT	(0x36)
> > +#define PM880_BUCK1A_15_VOUT	(0x37)
> > +
> > +#define PM880_BUCK1B_VOUT	(0x40)
> > +#define PM880_BUCK1B_1_VOUT	(0x41)
> > +#define PM880_BUCK1B_2_VOUT	(0x42)
> > +#define PM880_BUCK1B_3_VOUT	(0x43)
> > +#define PM880_BUCK1B_4_VOUT	(0x44)
> > +#define PM880_BUCK1B_5_VOUT	(0x45)
> > +#define PM880_BUCK1B_6_VOUT	(0x46)
> > +#define PM880_BUCK1B_7_VOUT	(0x47)
> > +#define PM880_BUCK1B_8_VOUT	(0x48)
> > +#define PM880_BUCK1B_9_VOUT	(0x49)
> > +#define PM880_BUCK1B_10_VOUT	(0x4a)
> > +#define PM880_BUCK1B_11_VOUT	(0x4b)
> > +#define PM880_BUCK1B_12_VOUT	(0x4c)
> > +#define PM880_BUCK1B_13_VOUT	(0x4d)
> > +#define PM880_BUCK1B_14_VOUT	(0x4e)
> > +#define PM880_BUCK1B_15_VOUT	(0x4f)
> > +
> > +/* buck7 has dvc function */
> > +#define PM880_BUCK7_VOUT	(0xb8) /* voltage 0 */
> > +#define PM880_BUCK7_1_VOUT	(0xb9)
> > +#define PM880_BUCK7_2_VOUT	(0xba)
> > +#define PM880_BUCK7_3_VOUT	(0xbb)
> > +
> > +/*
> > + * buck sleep mode control registers:
> > + * 00-disable,
> > + * 01/10-sleep voltage,
> > + * 11-active voltage
> > + */
> > +#define PM880_BUCK1A_SLP_CTRL	(0x27)
> > +#define PM880_BUCK1B_SLP_CTRL	(0x3c)
> > +#define PM880_BUCK2_SLP_CTRL	(0x54)
> > +#define PM880_BUCK3_SLP_CTRL	(0x6c)
> > +/* TODO: there are 7 controls bit for buck4~7 */
> > +#define PM880_BUCK4_SLP_CTRL	(0x84)
> > +#define PM880_BUCK5_SLP_CTRL	(0x94)
> > +#define PM880_BUCK6_SLP_CTRL	(0xa4)
> > +#define PM880_BUCK7_SLP_CTRL	(0xb4)
> > +
> > +/*
> > + * ldo sleep mode control registers:
> > + * 00-disable,
> > + * 01/10-sleep voltage,
> > + * 11-active voltage
> > + */
> > +#define PM880_LDO1_SLP_CTRL	(0x21)
> > +#define PM880_LDO2_SLP_CTRL	(0x27)
> > +#define PM880_LDO3_SLP_CTRL	(0x2d)
> > +#define PM880_LDO4_SLP_CTRL	(0x33)
> > +#define PM880_LDO5_SLP_CTRL	(0x39)
> > +#define PM880_LDO6_SLP_CTRL	(0x3f)
> > +#define PM880_LDO7_SLP_CTRL	(0x45)
> > +#define PM880_LDO8_SLP_CTRL	(0x4b)
> > +#define PM880_LDO9_SLP_CTRL	(0x51)
> > +#define PM880_LDO10_SLP_CTRL	(0x57)
> > +#define PM880_LDO11_SLP_CTRL	(0x5d)
> > +#define PM880_LDO12_SLP_CTRL	(0x63)
> > +#define PM880_LDO13_SLP_CTRL	(0x69)
> > +#define PM880_LDO14_SLP_CTRL	(0x6f)
> > +#define PM880_LDO15_SLP_CTRL	(0x75)
> > +#define PM880_LDO16_SLP_CTRL	(0x7b)
> > +#define PM880_LDO17_SLP_CTRL	(0x81)
> > +#define PM880_LDO18_SLP_CTRL	(0x87)
>=20
> Remove the brackets around all of the above.

  got it;
>=20
> > +#endif /*__LINUX_MFD_88PM880_REG_H */
> > diff --git a/include/linux/mfd/88pm880.h b/include/linux/mfd/88pm88=
0.h
> > new file mode 100644
> > index 0000000..94b9e063
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm880.h
> > @@ -0,0 +1,59 @@
> > +/*
> > + * Marvell 88PM880 Interface
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * 88pm880 specific configuration: at present it's regulators and =
dvc part
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM880_H
> > +#define __LINUX_MFD_88PM880_H
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> > +#include <linux/atomic.h>
> > +#include <linux/reboot.h>
>=20
> Why are these required?

  My fault, I should remove them;
>=20
> > +#include "88pm880-reg.h"
>=20
> <linux/mfd/88pm880.h>
>=20
> > +enum {
> > +	PM880_ID_BUCK1A =3D 0,
> > +	PM880_ID_BUCK2,
> > +	PM880_ID_BUCK3,
> > +	PM880_ID_BUCK4,
> > +	PM880_ID_BUCK5,
> > +	PM880_ID_BUCK6,
> > +	PM880_ID_BUCK7,
> > +
> > +	PM880_ID_BUCK_MAX =3D 7,
> > +};
> > +
> > +enum {
> > +	PM880_ID_LDO1 =3D 0,
> > +	PM880_ID_LDO2,
> > +	PM880_ID_LDO3,
> > +	PM880_ID_LDO4,
> > +	PM880_ID_LDO5,
> > +	PM880_ID_LDO6,
> > +	PM880_ID_LDO7,
> > +	PM880_ID_LDO8,
> > +	PM880_ID_LDO9,
> > +	PM880_ID_LDO10,
> > +	PM880_ID_LDO11,
> > +	PM880_ID_LDO12,
> > +	PM880_ID_LDO13,
> > +	PM880_ID_LDO14 =3D 13,
> > +	PM880_ID_LDO15,
> > +	PM880_ID_LDO16 =3D 15,
> > +
> > +	PM880_ID_LDO17 =3D 16,
> > +	PM880_ID_LDO18 =3D 17,
> > +
> > +	PM880_ID_LDO_MAX =3D 18,
> > +};
> > +#endif /* __LINUX_MFD_88PM880_H */
> > diff --git a/include/linux/mfd/88pm886-reg.h b/include/linux/mfd/88=
pm886-reg.h
> > new file mode 100644
> > index 0000000..38a7ecd
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm886-reg.h
> > @@ -0,0 +1,59 @@
> > +/*
> > + * Marvell 88PM886 registers
> > + *
> > + * Copyright (C) 2014 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM886_REG_H
> > +#define __LINUX_MFD_88PM886_REG_H
> > +
> > +#define PM886_BUCK1_VOUT	(0xa5)
> > +#define PM886_BUCK1_1_VOUT	(0xa6)
> > +#define PM886_BUCK1_2_VOUT	(0xa7)
> > +#define PM886_BUCK1_3_VOUT	(0xa8)
> > +#define PM886_BUCK1_4_VOUT	(0x9a)
> > +#define PM886_BUCK1_5_VOUT	(0x9b)
> > +#define PM886_BUCK1_6_VOUT	(0x9c)
> > +#define PM886_BUCK1_7_VOUT	(0x9d)
> > +
> > +/*
> > + * buck sleep mode control registers:
> > + * 00-disable,
> > + * 01/10-sleep voltage,
> > + * 11-active voltage
> > + */
> > +#define PM886_BUCK1_SLP_CTRL	(0xa2)
> > +#define PM886_BUCK2_SLP_CTRL	(0xb0)
> > +#define PM886_BUCK3_SLP_CTRL	(0xbe)
> > +#define PM886_BUCK4_SLP_CTRL	(0xcc)
> > +#define PM886_BUCK5_SLP_CTRL	(0xda)
> > +
> > +/*
> > + * ldo sleep mode control registers:
> > + * 00-disable,
> > + * 01/10-sleep voltage,
> > + * 11-active voltage
> > + */
> > +#define PM886_LDO1_SLP_CTRL	(0x21)
> > +#define PM886_LDO2_SLP_CTRL	(0x27)
> > +#define PM886_LDO3_SLP_CTRL	(0x2d)
> > +#define PM886_LDO4_SLP_CTRL	(0x33)
> > +#define PM886_LDO5_SLP_CTRL	(0x39)
> > +#define PM886_LDO6_SLP_CTRL	(0x3f)
> > +#define PM886_LDO7_SLP_CTRL	(0x45)
> > +#define PM886_LDO8_SLP_CTRL	(0x4b)
> > +#define PM886_LDO9_SLP_CTRL	(0x51)
> > +#define PM886_LDO10_SLP_CTRL	(0x57)
> > +#define PM886_LDO11_SLP_CTRL	(0x5d)
> > +#define PM886_LDO12_SLP_CTRL	(0x63)
> > +#define PM886_LDO13_SLP_CTRL	(0x69)
> > +#define PM886_LDO14_SLP_CTRL	(0x6f)
> > +#define PM886_LDO15_SLP_CTRL	(0x75)
> > +#define PM886_LDO16_SLP_CTRL	(0x7b)
> > +
> > +#endif
> > diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm88=
6.h
> > new file mode 100644
> > index 0000000..9390406
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm886.h
> > @@ -0,0 +1,55 @@
> > +/*
> > + * Marvell 88PM886 Interface
> > + *
> > + * Copyright (C) 2015 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * 88pm886 specific configuration: at present it's regulators and =
dvc part
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM886_H
> > +#define __LINUX_MFD_88PM886_H
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> > +#include <linux/atomic.h>
> > +#include <linux/reboot.h>
> > +#include "88pm886-reg.h"
> > +
> > +enum {
> > +	PM886_ID_BUCK1 =3D 0,
> > +	PM886_ID_BUCK2,
> > +	PM886_ID_BUCK3,
> > +	PM886_ID_BUCK4,
> > +	PM886_ID_BUCK5,
> > +
> > +	PM886_ID_BUCK_MAX =3D 5,
> > +};
> > +
> > +enum {
> > +	PM886_ID_LDO1 =3D 0,
> > +	PM886_ID_LDO2,
> > +	PM886_ID_LDO3,
> > +	PM886_ID_LDO4,
> > +	PM886_ID_LDO5,
> > +	PM886_ID_LDO6,
> > +	PM886_ID_LDO7,
> > +	PM886_ID_LDO8,
> > +	PM886_ID_LDO9,
> > +	PM886_ID_LDO10,
> > +	PM886_ID_LDO11,
> > +	PM886_ID_LDO12,
> > +	PM886_ID_LDO13,
> > +	PM886_ID_LDO14,
> > +	PM886_ID_LDO15,
> > +	PM886_ID_LDO16 =3D 15,
> > +
> > +	PM886_ID_LDO_MAX =3D 16,
> > +};
> > +
> > +#endif /* __LINUX_MFD_88PM886_H */
> > diff --git a/include/linux/mfd/88pm88x-reg.h b/include/linux/mfd/88=
pm88x-reg.h
> > new file mode 100644
> > index 0000000..d767b31
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm88x-reg.h
> > @@ -0,0 +1,118 @@
> > +/*
> > + * Marvell 88PM88X registers
> > + *
> > + * Copyright (C) 2014 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM88X_REG_H
> > +#define __LINUX_MFD_88PM88X_REG_H
> > +/*
> > + * This file is just used for the common registers,
> > + * which are shared by sub-clients
> > + */
> > +
> > +/*--base page:----------------------------------------------------=
----------*/
>=20
> All of the commenting above is superfluous.
>=20
> > +#define PM88X_ID_REG			(0x0)
> > +
> > +#define PM88X_STATUS1			(0x1)
> > +#define PM88X_CHG_DET			(1 << 2)
> > +#define PM88X_BAT_DET			(1 << 3)
> > +
> > +#define PM88X_MISC_CONFIG1		(0x14)
> > +#define PM88X_LONKEY_RST		(1 << 3)
> > +
> > +#define PM88X_WDOG			(0x1d)
> > +
> > +#define PM88X_LOWPOWER2			(0x21)
> > +#define PM88X_LOWPOWER4			(0x23)
> > +
> > +/* clk control register */
> > +#define PM88X_CLK_CTRL1			(0x25)
> > +
> > +/* gpio */
> > +#define PM88X_GPIO_CTRL1		(0x30)
> > +#define PM88X_GPIO0_VAL_MSK		(0x1 << 0)
> > +#define PM88X_GPIO0_MODE_MSK		(0x7 << 1)
> > +#define PM88X_GPIO1_VAL_MSK		(0x1 << 4)
> > +#define PM88X_GPIO1_MODE_MSK		(0x7 << 5)
> > +#define PM88X_GPIO1_SET_DVC		(0x2 << 5)
> > +
> > +#define PM88X_GPIO_CTRL2		(0x31)
> > +#define PM88X_GPIO2_VAL_MSK		(0x1 << 0)
> > +#define PM88X_GPIO2_MODE_MSK		(0x7 << 1)
> > +
> > +#define PM88X_GPIO_CTRL3		(0x32)
> > +
> > +#define PM88X_GPIO_CTRL4		(0x33)
> > +#define PM88X_GPIO5V_1_VAL_MSK		(0x1 << 0)
> > +#define PM88X_GPIO5V_1_MODE_MSK		(0x7 << 1)
> > +#define PM88X_GPIO5V_2_VAL_MSK		(0x1 << 4)
> > +#define PM88X_GPIO5V_2_MODE_MSK		(0x7 << 5)
> > +
> > +#define PM88X_BK_OSC_CTRL1		(0x50)
> > +#define PM88X_BK_OSC_CTRL3		(0x52)
> > +
> > +#define PM88X_RTC_ALARM_CTRL1		(0xd0)
> > +#define PM88X_ALARM_WAKEUP		(1 << 4)
> > +#define PM88X_USE_XO			(1 << 7)
> > +
> > +#define PM88X_AON_CTRL2			(0xe2)
> > +#define PM88X_AON_CTRL3			(0xe3)
> > +#define PM88X_AON_CTRL4			(0xe4)
> > +#define PM88X_AON_CTRL7			(0xe7)
> > +
> > +/* 0xea, 0xeb, 0xec, 0xed are reserved by RTC */
> > +#define PM88X_RTC_SPARE5		(0xee)
> > +#define PM88X_RTC_SPARE6		(0xef)
> > +/*----------------------------------------------------------------=
---------*/
> > +
> > +/*--power page:---------------------------------------------------=
---------*/
> > +
> > +/*----------------------------------------------------------------=
---------*/
> > +
> > +/*--gpadc page:---------------------------------------------------=
---------*/
>=20
> This type of commenting is messy and unwanted.
>=20
> > +#define PM88X_GPADC_CONFIG1		(0x1)
> > +
> > +#define PM88X_GPADC_CONFIG2		(0x2)
> > +#define PM88X_GPADC0_MEAS_EN		(1 << 2)
> > +#define PM88X_GPADC1_MEAS_EN		(1 << 3)
> > +#define PM88X_GPADC2_MEAS_EN		(1 << 4)
> > +#define PM88X_GPADC3_MEAS_EN		(1 << 5)
> > +
> > +#define PM88X_GPADC_CONFIG3		(0x3)
> > +
> > +#define PM88X_GPADC_CONFIG6		(0x6)
> > +#define PM88X_GPADC_CONFIG8		(0x8)
> > +
> > +#define PM88X_GPADC0_LOW_TH		(0x20)
> > +#define PM88X_GPADC1_LOW_TH		(0x21)
> > +#define PM88X_GPADC2_LOW_TH		(0x22)
> > +#define PM88X_GPADC3_LOW_TH		(0x23)
> > +
> > +#define PM88X_GPADC0_UPP_TH		(0x30)
> > +#define PM88X_GPADC1_UPP_TH		(0x31)
> > +#define PM88X_GPADC2_UPP_TH		(0x32)
> > +#define PM88X_GPADC3_UPP_TH		(0x33)
> > +
> > +#define PM88X_VBUS_MEAS1		(0x4A)
> > +#define PM88X_GPADC0_MEAS1		(0x54)
> > +#define PM88X_GPADC1_MEAS1		(0x56)
> > +#define PM88X_GPADC2_MEAS1		(0x58)
> > +#define PM88X_GPADC3_MEAS1		(0x5A)
> > +
> > +
> > +/*--charger page:-------------------------------------------------=
-----------*/
> > +#define PM88X_CHG_CONFIG1		(0x28)
> > +#define PM88X_CHGBK_CONFIG6		(0x50)
> > +/*----------------------------------------------------------------=
---------*/
> > +
> > +/*--test page:----------------------------------------------------=
---------*/
> > +
> > +/*----------------------------------------------------------------=
---------*/
> > +#endif
> > diff --git a/include/linux/mfd/88pm88x.h b/include/linux/mfd/88pm88=
x.h
> > new file mode 100644
> > index 0000000..efa2fe6
> > --- /dev/null
> > +++ b/include/linux/mfd/88pm88x.h
> > @@ -0,0 +1,202 @@
> > +/*
> > + * Marvell 88PM88X PMIC Common Interface
> > + *
> > + * Copyright (C) 2014 Marvell International Ltd.
> > + *  Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + *
> > + * This file configures the common part of the 88pm88x series PMIC
> > + */
> > +
> > +#ifndef __LINUX_MFD_88PM88X_H
> > +#define __LINUX_MFD_88PM88X_H
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> > +#include <linux/atomic.h>
> > +#include <linux/reboot.h>
> > +#include "88pm88x-reg.h"
> > +#include "88pm886-reg.h"
>=20
> Why are all of these required?
>=20
> > +#define PM88X_RTC_NAME		"88pm88x-rtc"
> > +#define PM88X_ONKEY_NAME	"88pm88x-onkey"
> > +#define PM88X_CHARGER_NAME	"88pm88x-charger"
> > +#define PM88X_BATTERY_NAME	"88pm88x-battery"
> > +#define PM88X_HEADSET_NAME	"88pm88x-headset"
> > +#define PM88X_VBUS_NAME		"88pm88x-vbus"
> > +#define PM88X_CFD_NAME		"88pm88x-leds"
> > +#define PM88X_RGB_NAME		"88pm88x-rgb"
> > +#define PM88X_GPADC_NAME	"88pm88x-gpadc"
> > +#define PM88X_DVC_NAME		"88pm88x-dvc"
>=20
> I would prefer that you just used the name directly.
>=20
> > +enum pm88x_type {
> > +	PM886 =3D 1,
> > +	PM880 =3D 2,
> > +};
> > +
> > +enum pm88x_pages {
> > +	PM88X_BASE_PAGE =3D 0,
> > +	PM88X_LDO_PAGE,
> > +	PM88X_GPADC_PAGE,
> > +	PM88X_BATTERY_PAGE,
> > +	PM88X_BUCK_PAGE =3D 4,
>=20
> This is 4 anyway.
>=20
> > +	PM88X_TEST_PAGE =3D 7,
> > +};
> > +
> > +enum pm88x_gpadc {
> > +	PM88X_NO_GPADC =3D -1,
> > +	PM88X_GPADC0 =3D 0,
> > +	PM88X_GPADC1,
> > +	PM88X_GPADC2,
> > +	PM88X_GPADC3,
> > +};
> > +
> > +/* interrupt number */
> > +enum pm88x_irq_number {
> > +	PM88X_IRQ_ONKEY,	/* EN1b0 *//* 0 */
>=20
> At least put a space between the comments.
  Yes, you are right, a space between the comments is more readable
>=20
> > +	PM88X_IRQ_EXTON,	/* EN1b1 */
> > +	PM88X_IRQ_CHG_GOOD,	/* EN1b2 */
> > +	PM88X_IRQ_BAT_DET,	/* EN1b3 */
> > +	PM88X_IRQ_RTC,		/* EN1b4 */
> > +	PM88X_IRQ_CLASSD,	/* EN1b5 *//* 5 */
> > +	PM88X_IRQ_XO,		/* EN1b6 */
> > +	PM88X_IRQ_GPIO,		/* EN1b7 */
> > +
> > +	PM88X_IRQ_VBAT,		/* EN2b0 *//* 8 */
> > +				/* EN2b1 */
> > +	PM88X_IRQ_VBUS,		/* EN2b2 */
> > +	PM88X_IRQ_ITEMP,	/* EN2b3 *//* 10 */
> > +	PM88X_IRQ_BUCK_PGOOD,	/* EN2b4 */
> > +	PM88X_IRQ_LDO_PGOOD,	/* EN2b5 */
> > +
> > +	PM88X_IRQ_GPADC0,	/* EN3b0 */
> > +	PM88X_IRQ_GPADC1,	/* EN3b1 */
> > +	PM88X_IRQ_GPADC2,	/* EN3b2 *//* 15 */
> > +	PM88X_IRQ_GPADC3,	/* EN3b3 */
> > +	PM88X_IRQ_MIC_DET,	/* EN3b4 */
> > +	PM88X_IRQ_HS_DET,	/* EN3b5 */
> > +	PM88X_IRQ_GND_DET,	/* EN3b6 */
> > +
> > +	PM88X_IRQ_CHG_FAIL,	/* EN4b0 *//* 20 */
> > +	PM88X_IRQ_CHG_DONE,	/* EN4b1 */
> > +				/* EN4b2 */
> > +	PM88X_IRQ_CFD_FAIL,	/* EN4b3 */
> > +	PM88X_IRQ_OTG_FAIL,	/* EN4b4 */
> > +	PM88X_IRQ_CHG_ILIM,	/* EN4b5 *//* 25 */
> > +				/* EN4b6 */
> > +	PM88X_IRQ_CC,		/* EN4b7 *//* 27 */
> > +
> > +	PM88X_MAX_IRQ,			   /* 28 */
> > +};
> > +
> > +/* 3 rgb led indicators */
> > +enum {
> > +	PM88X_RGB_LED0,
> > +	PM88X_RGB_LED1,
> > +	PM88X_RGB_LED2,
> > +};
> > +
> > +/* camera flash/torch */
> > +enum {
> > +	PM88X_NO_LED =3D -1,
> > +	PM88X_FLASH_LED =3D 0,
> > +	PM88X_TORCH_LED,
> > +};
> > +
> > +struct pm88x_dvc_ops {
> > +	void (*level_to_reg)(u8 level);
> > +};
>=20
> This appears to be unused.

  again, I think I should move it into next patch
>=20
> > +struct pm88x_buck1_dvc_desc {
> > +	u8 current_reg;
> > +	int max_level;
> > +	int uV_step1;
> > +	int uV_step2;
> > +	int min_uV;
> > +	int mid_uV;
> > +	int max_uV;
> > +	int mid_reg_val;
> > +};
> >
> > +struct pm88x_dvc {
> > +	struct device *dev;
> > +	struct pm88x_chip *chip;
> > +	struct pm88x_dvc_ops ops;
> > +	struct pm88x_buck1_dvc_desc desc;
> > +};
> > +
> > +struct pm88x_chip {
> > +	struct i2c_client *client;
> > +	struct device *dev;
> > +
> > +	struct i2c_client *ldo_page;	/* chip client for ldo page */
> > +	struct i2c_client *power_page;	/* chip client for power page */
> > +	struct i2c_client *gpadc_page;	/* chip client for gpadc page */
> > +	struct i2c_client *battery_page;/* chip client for battery page *=
/
> > +	struct i2c_client *buck_page;	/* chip client for buck page */
> > +	struct i2c_client *test_page;	/* chip client for test page */
> > +
> > +	struct regmap *base_regmap;
> > +	struct regmap *ldo_regmap;
> > +	struct regmap *power_regmap;
> > +	struct regmap *gpadc_regmap;
> > +	struct regmap *battery_regmap;
> > +	struct regmap *buck_regmap;
> > +	struct regmap *test_regmap;
> > +	struct regmap *codec_regmap;
> > +
> > +	unsigned short ldo_page_addr;	/* ldo page I2C address */
> > +	unsigned short power_page_addr;	/* power page I2C address */
> > +	unsigned short gpadc_page_addr;	/* gpadc page I2C address */
> > +	unsigned short battery_page_addr;/* battery page I2C address */
> > +	unsigned short buck_page_addr;	/* buck page I2C address */
> > +	unsigned short test_page_addr;	/* test page I2C address */
> > +
> > +	unsigned int chip_id;
> > +	long type;			/* specific chip */
> > +	int irq;
> > +
> > +	int irq_mode;			/* write/read clear */
> > +	struct regmap_irq_chip_data *irq_data;
> > +
> > +	bool rtc_wakeup;		/* is it powered up by expired alarm? */
> > +	u8 powerdown1;			/* save power down reason */
> > +	u8 powerdown2;
> > +	u8 powerup;			/* the reason of power on */
> > +
> > +	struct notifier_block reboot_notifier;
> > +	struct pm88x_dvc *dvc;
> > +};
>=20
> This is an awful lot of junk to be held in a device data structure.
> Try to remove as much as you can.

  thanks, I will think carefully
>=20
> > +extern struct regmap_irq_chip pm88x_irq_chip;
> > +extern const struct of_device_id pm88x_of_match[];
> > +
> > +struct pm88x_chip *pm88x_init_chip(struct i2c_client *client);
> > +int pm88x_parse_dt(struct device_node *np, struct pm88x_chip *chip=
);
> > +
> > +int pm88x_init_pages(struct pm88x_chip *chip);
> > +int pm88x_post_init_chip(struct pm88x_chip *chip);
> > +void pm800_exit_pages(struct pm88x_chip *chip);
> > +
> > +int pm88x_init_subdev(struct pm88x_chip *chip);
> > +long pm88x_of_get_type(struct device *dev);
> > +void pm88x_dev_exit(struct pm88x_chip *chip);
> > +
> > +int pm88x_irq_init(struct pm88x_chip *chip);
> > +int pm88x_irq_exit(struct pm88x_chip *chip);
> > +int pm88x_apply_patch(struct pm88x_chip *chip);
> > +int pm88x_stepping_fixup(struct pm88x_chip *chip);
> > +int pm88x_apply_board_fixup(struct pm88x_chip *chip, struct device=
_node *np);
> > +
> > +struct pm88x_chip *pm88x_get_chip(void);
> > +void pm88x_set_chip(struct pm88x_chip *chip);
> > +void pm88x_power_off(void);
> > +int pm88x_reboot_notifier_callback(struct notifier_block *nb,
> > +				   unsigned long code, void *unused);
>=20
> All of these should probably be moved into a single file, unless you
> have a good reason to spread them out?

  thanks; I will modify it;
>=20
> > +#endif /* __LINUX_MFD_88PM88X_H */
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
