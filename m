From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/9] mfd: axp20x: Whitespace, open
 parenthesis alignment code style fixes
Date: Mon, 11 Jan 2016 09:24:54 +0000
Message-ID: <20160111092454.GJ14104@x1>
References: <1450283538-25067-1-git-send-email-wens@csie.org>
 <1450283538-25067-6-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB2XJZW2AKGQE5QPXVDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450283538-25067-6-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-9oqZluOz41k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 17 Dec 2015, Chen-Yu Tsai wrote:

> This fixes some leftover code style issues in the axp20x core.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/axp20x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 631ad64ddf69..54a00168da26 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -591,14 +591,14 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  			dev_err(dev, "Unable to match OF ID\n");
>  			return -ENODEV;
>  		}
> -		axp20x->variant =3D (long) of_id->data;
> +		axp20x->variant =3D (long)of_id->data;
>  	} else {
>  		acpi_id =3D acpi_match_device(dev->driver->acpi_match_table, dev);
>  		if (!acpi_id || !acpi_id->driver_data) {
>  			dev_err(dev, "Unable to match ACPI ID and data\n");
>  			return -ENODEV;
>  		}
> -		axp20x->variant =3D (long) acpi_id->driver_data;
> +		axp20x->variant =3D (long)acpi_id->driver_data;
>  	}
> =20
>  	switch (axp20x->variant) {
> @@ -632,7 +632,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		return -EINVAL;
>  	}
>  	dev_info(dev, "AXP20x variant %s found\n",
> -		axp20x_model_names[axp20x->variant]);
> +		 axp20x_model_names[axp20x->variant]);
> =20
>  	return 0;
>  }
> @@ -652,7 +652,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>  	}
> =20
>  	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x->cells,
> -			axp20x->nr_cells, NULL, 0, NULL);
> +			      axp20x->nr_cells, NULL, 0, NULL);
> =20
>  	if (ret) {
>  		dev_err(axp20x->dev, "failed to add MFD devices: %d\n", ret);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
