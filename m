From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pinctrl: axp209: add pinctrl features
Date: Tue, 26 Sep 2017 15:00:09 +0200
Message-ID: <20170926130009.r5isgrjvkwmm44nn@flea>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <6b89df1bf07dac2ab295fca5fdf0e55179c47ed6.1506428208.git-series.quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zwon7ho3f6pymg7r"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6b89df1bf07dac2ab295fca5fdf0e55179c47ed6.1506428208.git-series.quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zwon7ho3f6pymg7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 12:17:12PM +0000, Quentin Schulz wrote:
> +static const struct axp20x_desc_pin axp209_pins[] =3D {
> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(0, "GPIO0"),
> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> +		   AXP20X_FUNCTION(0x2, "gpio_in"),
> +		   AXP20X_FUNCTION(0x3, "ldo"),
> +		   AXP20X_FUNCTION(0x4, "adc")),
> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(1, "GPIO1"),
> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> +		   AXP20X_FUNCTION(0x2, "gpio_in"),
> +		   AXP20X_FUNCTION(0x3, "ldo"),
> +		   AXP20X_FUNCTION(0x4, "adc")),
> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(2, "GPIO2"),
> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> +		   AXP20X_FUNCTION(0x2, "gpio_in")),
> +};

If all the functions are the same, and at the same offset, can't we
just hardcode it, instead of having (and duplicate) all the logic
below?

> +	pctrl_desc =3D devm_kzalloc(&pdev->dev, sizeof(*pctrl_desc), GFP_KERNEL=
);
> +	if (!pctrl_desc)
> +		return -ENOMEM;
> +
> +	pctrl_desc->name =3D dev_name(&pdev->dev);
> +	pctrl_desc->owner =3D THIS_MODULE;
> +	pctrl_desc->pins =3D pins;
> +	pctrl_desc->npins =3D gpio->desc->npins;
> +	pctrl_desc->pctlops =3D &axp20x_pctrl_ops;
> +	pctrl_desc->pmxops =3D &axp20x_pmx_ops;

The strict flag needs to be set too in order to avoid concurrent uses
of GPIO and other functions.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zwon7ho3f6pymg7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyk9ZAAoJEBx+YmzsjxAgHUMP/jdnAoW+NW671JvsQButg4ed
8mAloBN8CKXNaq2GxAiHb00pmwknjQuhnnOkj9wZao2zyQXJww/M/nEEvrrkBeJQ
XlzhGOEncJW2PDdVehSFKP4ZGl64M5Odkml57vsw2mlYGo53TvhpUhmIzxuFaCaL
i7sYgSu44xdb47EYI7ROEHwusMgvLY+qrUT9Euzd4FzOEokvaV2ECUtLGqoDGhqM
wfN4dfMfxthWZ+8nxVcWNwlv/iGXWWZm0zIlIQrv7EpQIv/2buX2HPBq+JbE4+4R
YABgU4dE+hxkF10DE+5xpm/RJC6r8pWU811mZrVWmhw+lkr5xaAA9tWSYGAtDyH3
iW+NGn69M1tuhipsDelpNZXSHggnqfefwQRb7LsiF6AYqkoX6rlSFsiu3BolekOa
m//wpY9/CG6EZk2cs4XygS9gFU39nxc44Wtj4m3Uxud6ekj9Pk0mEiLE0XzDxFDw
kE49vRdaw0MlAogJ7p/rNhWJNb1m2+t6pAdPiNrf/97K+PerqlnU/FkcJ/ZXNmFo
4XaxyBPrQUg77b3RZi3e5uBPpJOM8t99uLTOYCnhsw0SQ0mIwHGy2mn8PCUBzQbA
0PRlV2N2FXN//WW1FnqDQLzePrK4Alp0590UaoLjObdsn0335jzwkcBv+/jffu8Z
sAD4qzmnTDPuECGSqHM6
=Uu8I
-----END PGP SIGNATURE-----

--zwon7ho3f6pymg7r--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
