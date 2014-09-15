From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/5] mfd/axp2xx: extend axp20x to support axp288 pmic
Date: Mon, 15 Sep 2014 16:34:36 -0700
Message-ID: <20140915233436.GO25162@lee--X1>
References: <1410477357-6407-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410477357-6407-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <20140915222215.GB25162@lee--X1>
 <20140915153202.0b9c8801@ultegra>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140915153202.0b9c8801@ultegra>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: IIO <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, DEVICE TREE <devicetree@vger.kernel.org>, Carlo Caione <carlo@caione.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Aaron Lu <aaron.lu@intel.com>, Alan Cox <alan@linux.intel.com>, Jean Delvare <khali@linux-fr.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Fugang Duan <B38611@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Zubair Lutfullah <zubair.lutfullah@gmail.com>, Sebastian Reichel <sre@debian.org>, Johannes Thumshirn <johannes.thumshirn@men.de>, Philippe Reynes <tremyfr@yahoo.fr>, Angelo Compagnucci <angelo.compagnu>
List-Id: devicetree@vger.kernel.org

On Mon, 15 Sep 2014, Jacob Pan wrote:

> On Mon, 15 Sep 2014 23:22:16 +0100
> Lee Jones <lee.jones@linaro.org> wrote:
>=20
> > On Thu, 11 Sep 2014, Jacob Pan wrote:
> >=20
> > > XPower AXP288 is a customized PMIC for Intel Baytrail-CR platform=
s.
> > > Similar to AXP202/209, AXP288 comes with USB charger, more LDO an=
d
> > > BUCK channels, and AD converter. It also provides extended status
> > > and interrupt reporting capabilities than the devices supported i=
n
> > > axp20x.c.
> > >=20
> > > In addition to feature extension, this patch also adds ACPI bindi=
ng
> > > for enumeration and hooks for ACPI custom operational region
> > > handlers.
> > >=20
> > > Common data structures and constants have been renamed from axp20=
x
> > > to axp2xx in order to suit the extended scope of devices.
> > >=20
> > > This consolidated driver should support more Xpowers' PMICs in bo=
th
> > > device tree and ACPI enumerated platforms.
> > >=20
> > > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > ---
> > >  drivers/mfd/axp2xx.c       | 423
> > > +++++++++++++++++++++++++++++++++++----------
> > > include/linux/mfd/axp2xx.h |  60 ++++++- 2 files changed, 388
> > > insertions(+), 95 deletions(-)
> >=20
> > I agree with Maxime and Jonathan.  Please try again.  All renaming =
in
> > one single patch, new device support in another please.
> >=20
> If you are not against keeping the filenames, I prefer to keep the
> axp20x name (not rename to axp2xx) and avoid all the trouble with
> rename. Users can get device support information from the Kconfig
> description as Jonathan pointed out. Is that OK?

Yes, fine.  Please submit your set and I will review.

