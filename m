From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: dwc3: of-simple: add support for shared and pulsed reset lines
Date: Mon, 29 Jan 2018 10:18:28 +0200
Message-ID: <87fu6pjcx7.fsf@linux.intel.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com> <20180128200333.20093-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180128200333.20093-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
> Some SoCs (such as Amlogic Meson GXL for example) share the reset line
> with other components (in case of the Meson GXL example there's a shared
> reset line between the USB2 PHYs, USB3 PHYs and the dwc3 controller).
> Additionally SoC implementations may prefer a reset pulse over level
> resets.
>
> Add an internal per-of_device_id struct which can be used to configure
> whether the reset lines are shared and whether they use level or pulse
> resets.
>
> For now this falls back to the old defaults, which are:
> - reset lines are exclusive
> - level resets are being used
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/usb/dwc3/dwc3-of-simple.c | 65 ++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 54 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of=
-simple.c
> index 7ae0eefc7cc7..ceb9f0cd822a 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -22,11 +22,22 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>=20=20
> +/**
> + * struct dwc3_of_simple_params - hardware specific parameters
> + * @shared_resets: indicates that the resets are shared or exclusive
> + * @pulse_resets: use a reset pulse instead of level based resets
> + */
> +struct dwc3_of_simple_params {
> +	bool			shared_resets;
> +	bool			pulse_resets;
> +};
> +
>  struct dwc3_of_simple {
>  	struct device		*dev;
>  	struct clk		**clks;
>  	int			num_clocks;
>  	struct reset_control	*resets;
> +	const struct dwc3_of_simple_params	*params;

instead, you can add these two fields here:

	bool shared_resets;
        bool pulse_resets;

and ...

> @@ -90,17 +101,26 @@ static int dwc3_of_simple_probe(struct platform_devi=
ce *pdev)
>=20=20
>  	platform_set_drvdata(pdev, simple);
>  	simple->dev =3D dev;
> +	simple->params =3D of_device_get_match_data(dev);
>=20=20
> -	simple->resets =3D of_reset_control_array_get_optional_exclusive(np);
> +	simple->resets =3D of_reset_control_array_get(np,
> +						simple->params->shared_resets,
> +						true);

wrap this with a of_device_is_compatible() check:

	if (of_device_is_compatible(dev->of_node, "foobar")) {
        	simple->shared_resets =3D true;
		simple->pulse_resets =3D true;
	}

or something like that. Then we don't need to add a new
dwc3_of_simple_params for everybody.

Also, the why isn't the reset type (pulse vs level) handled by reset
framework itself? Why does dwc3-of-simple need to know about it?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlpu2NYACgkQzL64meEa
mQYGgRAA3ep5SbIUVP+PfD0lzEaNyeumwtBOFAbWHo/BaUyE+HdQYjOcCmZjcC17
kPfO3c4i1e+GK/H2GY/uhlnKfDt3SbKxB6FZH2Fn0mQUOjlY9CKiXwf5hDtD8bwU
2889EyTO0ms8OZGXGNruuAS/pKbEYqOx1FDd0Ibl9JibLNO35Ofz/jVo9mpl2+GR
SIQU/qtKLd6DUnvX54ymWvsoTvy4UEqu9M0lhB9YE+NJgV2iLaoWQ6V+n8jQsBOb
rxFmzAbt+4/SPPp7DNDoeRN//3GmG/W7geKiYvLFbM+0I5sseNHDXKlI9ofDML7L
xxGO5Hn5s34NUMCw0KZkBZsW2ZceDRCW83czbaZCzr5vEHWmcawP+iX/6evbasZ1
49gKUGc/QxlJgn6TVgx8V5F8GfePq0J3sNqzfbXAGMuczgYFy//mU0wnSemGDnRu
3rA8AQwAtZ17OMk5BnRAQrxxXFdZE3SS6wb/bnoLJqRATj47W4iR2E0ufYy7L6HA
h331rxZgW2vVTkvS30gO1dFdBchD02dG3fccvyGXsw3Ah55MBawtpVjFA52vMgvy
xiyBs1IXt0OKI6uiWEJ5f7nDG4T57Nvh3lxilNZK6U+zpWKvg+fb7rtIkQF1kwOv
YBx1OaQ4mfUIHr/42KBIvsXrCKwi0RJTkoRzhvSx5wnIeOoSioI=
=yeQ5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
