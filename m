From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 5/5] mfd: 88pm800: Add support for clk subdevice
Date: Tue, 25 Aug 2015 08:49:24 +0100
Message-ID: <20150825074924.GD19409@x1>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1440442594-3102-7-git-send-email-vaibhav.hiremath@linaro.org>
 <55DBFC40.3010603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DBFC40.3010603-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Aug 2015, Krzysztof Kozlowski wrote:

> On 25.08.2015 03:56, Vaibhav Hiremath wrote:
> > This patch adds mfd_cell/clk-subdevice for 88PM800 MFD
> > (and family of devices).
> >=20
> > Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/mfd/88pm800.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >=20
> > diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> > index c4e097d..a928eed 100644
> > --- a/drivers/mfd/88pm800.c
> > +++ b/drivers/mfd/88pm800.c
> > @@ -173,6 +173,14 @@ static const struct mfd_cell regulator_devs[] =
=3D {
> >  	},
> >  };
> > =20
> > +static struct mfd_cell clk_devs[] =3D {
> > +	{
> > +		.name =3D "88pm80x-clk",
> > +		.of_compatible =3D "marvell,88pm800-clk",
> > +		.id =3D -1,
>=20
> The "-1" here stands for PLATFORM_DEVID_NONE?

Right.  Please use the define, but use it in the mfd_add_devices()
call, rather than individual cells.

> > +	},
> > +};
> > +
> >  static const struct regmap_irq pm800_irqs[] =3D {
> >  	/* INT0 */
> >  	[PM800_IRQ_ONKEY] =3D {
> > @@ -344,6 +352,17 @@ static int device_regulator_init(struct pm80x_=
chip *chip)
> >  			ARRAY_SIZE(regulator_devs), NULL, 0, NULL);
> >  }
> > =20
> > +static int device_clk_init(struct pm80x_chip *chip)
> > +{
> > +	if (chip->type =3D=3D CHIP_PM800)
> > +		clk_devs[0].name =3D "88pm800-clk";
> > +	else if (chip->type =3D=3D CHIP_PM860)
> > +		clk_devs[0].name =3D "88pm860-clk";
> > +
> > +	return mfd_add_devices(chip->dev, 0, &clk_devs[0],
> > +			ARRAY_SIZE(clk_devs), NULL, 0, NULL);
> > +}
> > +
> >  static int device_irq_init_800(struct pm80x_chip *chip)
> >  {
> >  	struct regmap *map =3D chip->regmap;
> > @@ -511,6 +530,12 @@ static int device_800_init(struct pm80x_chip *=
chip)
> >  		goto out;
> >  	}
> > =20
> > +	ret =3D device_clk_init(chip);
> > +	if (ret) {
> > +		dev_err(chip->dev, "Failed to add clk subdev\n");
> > +		goto out;
> > +	}
> > +
> >  	return 0;
> >  out_dev:
> >  	mfd_remove_devices(chip->dev);
> >=20
>=20

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
