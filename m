From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 04/13] mtd: st_spi_fsm: Fetch boot device locations
 from DT match tables
Date: Wed, 21 Jan 2015 12:56:23 +0000
Message-ID: <20150121125623.GB22024@x1>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <1418644760-18773-5-git-send-email-lee.jones@linaro.org>
 <20150113045511.GO9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150113045511.GO9759@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jan 2015, Brian Norris wrote:

> + devicetree
>=20
> On Mon, Dec 15, 2014 at 11:59:11AM +0000, Lee Jones wrote:
> > To trim down on the amount of properties used by this driver and to=
 conform
> > to the newly agreed method of acquiring syscfg registers/offsets, w=
e now
> > obtain this information using match tables.
> >=20
> > In the process we are deprecating the old generic compatible string=
 and
> > providing 3 shiny new ones for each of the support platforms.  The
> > deprecated compatible string will be removed in due course.
>=20
> I'm not sure how this agreement was done, but by default, we expect n=
ot
> to break backwards compatibility. This patch does just that.
>=20
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/mtd/devices/st_spi_fsm.c | 75 ++++++++++++++++++++++++++++=
++----------
> >  1 file changed, 57 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices=
/st_spi_fsm.c
> > index fac0fe9..d82394a 100644
> > --- a/drivers/mtd/devices/st_spi_fsm.c
> > +++ b/drivers/mtd/devices/st_spi_fsm.c
> > @@ -29,6 +29,21 @@
> >  #include "serial_flash_cmds.h"
> > =20
> >  /*
> > + * FSM SPI Boot Mode Registers/Masks
> > + */
> > +#define STID127_SYSCON_BOOT_DEV_REG	0x0D8
> > +#define STID127_SYSCON_BOOT_DEV_SPI	0x068
> > +#define STID127_SYSCON_BOOT_DEV_MASK	0x07C
> > +
> > +#define STIH407_SYSCON_BOOT_DEV_REG	0x8C4
> > +#define STIH407_SYSCON_BOOT_DEV_SPI	0x068
> > +#define STIH407_SYSCON_BOOT_DEV_MASK	0x07C
> > +
> > +#define STIH416_SYSCON_BOOT_DEV_REG	0x958
> > +#define STIH416_SYSCON_BOOT_DEV_SPI	0x01A
> > +#define STIH416_SYSCON_BOOT_DEV_MASK	0x01F
> > +
> > +/*
> >   * FSM SPI Controller Registers
> >   */
> >  #define SPI_CLOCKDIV			0x0010
> > @@ -288,6 +303,12 @@ struct seq_rw_config {
> >  	uint8_t         dummy_cycles;   /* No. of DUMMY cycles */
> >  };
> > =20
> > +struct stfsm_boot_dev {
> > +	uint32_t		reg;
> > +	uint32_t		spi;
> > +	uint32_t		mask;
> > +};
> > +
> >  /* SPI Flash Device Table */
> >  struct flash_info {
> >  	char            *name;
> > @@ -313,6 +334,24 @@ struct flash_info {
> >  	int             (*config)(struct stfsm *);
> >  };
> > =20
> > +static struct stfsm_boot_dev stfsm_stid127_data =3D {
> > +	.reg  =3D STID127_SYSCON_BOOT_DEV_REG,
> > +	.spi  =3D STID127_SYSCON_BOOT_DEV_SPI,
> > +	.mask =3D STID127_SYSCON_BOOT_DEV_MASK,
> > +};
> > +
> > +static struct stfsm_boot_dev stfsm_stih407_data =3D {
> > +	.reg  =3D STIH407_SYSCON_BOOT_DEV_REG,
> > +	.spi  =3D STIH407_SYSCON_BOOT_DEV_SPI,
> > +	.mask =3D STIH407_SYSCON_BOOT_DEV_MASK,
> > +};
> > +
> > +static struct stfsm_boot_dev stfsm_stih416_data =3D {
> > +	.reg  =3D STIH416_SYSCON_BOOT_DEV_REG,
> > +	.spi  =3D STIH416_SYSCON_BOOT_DEV_SPI,
> > +	.mask =3D STIH416_SYSCON_BOOT_DEV_MASK,
> > +};
> > +
> >  static int stfsm_n25q_config(struct stfsm *fsm);
> >  static int stfsm_mx25_config(struct stfsm *fsm);
> >  static int stfsm_s25fl_config(struct stfsm *fsm);
> > @@ -1977,14 +2016,23 @@ static int stfsm_init(struct stfsm *fsm)
> >  	return 0;
> >  }
> > =20
> > +static const struct of_device_id stfsm_match[] =3D {
> > +	{ .compatible =3D "st,spi-fsm" }, /* DEPRECATED */
> > +	{ .compatible =3D "st,stid127-spi-fsm", .data =3D &stfsm_stid127_=
data },
> > +	{ .compatible =3D "st,stih407-spi-fsm", .data =3D &stfsm_stih407_=
data },
> > +	{ .compatible =3D "st,stih416-spi-fsm", .data =3D &stfsm_stih416_=
data },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, stfsm_match);
> > +
> >  static void stfsm_fetch_platform_configs(struct platform_device *p=
dev)
> >  {
> >  	struct stfsm *fsm =3D platform_get_drvdata(pdev);
> >  	struct device_node *np =3D pdev->dev.of_node;
> > +	const struct stfsm_boot_dev *boot_dev;
> > +	const struct of_device_id *match;
> >  	struct regmap *regmap;
> > -	uint32_t boot_device_reg;
> > -	uint32_t boot_device_spi;
> > -	uint32_t boot_device;     /* Value we read from *boot_device_reg =
*/
> > +	uint32_t boot_device;    /* Value we read from the boot dev mode =
pins */
> >  	int ret;
> > =20
> >  	/* Booting from SPI NOR Flash is the default */
> > @@ -1998,21 +2046,18 @@ static void stfsm_fetch_platform_configs(st=
ruct platform_device *pdev)
> > =20
> >  	fsm->reset_por =3D of_property_read_bool(np, "st,reset-por");
> > =20
> > -	/* Where in the syscon the boot device information lives */
> > -	ret =3D of_property_read_u32(np, "st,boot-device-reg", &boot_devi=
ce_reg);
> > -	if (ret)
> > +	match =3D of_match_node(stfsm_match, np);
> > +	if (!match)
> >  		goto boot_device_fail;
> > +	boot_dev =3D match->data;
> > =20
> > -	/* Boot device value when booted from SPI NOR */
> > -	ret =3D of_property_read_u32(np, "st,boot-device-spi", &boot_devi=
ce_spi);
> > +	ret =3D regmap_read(regmap, boot_dev->reg, &boot_device);
>=20
>=20
> ^^^ NULL pointer dereference for any existing DTB that uses the
> "st,spi-fsm" compatible string. So I'll NAK this patch as-is. Either =
we
> need to completely drop the "deprecated" compatible property (what's =
the
> point binding to it, if we're going to OOPS on it anyway), or else we
> need to maintain both methods (at least for whatever deprecation peri=
od
> is deemed acceptable).

Great spot Brian.

So, as I explained in reply to the cover-letter, this driver isn't
being used in anger yet.  As the driver is still considered
in-progress I take the view that it's perfectly okay to remove the old
compatible string and not match on it at all.

I'll make the necessary changes and re-submit.

> >  	if (ret)
> >  		goto boot_device_fail;
> > =20
> > -	ret =3D regmap_read(regmap, boot_device_reg, &boot_device);
> > -	if (ret)
> > -		goto boot_device_fail;
> > +	boot_device &=3D boot_dev->mask;
> > =20
> > -	if (boot_device !=3D boot_device_spi)
> > +	if (boot_device !=3D boot_dev->spi)
> >  		fsm->booted_from_spi =3D false;
> > =20
> >  	return;
> > @@ -2156,12 +2201,6 @@ static int stfsmfsm_resume(struct device *de=
v)
> > =20
> >  static SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_=
resume);
> > =20
> > -static const struct of_device_id stfsm_match[] =3D {
> > -	{ .compatible =3D "st,spi-fsm", },
> > -	{},
> > -};
> > -MODULE_DEVICE_TABLE(of, stfsm_match);
> > -
> >  static struct platform_driver stfsm_driver =3D {
> >  	.probe		=3D stfsm_probe,
> >  	.remove		=3D stfsm_remove,
>=20
> Brian

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
