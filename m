From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2 1/7] pinctrl: change Kconfig PINCTRL variable to a
 menuconfig
Date: Sun, 8 Oct 2017 23:24:43 +0200
Message-ID: <20171008212442.ybbdwcnjsrrusxlh@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rzgeo74v45a6vvkc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-2-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rzgeo74v45a6vvkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:05PM +0800, Phil Reid wrote:
> This allows PINCTRL to be selected manually to allow enabling of the
> mcp23s08 i2c/spi gpio driver. Which is not platform specific.

FWIW with i2c/spi based pin controllers available it makes sense
to have this available everywhere. I actually did test my changes
using an i2c-tiny-usb controller with my x86 based notebook, so:

Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

-- Sebastian

> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---
>  drivers/pinctrl/Kconfig | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 1778cf4..8da29e9 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -2,11 +2,10 @@
>  # PINCTRL infrastructure and drivers
>  #
> =20
> -config PINCTRL
> -	bool
> +menuconfig PINCTRL
> +	bool "Pin controllers"
> =20
> -menu "Pin controllers"
> -	depends on PINCTRL
> +if PINCTRL
> =20
>  config GENERIC_PINCTRL_GROUPS
>  	bool
> @@ -379,4 +378,4 @@ config PINCTRL_TB10X
>  	depends on OF && ARC_PLAT_TB10X
>  	select GPIOLIB
> =20
> -endmenu
> +endif
> --=20
> 1.8.3.1
>=20

--rzgeo74v45a6vvkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnal5oACgkQ2O7X88g7
+poigw//fxvw+teP53hM79rt3ts+aM2L/wLDGW7Yal6q8lS1KEuPjUqf9/5JVO7e
Q+yw4Mo6A4JKCUfWfCstFCGCaaBPjYUXTrhpuIjwoFNmHjDQsiP9JmLqkL8bCdyB
IgPoVn6i000laDF7orhqDa+ScadahA38pnzp6ZzKTzZlB+1WNVvT3q1OY3j+Hio1
oVf2+B7gb8/9HIHFPzSEhQho/mxXQZ+7vj46GYUj6AnFG+5PsOmA+EOEMkxCTaTx
swKaz9HaCrxqfP5rf/RMw22Rh5XCMt3TjMs0oe8M2zLC6rZkt5xunmJ7+lzTGV/Z
Mlg93BJ1twduHx8QlAzqIJenn+hiCAhpm+FJ8Xc1G4BsGyj3MVZz7dzUy0fFVN2I
ruGmv0A7PI5U8e/sJpRF1mkhOTu4MwagUC/TrZrJMqYxjs2S++Cez9D0gb8yqn16
dx0f8ttmxuDzho3GB+UO6b841Su2PC6TUOTqhplJV3TNUaEKJiaHecZ/EDgHGcwg
A2nLvpbO01ptvtX0PqFN56dQJtajaTzKYDkDFiQuK8oiXO78UfvZM/ZqLBV6myZ1
YhBfH97mvP8mhCe0+OVxqQNctxiH6opVA2Y/gBj+nfmhK8TKSvvuyopw+Ml+SOd/
aZZttJhagZIVmfENMjmwsInozL9YeDkihPyrx0dbWe0KB9nxRqI=
=Asyv
-----END PGP SIGNATURE-----

--rzgeo74v45a6vvkc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
