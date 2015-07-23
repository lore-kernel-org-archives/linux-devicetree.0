From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] mfd: 88pm800: Add support for clk subdevice
Date: Thu, 23 Jul 2015 16:50:08 +0100
Message-ID: <20150723155008.GS3436@x1>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1437476823-3358-5-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437476823-3358-5-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jul 2015, Vaibhav Hiremath wrote:

> This patch adds mfd_cell/clk-subdevice for 88PM800 MFD
> (and family of devices).
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/88pm800.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index f104a32..9723eac 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -173,6 +173,14 @@ static const struct mfd_cell regulator_devs[] =3D=
 {
>  	},
>  };
> =20
> +static struct mfd_cell clk_devs[] =3D {
> +	{
> +	 .name =3D "88pm80x-clk",
> +	 .of_compatible =3D "marvell,88pm800-clk",
> +	 .id =3D -1,
> +	},
> +};

Why does each device in 88pm800.c have it's own mfd_cell?

Take the opportunity to correct the tabbing in the remainder of the
file.  Make that fix-up patch 1 of this set.  Then fixup this patch.

>  static const struct regmap_irq pm800_irqs[] =3D {
>  	/* INT0 */
>  	[PM800_IRQ_ONKEY] =3D {
> @@ -344,6 +352,17 @@ static int device_regulator_init(struct pm80x_ch=
ip *chip)
>  			      ARRAY_SIZE(regulator_devs), NULL, 0, NULL);
>  }
> =20
> +static int device_clk_init(struct pm80x_chip *chip)
> +{
> +	if (chip->type =3D=3D CHIP_PM800)
> +		clk_devs[0].name =3D "88pm800-clk";
> +	else if (chip->type =3D=3D CHIP_PM860)
> +		clk_devs[0].name =3D "88pm860-clk";
> +
> +	return mfd_add_devices(chip->dev, 0, &clk_devs[0],
> +			      ARRAY_SIZE(clk_devs), NULL, 0, NULL);
> +}
> +
>  static int device_irq_init_800(struct pm80x_chip *chip)
>  {
>  	struct regmap *map =3D chip->regmap;
> @@ -513,6 +532,12 @@ static int device_800_init(struct pm80x_chip *ch=
ip)
>  		goto out;
>  	}
> =20
> +	ret =3D device_clk_init(chip);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to add clk subdev\n");
> +		goto out;
> +	}

Why do these have to be seperate?

>  	return 0;
>  out_dev:
>  	mfd_remove_devices(chip->dev);

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
