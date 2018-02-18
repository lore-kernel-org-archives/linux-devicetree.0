Return-Path: <SRS0=+Lk9=FM=atomide.com=tony@kernel.org>
Date: Sun, 18 Feb 2018 09:50:27 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] phy: mapphone-mdm6600: Add USB PHY driver for MDM6600 on
 Droid 4
Message-ID: <20180218175027.GW6364@atomide.com>
References: <20180217210723.7013-1-tony@atomide.com>
 <20180218003139.qiojzvfnbb5vdmrj@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180218003139.qiojzvfnbb5vdmrj@earth.universe>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marcel Partap <mpartap@gmx.net>, Michael Scott <michael.scott@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

* Sebastian Reichel <sre@kernel.org> [180218 00:32]:
> On Sat, Feb 17, 2018 at 01:07:23PM -0800, Tony Lindgren wrote:
> > For reference here is what I measured for total power consumption on
> > an idle Droid 4 with and without USB related MDM6600 modules:
> >=20
> > idle lcd off	phy-mapphone-mdm6600	ohci-platform
> > 153mW		284mW			344mW
>=20
> So more than twice the idle power... We really want to get runtime
> PM working :/

Yes and we want' modem to idle too :)

> > +/*
> > + * MDM6600 status codes. These are copied from Motorola Mapphone Linux
> > + * kernel tree. The BB naming here refers to "BaseBand" for modem.
> > + */
>=20
> Actually your status codes are BP_ (baseband processor) prefixed.

I'll just get rid of the naming and stick to MDM6600 prefixies.
No need to keep the confusing BP/AP prefixes.

> > +static void phy_mdm6600_init_irq(struct phy_mdm6600 *ddata)
> > +{
> > +	struct device *dev =3D ddata->dev;
> > +	int i, error, irq;
> > +
> > +	for (i =3D PHY_MDM6600_STATUS0;
> > +	     i <=3D PHY_MDM6600_STATUS2; i++) {
> > +		if (IS_ERR(ddata->gpio[i]))
> > +			continue;
>=20
> This can be dropped, since the driver errors out of probe
> when there are gpio errors.

True will drop.

> > +static int phy_mdm6600_init_lines(struct phy_mdm6600 *ddata)
> > +{
> > +	struct device *dev =3D ddata->dev;
> > +	int i, j, nr_gpio =3D 0;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(phy_mdm6600_line_map); i++) {
> > +		const struct phy_mdm6600_map *map =3D
> > +			&phy_mdm6600_line_map[i];
> > +
> > +		for (j =3D 0; j < map->nr_gpios; j++) {
> > +			struct gpio_desc **gpio =3D &ddata->gpio[nr_gpio];
> > +
> > +			*gpio =3D devm_gpiod_get_index(dev,
> > +						     map->name, j,
> > +						     map->direction);
> > +			if (IS_ERR(*gpio)) {
> > +				dev_info(dev,
> > +					 "gpio %s error %li, already taken?\n",
> > +					 map->name, PTR_ERR(*gpio));
> > +				return PTR_ERR(*gpio);
> > +			}
> > +			nr_gpio++;
> > +		}
>=20
> I think the code should use the gpiod_get_array() API.

OK thanks will take a look.

> > +	/* Give up shared GPIOs now, they will be used for OOB wake */
> > +	devm_gpiod_put(ddata->dev, mode_gpio0);
> > +	ddata->gpio[PHY_MDM6600_MODE0] =3D ERR_PTR(-ENODEV);
> > +	devm_gpiod_put(ddata->dev, mode_gpio1);
> > +	ddata->gpio[PHY_MDM6600_MODE0] =3D ERR_PTR(-ENODEV);
>=20
> You want PHY_MDM6600_MODE1 instead. Also I would just use NULL.
> NULL is used by gpiod_get_optional and is handled by the gpiod
> functions, so you don't need to check for gpio errors everywhere.

Oops yup let's just drop this until we know what to do in the
further patches.

> > +#ifdef CONFIG_OF
> > +static const struct of_device_id phy_mdm6600_id_table[] =3D {
> > +	{ .compatible =3D "motorola,mapphone-mdm6600", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, phy_mdm6600_id_table);
> > +#endif
>=20
> I suggest to just depend on CONFIG_OF in Kconfig and drop the ifdef
> and of_match_ptr() parts. It's very unlikely, that this will be
> used without DT and would need quite some rework anyways.

OK

> > +static int phy_mdm6600_probe(struct platform_device *pdev)
> > +{
> > +	struct phy_mdm6600 *ddata;
> > +	struct usb_otg *otg;
> > +	const struct of_device_id *of_id;
> > +	int error;
> > +
> > +	of_id =3D of_match_device(of_match_ptr(phy_mdm6600_id_table),
> > +				&pdev->dev);
> > +	if (!of_id)
> > +		return -EINVAL;
>=20
> I suggest to drop the of_match_device(). The driver will error
> out anyways when it can't get the gpios.

OK

> Generally I'm a bit worried about handling the mode gpios in two
> different drivers. It looks like it might become a dependency hell.

Yeah you're right. That will require the modules to be loaded
in the right order. It's probably best that we handle the mdm6600
to SoC wake-up in this driver. And then maybe export a function for
toggling the SoC to mdm660 wake to make sure the dependencies are
clear for the modules.

Regards,

Tony