> > > diff --git a/drivers/mfd/axp2xx.c b/drivers/mfd/axp2xx.c
> > > index 332a8a0..300f895 100644
> > > --- a/drivers/mfd/axp2xx.c
> > > +++ b/drivers/mfd/axp2xx.c
> > > @@ -1,9 +1,9 @@
> > >  /*
> > > - * axp2xx.c - MFD core driver for the X-Powers AXP202 and AXP209
> > > + * axp2xx.c - MFD core driver for the X-Powers' Power Management
> > > ICs *
> > > - * AXP2xx comprises an adaptive USB-Compatible PWM charger, 2 BU=
CK
> > > DC-DC
> > > - * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current
> > > and temperature
> > > - * as well as 4 configurable GPIOs.
> > > + * AXP2xx typically comprises an adaptive USB-Compatible PWM
> > > charger, BUCK DC-DC
> > > + * converters, LDOs, multiple 12-bit ADCs of voltage, current an=
d
> > > temperature
> > > + * as well as configurable GPIOs.
> > >   *
> > >   * Author: Carlo Caione <carlo@caione.org>
> > >   *
> > > @@ -25,9 +25,16 @@
> > >  #include <linux/mfd/core.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/of_irq.h>
> > > +#include <linux/acpi.h>
> > > =20
> > >  #define AXP20X_OFF	0x80
> > > =20
> > > +static const char *axp2xx_model_names[] =3D {
> > > +	"AXP202",
> > > +	"AXP209",
> > > +	"AXP288",
> > > +};
> > > +
> > >  static const struct regmap_range axp20x_writeable_ranges[] =3D {
> > >  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
> > >  	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
> > > @@ -47,6 +54,25 @@ static const struct regmap_access_table
> > > axp20x_volatile_table =3D { .n_yes_ranges	=3D
> > > ARRAY_SIZE(axp20x_volatile_ranges), };
> > > =20
> > > +static const struct regmap_range axp288_writeable_ranges[] =3D {
> > > +	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ6_STATE),
> > > +	regmap_reg_range(AXP20X_DCDC_MODE, AXP288_FG_TUNE5),
> > > +};
> > > +
> > > +static const struct regmap_range axp288_volatile_ranges[] =3D {
> > > +	regmap_reg_range(AXP20X_IRQ1_EN,  AXP20X_IPSOUT_V_HIGH_L),
> > > +};
> > > +
> > > +static const struct regmap_access_table axp288_writeable_table =3D=
 {
> > > +	.yes_ranges	=3D axp288_writeable_ranges,
> > > +	.n_yes_ranges	=3D ARRAY_SIZE(axp288_writeable_ranges),
> > > +};
> > > +
> > > +static const struct regmap_access_table axp288_volatile_table =3D=
 {
> > > +	.yes_ranges	=3D axp288_volatile_ranges,
> > > +	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
> > > +};
> > > +
> > >  static struct resource axp20x_pek_resources[] =3D {
> > >  	{
> > >  		.name	=3D "PEK_DBR",
> > > @@ -61,7 +87,40 @@ static struct resource axp20x_pek_resources[] =
=3D {
> > >  	},
> > >  };
> > > =20
> > > -static const struct regmap_config axp20x_regmap_config =3D {
> > > +static struct resource axp288_battery_resources[] =3D {
> > > +	{
> > > +		.start =3D AXP288_IRQ_QWBTU,
> > > +		.end   =3D AXP288_IRQ_QWBTU,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_WBTU,
> > > +		.end   =3D AXP288_IRQ_WBTU,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_QWBTO,
> > > +		.end   =3D AXP288_IRQ_QWBTO,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_WBTO,
> > > +		.end   =3D AXP288_IRQ_WBTO,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_WL2,
> > > +		.end   =3D AXP288_IRQ_WL2,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_WL1,
> > > +		.end   =3D AXP288_IRQ_WL1,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +};
> > > +
> > > +static struct regmap_config axp20x_regmap_config =3D {
> > >  	.reg_bits	=3D 8,
> > >  	.val_bits	=3D 8,
> > >  	.wr_table	=3D &axp20x_writeable_table,
> > > @@ -70,47 +129,96 @@ static const struct regmap_config
> > > axp20x_regmap_config =3D { .cache_type	=3D REGCACHE_RBTREE,
> > >  };
> > > =20
> > > -#define AXP20X_IRQ(_irq, _off, _mask) \
> > > -	[AXP20X_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D
> > > BIT(_mask) } +static struct regmap_config axp288_regmap_config =3D=
 {
> > > +	.reg_bits	=3D 8,
> > > +	.val_bits	=3D 8,
> > > +	.wr_table	=3D &axp288_writeable_table,
> > > +	.volatile_table	=3D &axp288_volatile_table,
> > > +	.max_register	=3D AXP288_FG_TUNE5,
> > > +	.cache_type	=3D REGCACHE_RBTREE,
> > > +};
> > > +
> > > +#define INIT_REGMAP_IRQ(_variant, _irq, _off,
> > > _mask)			\
> > > +	[_variant##_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D
> > > BIT(_mask) }=20
> > >  static const struct regmap_irq axp20x_regmap_irqs[] =3D {
> > > -	AXP20X_IRQ(ACIN_OVER_V,		0, 7),
> > > -	AXP20X_IRQ(ACIN_PLUGIN,		0, 6),
> > > -	AXP20X_IRQ(ACIN_REMOVAL,	0, 5),
> > > -	AXP20X_IRQ(VBUS_OVER_V,		0, 4),
> > > -	AXP20X_IRQ(VBUS_PLUGIN,		0, 3),
> > > -	AXP20X_IRQ(VBUS_REMOVAL,	0, 2),
> > > -	AXP20X_IRQ(VBUS_V_LOW,		0, 1),
> > > -	AXP20X_IRQ(BATT_PLUGIN,		1, 7),
> > > -	AXP20X_IRQ(BATT_REMOVAL,	1, 6),
> > > -	AXP20X_IRQ(BATT_ENT_ACT_MODE,	1, 5),
> > > -	AXP20X_IRQ(BATT_EXIT_ACT_MODE,	1, 4),
> > > -	AXP20X_IRQ(CHARG,		1, 3),
> > > -	AXP20X_IRQ(CHARG_DONE,		1, 2),
> > > -	AXP20X_IRQ(BATT_TEMP_HIGH,	1, 1),
> > > -	AXP20X_IRQ(BATT_TEMP_LOW,	1, 0),
> > > -	AXP20X_IRQ(DIE_TEMP_HIGH,	2, 7),
> > > -	AXP20X_IRQ(CHARG_I_LOW,		2, 6),
> > > -	AXP20X_IRQ(DCDC1_V_LONG,	2, 5),
> > > -	AXP20X_IRQ(DCDC2_V_LONG,	2, 4),
> > > -	AXP20X_IRQ(DCDC3_V_LONG,	2, 3),
> > > -	AXP20X_IRQ(PEK_SHORT,		2, 1),
> > > -	AXP20X_IRQ(PEK_LONG,		2, 0),
> > > -	AXP20X_IRQ(N_OE_PWR_ON,		3, 7),
> > > -	AXP20X_IRQ(N_OE_PWR_OFF,	3, 6),
> > > -	AXP20X_IRQ(VBUS_VALID,		3, 5),
> > > -	AXP20X_IRQ(VBUS_NOT_VALID,	3, 4),
> > > -	AXP20X_IRQ(VBUS_SESS_VALID,	3, 3),
> > > -	AXP20X_IRQ(VBUS_SESS_END,	3, 2),
> > > -	AXP20X_IRQ(LOW_PWR_LVL1,	3, 1),
> > > -	AXP20X_IRQ(LOW_PWR_LVL2,	3, 0),
> > > -	AXP20X_IRQ(TIMER,		4, 7),
> > > -	AXP20X_IRQ(PEK_RIS_EDGE,	4, 6),
> > > -	AXP20X_IRQ(PEK_FAL_EDGE,	4, 5),
> > > -	AXP20X_IRQ(GPIO3_INPUT,		4, 3),
> > > -	AXP20X_IRQ(GPIO2_INPUT,		4, 2),
> > > -	AXP20X_IRQ(GPIO1_INPUT,		4, 1),
> > > -	AXP20X_IRQ(GPIO0_INPUT,		4, 0),
> > > +	INIT_REGMAP_IRQ(AXP20X, ACIN_OVER_V,		0, 7),
> > > +	INIT_REGMAP_IRQ(AXP20X, ACIN_PLUGIN,		0, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, ACIN_REMOVAL,	        0, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_OVER_V,		0, 4),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_PLUGIN,		0, 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_REMOVAL,	        0, 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_V_LOW,		0, 1),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_PLUGIN,		1, 7),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_REMOVAL,	        1, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_ENT_ACT_MODE,	1, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_EXIT_ACT_MODE,	1, 4),
> > > +	INIT_REGMAP_IRQ(AXP20X, CHARG,		        1,
> > > 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, CHARG_DONE,		1, 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_TEMP_HIGH,	        1,
> > > 1),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_TEMP_LOW,	        1,
> > > 0),
> > > +	INIT_REGMAP_IRQ(AXP20X, DIE_TEMP_HIGH,	        2,
> > > 7),
> > > +	INIT_REGMAP_IRQ(AXP20X, CHARG_I_LOW,		2, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, DCDC1_V_LONG,	        2, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, DCDC2_V_LONG,	        2, 4),
> > > +	INIT_REGMAP_IRQ(AXP20X, DCDC3_V_LONG,	        2, 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, PEK_SHORT,		2, 1),
> > > +	INIT_REGMAP_IRQ(AXP20X, PEK_LONG,		2, 0),
> > > +	INIT_REGMAP_IRQ(AXP20X, N_OE_PWR_ON,		3, 7),
> > > +	INIT_REGMAP_IRQ(AXP20X, N_OE_PWR_OFF,	        3, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_VALID,		3, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_NOT_VALID,	        3,
> > > 4),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_SESS_VALID,	3, 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_SESS_END,	        3,
> > > 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, LOW_PWR_LVL1,	        3, 1),
> > > +	INIT_REGMAP_IRQ(AXP20X, LOW_PWR_LVL2,	        3, 0),
> > > +	INIT_REGMAP_IRQ(AXP20X, TIMER,		        4,
> > > 7),
> > > +	INIT_REGMAP_IRQ(AXP20X, PEK_RIS_EDGE,	        4, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, PEK_FAL_EDGE,	        4, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, GPIO3_INPUT,		4, 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, GPIO2_INPUT,		4, 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, GPIO1_INPUT,		4, 1),
> > > +	INIT_REGMAP_IRQ(AXP20X, GPIO0_INPUT,		4, 0),
> > > +};
> > > +
> > > +/* some IRQs are compatible with axp20x models */
> > > +static const struct regmap_irq axp288_regmap_irqs[] =3D {
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_REMOVAL,           0, 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_PLUGIN,            0, 3),
> > > +	INIT_REGMAP_IRQ(AXP20X, VBUS_OVER_V,            0, 4),
> > > +
> > > +	INIT_REGMAP_IRQ(AXP20X, CHARG_DONE,             1, 2),
> > > +	INIT_REGMAP_IRQ(AXP20X, CHARG,                  1, 3),
> > > +	INIT_REGMAP_IRQ(AXP288, SAFE_QUIT,              1, 4),
> > > +	INIT_REGMAP_IRQ(AXP288, SAFE_ENTER,             1, 5),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_REMOVAL,           1, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, BATT_PLUGIN,            1, 7),
> > > +
> > > +	INIT_REGMAP_IRQ(AXP288, QWBTU,                  2, 0),
> > > +	INIT_REGMAP_IRQ(AXP288, WBTU,                   2, 1),
> > > +	INIT_REGMAP_IRQ(AXP288, QWBTO,                  2, 2),
> > > +	INIT_REGMAP_IRQ(AXP288, WBTU,                   2, 3),
> > > +	INIT_REGMAP_IRQ(AXP288, QCBTU,                  2, 4),
> > > +	INIT_REGMAP_IRQ(AXP288, CBTU,                   2, 5),
> > > +	INIT_REGMAP_IRQ(AXP288, QCBTO,                  2, 6),
> > > +	INIT_REGMAP_IRQ(AXP288, CBTO,                   2, 7),
> > > +
> > > +	INIT_REGMAP_IRQ(AXP288, WL2,                    3, 0),
> > > +	INIT_REGMAP_IRQ(AXP288, WL1,                    3, 1),
> > > +	INIT_REGMAP_IRQ(AXP288, GPADC,                  3, 2),
> > > +	INIT_REGMAP_IRQ(AXP288, OT,                     3, 7),
> > > +
> > > +	INIT_REGMAP_IRQ(AXP288, GPIO0,                  4, 0),
> > > +	INIT_REGMAP_IRQ(AXP288, GPIO1,                  4, 1),
> > > +	INIT_REGMAP_IRQ(AXP288, POKO,                   4, 2),
> > > +	INIT_REGMAP_IRQ(AXP288, POKL,                   4, 3),
> > > +	INIT_REGMAP_IRQ(AXP288, POKS,                   4, 4),
> > > +	INIT_REGMAP_IRQ(AXP288, POKN,                   4, 5),
> > > +	INIT_REGMAP_IRQ(AXP288, POKP,                   4, 6),
> > > +	INIT_REGMAP_IRQ(AXP20X, TIMER,                  4, 7),
> > > +
> > > +	INIT_REGMAP_IRQ(AXP288, MV_CHNG,                5, 0),
> > > +	INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
> > >  };
> > > =20
> > >  static const struct of_device_id axp20x_of_match[] =3D {
> > > @@ -123,19 +231,26 @@ MODULE_DEVICE_TABLE(of, axp20x_of_match);
> > >  /*
> > >   * This is useless for OF-enabled devices, but it is needed by I=
2C
> > > subsystem */
> > > -static const struct i2c_device_id axp20x_i2c_id[] =3D {
> > > +static const struct i2c_device_id axp2xx_i2c_id[] =3D {
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, axp2xx_i2c_id);
> > > +
> > > +static struct acpi_device_id axp2xx_acpi_match[] =3D {
> > > +	{
> > > +		.id =3D "INT33F4",
> > > +		.driver_data =3D (kernel_ulong_t)AXP288_ID,
> > > +	},
> > >  	{ },
> > >  };
> > > -MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> > > +MODULE_DEVICE_TABLE(acpi, axp2xx_acpi_match);
> > > =20
> > > -static const struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
> > > -	.name			=3D "axp20x_irq_chip",
> > > +/* common irq chip attributes only */
> > > +static struct regmap_irq_chip axp2xx_regmap_irq_chip =3D {
> > > +	.name			=3D "axp2xx_irq_chip",
> > >  	.status_base		=3D AXP20X_IRQ1_STATE,
> > >  	.ack_base		=3D AXP20X_IRQ1_STATE,
> > >  	.mask_base		=3D AXP20X_IRQ1_EN,
> > > -	.num_regs		=3D 5,
> > > -	.irqs			=3D axp20x_regmap_irqs,
> > > -	.num_irqs		=3D ARRAY_SIZE(axp20x_regmap_irqs),
> > >  	.mask_invert		=3D true,
> > >  	.init_ack_masked	=3D true,
> > >  };
> > > @@ -161,98 +276,218 @@ static struct mfd_cell axp20x_cells[] =3D =
{
> > >  	},
> > >  };
> > > =20
> > > -static struct axp20x_dev *axp20x_pm_power_off;
> > > -static void axp20x_power_off(void)
> > > +static struct resource axp288_adc_resources[] =3D {
> > > +	{
> > > +		.name	=3D "GPADC",
> > > +		.start =3D AXP288_IRQ_GPADC,
> > > +		.end   =3D AXP288_IRQ_GPADC,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +};
> > > +
> > > +static struct resource axp288_charger_resources[] =3D {
> > > +	{
> > > +		.start =3D AXP288_IRQ_OV,
> > > +		.end   =3D AXP288_IRQ_OV,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_DONE,
> > > +		.end   =3D AXP288_IRQ_DONE,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_CHARGING,
> > > +		.end   =3D AXP288_IRQ_CHARGING,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_SAFE_QUIT,
> > > +		.end   =3D AXP288_IRQ_SAFE_QUIT,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_SAFE_ENTER,
> > > +		.end   =3D AXP288_IRQ_SAFE_ENTER,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_QCBTU,
> > > +		.end   =3D AXP288_IRQ_QCBTU,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_CBTU,
> > > +		.end   =3D AXP288_IRQ_CBTU,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_QCBTO,
> > > +		.end   =3D AXP288_IRQ_QCBTO,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +	{
> > > +		.start =3D AXP288_IRQ_CBTO,
> > > +		.end   =3D AXP288_IRQ_CBTO,
> > > +		.flags =3D IORESOURCE_IRQ,
> > > +	},
> > > +};
> > > +
> > > +static struct mfd_cell axp288_cells[] =3D {
> > > +	{
> > > +		.name =3D "axp288_adc",
> > > +		.num_resources =3D ARRAY_SIZE(axp288_adc_resources),
> > > +		.resources =3D axp288_adc_resources,
> > > +	},
> > > +	{
> > > +		.name =3D "axp288_charger",
> > > +		.num_resources =3D
> > > ARRAY_SIZE(axp288_charger_resources),
> > > +		.resources =3D axp288_charger_resources,
> > > +	},
> > > +	{
> > > +		.name =3D "axp288_battery",
> > > +		.num_resources =3D
> > > ARRAY_SIZE(axp288_battery_resources),
> > > +		.resources =3D axp288_battery_resources,
> > > +	},
> > > +};
> > > +
> > > +static struct axp2xx_dev *axp2xx_pm_power_off;
> > > +static void axp2xx_power_off(void)
> > >  {
> > > -	regmap_write(axp20x_pm_power_off->regmap, AXP20X_OFF_CTRL,
> > > +	if (axp2xx_pm_power_off->variant =3D=3D AXP288_ID)
> > > +		return;
> > > +	regmap_write(axp2xx_pm_power_off->regmap, AXP20X_OFF_CTRL,
> > >  		     AXP20X_OFF);
> > >  }
> > > =20
> > > -static int axp20x_i2c_probe(struct i2c_client *i2c,
> > > -			 const struct i2c_device_id *id)
> > > +static int axp2xx_match_device(struct axp2xx_dev *axp2xx, struct
> > > device *dev) {
> > > -	struct axp20x_dev *axp20x;
> > > +	const struct acpi_device_id *acpi_id;
> > >  	const struct of_device_id *of_id;
> > > +
> > > +	of_id =3D of_match_device(axp2xx_of_match, dev);
> > > +	if (of_id)
> > > +		axp2xx->variant =3D (long) of_id->data;
> > > +	else {
> > > +		acpi_id =3D
> > > acpi_match_device(dev->driver->acpi_match_table, dev);
> > > +		if (!acpi_id || !acpi_id->driver_data) {
> > > +			dev_err(dev, "Unable to determine ID\n");
> > > +			return -ENODEV;
> > > +		}
> > > +		axp2xx->variant =3D (long) acpi_id->driver_data;
> > > +	}
> > > +	switch (axp2xx->variant) {
> > > +	case AXP202_ID:
> > > +	case AXP209_ID:
> > > +		axp2xx->nr_cells =3D ARRAY_SIZE(axp20x_cells);
> > > +		axp2xx->cells =3D axp20x_cells;
> > > +		axp2xx->regmap_cfg =3D &axp20x_regmap_config;
> > > +		axp2xx_regmap_irq_chip.num_regs	=3D 5;
> > > +		axp2xx_regmap_irq_chip.irqs =3D axp20x_regmap_irqs;
> > > +		axp2xx_regmap_irq_chip.num_irqs	=3D
> > > +			ARRAY_SIZE(axp20x_regmap_irqs);
> > > +		break;
> > > +	case AXP288_ID:
> > > +		axp2xx->cells =3D axp288_cells;
> > > +		axp2xx->nr_cells =3D ARRAY_SIZE(axp288_cells);
> > > +		axp2xx->regmap_cfg =3D &axp288_regmap_config;
> > > +		axp2xx_regmap_irq_chip.irqs =3D axp288_regmap_irqs;
> > > +		axp2xx_regmap_irq_chip.num_irqs	=3D
> > > +			ARRAY_SIZE(axp288_regmap_irqs);
> > > +		axp2xx_regmap_irq_chip.num_regs	=3D 6;
> > > +		break;
> > > +	default:
> > > +		dev_err(dev, "unsupported AXP2XX ID %lu\n",
> > > axp2xx->variant);
> > > +		return -ENODEV;
> > > +	}
> > > +	dev_info(dev, "AXP2xx variant %s found\n",
> > > +		axp2xx_model_names[axp2xx->variant]);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int axp2xx_i2c_probe(struct i2c_client *i2c,
> > > +			const struct i2c_device_id *id)
> > > +{
> > > +	struct axp2xx_dev *axp2xx;
> > >  	int ret;
> > > =20
> > > -	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x),
> > > GFP_KERNEL);
> > > -	if (!axp20x)
> > > +	axp2xx =3D devm_kzalloc(&i2c->dev, sizeof(*axp2xx),
> > > GFP_KERNEL);
> > > +	if (!axp2xx)
> > >  		return -ENOMEM;
> > > =20
> > > -	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> > > -	if (!of_id) {
> > > -		dev_err(&i2c->dev, "Unable to setup AXP20X
> > > data\n");
> > > -		return -ENODEV;
> > > -	}
> > > -	axp20x->variant =3D (long) of_id->data;
> > > +	ret =3D axp2xx_match_device(axp2xx, &i2c->dev);
> > > +	if (ret)
> > > +		return ret;
> > > =20
> > > -	axp20x->i2c_client =3D i2c;
> > > -	axp20x->dev =3D &i2c->dev;
> > > -	dev_set_drvdata(axp20x->dev, axp20x);
> > > +	axp2xx->i2c_client =3D i2c;
> > > +	axp2xx->dev =3D &i2c->dev;
> > > +	dev_set_drvdata(axp2xx->dev, axp2xx);
> > > =20
> > > -	axp20x->regmap =3D devm_regmap_init_i2c(i2c,
> > > &axp20x_regmap_config);
> > > -	if (IS_ERR(axp20x->regmap)) {
> > > -		ret =3D PTR_ERR(axp20x->regmap);
> > > +	axp2xx->regmap =3D devm_regmap_init_i2c(i2c,
> > > axp2xx->regmap_cfg);
> > > +	if (IS_ERR(axp2xx->regmap)) {
> > > +		ret =3D PTR_ERR(axp2xx->regmap);
> > >  		dev_err(&i2c->dev, "regmap init failed: %d\n",
> > > ret); return ret;
> > >  	}
> > > =20
> > > -	ret =3D regmap_add_irq_chip(axp20x->regmap, i2c->irq,
> > > +	ret =3D regmap_add_irq_chip(axp2xx->regmap, i2c->irq,
> > >  				  IRQF_ONESHOT | IRQF_SHARED, -1,
> > > -				  &axp20x_regmap_irq_chip,
> > > -				  &axp20x->regmap_irqc);
> > > +				  &axp2xx_regmap_irq_chip,
> > > +				  &axp2xx->regmap_irqc);
> > >  	if (ret) {
> > >  		dev_err(&i2c->dev, "failed to add irq chip: %d\n",
> > > ret); return ret;
> > >  	}
> > > =20
> > > -	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x_cells,
> > > -			      ARRAY_SIZE(axp20x_cells), NULL, 0,
> > > NULL);
> > > +	ret =3D mfd_add_devices(axp2xx->dev, -1, axp2xx->cells,
> > > +			axp2xx->nr_cells, NULL, 0, NULL);
> > > =20
> > >  	if (ret) {
> > >  		dev_err(&i2c->dev, "failed to add MFD devices:
> > > %d\n", ret);
> > > -		regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> > > +		regmap_del_irq_chip(i2c->irq, axp2xx->regmap_irqc);
> > >  		return ret;
> > >  	}
> > > =20
> > >  	if (!pm_power_off) {
> > > -		axp20x_pm_power_off =3D axp20x;
> > > -		pm_power_off =3D axp20x_power_off;
> > > +		axp2xx_pm_power_off =3D axp2xx;
> > > +		pm_power_off =3D axp2xx_power_off;
> > >  	}
> > > =20
> > > -	dev_info(&i2c->dev, "AXP20X driver loaded\n");
> > > +	dev_info(&i2c->dev, "AXP2XX driver loaded\n");
> > > =20
> > >  	return 0;
> > >  }
> > > =20
> > > -static int axp20x_i2c_remove(struct i2c_client *i2c)
> > > +static int axp2xx_i2c_remove(struct i2c_client *i2c)
> > >  {
> > > -	struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> > > +	struct axp2xx_dev *axp2xx =3D i2c_get_clientdata(i2c);
> > > =20
> > > -	if (axp20x =3D=3D axp20x_pm_power_off) {
> > > -		axp20x_pm_power_off =3D NULL;
> > > +	if (axp2xx =3D=3D axp2xx_pm_power_off) {
> > > +		axp2xx_pm_power_off =3D NULL;
> > >  		pm_power_off =3D NULL;
> > >  	}
> > > =20
> > > -	mfd_remove_devices(axp20x->dev);
> > > -	regmap_del_irq_chip(axp20x->i2c_client->irq,
> > > axp20x->regmap_irqc);
> > > +	mfd_remove_devices(axp2xx->dev);
> > > +	regmap_del_irq_chip(axp2xx->i2c_client->irq,
> > > axp2xx->regmap_irqc);=20
> > >  	return 0;
> > >  }
> > > =20
> > > -static struct i2c_driver axp20x_i2c_driver =3D {
> > > +static struct i2c_driver axp2xx_i2c_driver =3D {
> > >  	.driver =3D {
> > > -		.name	=3D "axp20x",
> > > +		.name	=3D "axp2xx",
> > >  		.owner	=3D THIS_MODULE,
> > > -		.of_match_table	=3D
> > > of_match_ptr(axp20x_of_match),
> > > +		.of_match_table	=3D
> > > of_match_ptr(axp2xx_of_match),
> > > +		.acpi_match_table =3D ACPI_PTR(axp2xx_acpi_match),
> > >  	},
> > > -	.probe		=3D axp20x_i2c_probe,
> > > -	.remove		=3D axp20x_i2c_remove,
> > > -	.id_table	=3D axp20x_i2c_id,
> > > +	.probe		=3D axp2xx_i2c_probe,
> > > +	.remove		=3D axp2xx_i2c_remove,
> > > +	.id_table	=3D axp2xx_i2c_id,
> > >  };
> > > =20
> > > -module_i2c_driver(axp20x_i2c_driver);
> > > +module_i2c_driver(axp2xx_i2c_driver);
> > > =20
> > > -MODULE_DESCRIPTION("PMIC MFD core driver for AXP20X");
> > > +MODULE_DESCRIPTION("PMIC MFD core driver for AXP2XX");
> > >  MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
> > >  MODULE_LICENSE("GPL");
> > > diff --git a/include/linux/mfd/axp2xx.h b/include/linux/mfd/axp2x=
x.h
> > > index a36d91b..331cf6e 100644
> > > --- a/include/linux/mfd/axp2xx.h
> > > +++ b/include/linux/mfd/axp2xx.h
> > > @@ -14,6 +14,8 @@
> > >  enum {
> > >  	AXP202_ID =3D 0,
> > >  	AXP209_ID,
> > > +	AXP288_ID,
> > > +	NR_AXP2XX_VARIANTS,
> > >  };
> > > =20
> > >  #define AXP20X_DATACACHE(m)		(0x04 + (m))
> > > @@ -49,11 +51,13 @@ enum {
> > >  #define AXP20X_IRQ3_EN			0x42
> > >  #define AXP20X_IRQ4_EN			0x43
> > >  #define AXP20X_IRQ5_EN			0x44
> > > +#define AXP20X_IRQ6_EN			0x45
> > >  #define AXP20X_IRQ1_STATE		0x48
> > >  #define AXP20X_IRQ2_STATE		0x49
> > >  #define AXP20X_IRQ3_STATE		0x4a
> > >  #define AXP20X_IRQ4_STATE		0x4b
> > >  #define AXP20X_IRQ5_STATE		0x4c
> > > +#define AXP20X_IRQ6_STATE		0x4d
> > > =20
> > >  /* ADC */
> > >  #define AXP20X_ACIN_V_ADC_H		0x56
> > > @@ -116,6 +120,15 @@ enum {
> > >  #define AXP20X_CC_CTRL			0xb8
> > >  #define AXP20X_FG_RES			0xb9
> > > =20
> > > +/* AXP288 specific registers */
> > > +#define AXP288_PMIC_ADC_H               0x56
> > > +#define AXP288_PMIC_ADC_L               0x57
> > > +#define AXP288_ADC_TS_PIN_CTRL          0x84
> > > +
> > > +#define AXP288_PMIC_ADC_EN              0x84
> > > +#define AXP288_FG_TUNE5			0xed
> > > +
> > > +
> > >  /* Regulators IDs */
> > >  enum {
> > >  	AXP20X_LDO1 =3D 0,
> > > @@ -169,12 +182,57 @@ enum {
> > >  	AXP20X_IRQ_GPIO0_INPUT,
> > >  };
> > > =20
> > > -struct axp20x_dev {
> > > +enum axp288_irqs {
> > > +	AXP288_IRQ_VBUS_FALL     =3D 2,
> > > +	AXP288_IRQ_VBUS_RISE,
> > > +	AXP288_IRQ_OV,
> > > +	AXP288_IRQ_FALLING_ALT,
> > > +	AXP288_IRQ_RISING_ALT,
> > > +	AXP288_IRQ_OV_ALT,
> > > +	AXP288_IRQ_DONE          =3D 10,
> > > +	AXP288_IRQ_CHARGING,
> > > +	AXP288_IRQ_SAFE_QUIT,
> > > +	AXP288_IRQ_SAFE_ENTER,
> > > +	AXP288_IRQ_ABSENT,
> > > +	AXP288_IRQ_APPEND,
> > > +	AXP288_IRQ_QWBTU,
> > > +	AXP288_IRQ_WBTU,
> > > +	AXP288_IRQ_QWBTO,
> > > +	AXP288_IRQ_WBTO,
> > > +	AXP288_IRQ_QCBTU,
> > > +	AXP288_IRQ_CBTU,
> > > +	AXP288_IRQ_QCBTO,
> > > +	AXP288_IRQ_CBTO,
> > > +	AXP288_IRQ_WL2,
> > > +	AXP288_IRQ_WL1,
> > > +	AXP288_IRQ_GPADC,
> > > +	AXP288_IRQ_OT            =3D 31,
> > > +	AXP288_IRQ_GPIO0,
> > > +	AXP288_IRQ_GPIO1,
> > > +	AXP288_IRQ_POKO,
> > > +	AXP288_IRQ_POKL,
> > > +	AXP288_IRQ_POKS,
> > > +	AXP288_IRQ_POKN,
> > > +	AXP288_IRQ_POKP,
> > > +	AXP288_IRQ_TIMER,
> > > +	AXP288_IRQ_MV_CHNG,
> > > +	AXP288_IRQ_BC_USB_CHNG,
> > > +};
> > > +
> > > +#define AXP288_TS_ADC_H		0x58
> > > +#define AXP288_TS_ADC_L		0x59
> > > +#define AXP288_GP_ADC_H		0x5a
> > > +#define AXP288_GP_ADC_L		0x5b
> > > +
> > > +struct axp2xx_dev {
> > >  	struct device			*dev;
> > >  	struct i2c_client		*i2c_client;
> > >  	struct regmap			*regmap;
> > >  	struct regmap_irq_chip_data	*regmap_irqc;
> > >  	long				variant;
> > > +	int                             nr_cells;
> > > +	struct mfd_cell                 *cells;
> > > +	struct regmap_config            *regmap_cfg;
> > >  };
> > > =20
> > >  #endif /* __LINUX_MFD_AXP2XX_H */
> >=20
>=20
> [Jacob Pan]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
