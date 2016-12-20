From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/7] Documentation: DT: bindings: mfd: add documentation
 for Allwinner SoCs' GPADC MFD driver
Date: Tue, 20 Dec 2016 15:26:50 +0100
Message-ID: <20161220142650.voojrp3vpoa7vzjn@lukather>
References: <20161220102709.9504-1-quentin.schulz@free-electrons.com>
 <20161220102709.9504-3-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xmj3o7epfxnbflo7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161220102709.9504-3-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xmj3o7epfxnbflo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 11:27:04AM +0100, Quentin Schulz wrote:
> The Allwinner SoCs all have an ADC that can also act as a thermal sensor
> and sometimes as a touchscreen controller. If there is a touchscreen
> controller, the first four channels can be used either for the ADC or
> the touchscreen and the fifth channel is used for the thermal sensor.
> If there is not a touchscreen controller, the one and only channel is
> used for the thermal sensor.
>=20
> The Allwinner SoCs already have an existing DT binding for the
> touchscreen controller and thermal sensor for the sun4i-ts input driver
> which does let the user use the ADC. To keep backward compatibility,
> this MFD driver re-uses the same bindings as the sun4i-ts input driver
> and will probe the required drivers to make the ADC and thermal sensor
> work.
>=20
> This patch adds the binding documentation for the MFD driver of the
> Allwinner SoCs' GPADC.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 47 ++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Docu=
mentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> new file mode 100644
> index 0000000..bc4b4f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> @@ -0,0 +1,47 @@
> +Allwinner SoCs' GPADC Device Tree bindings
> +------------------------------------------
> +
> +The Allwinner SoCs all have an ADC that can also act as a thermal sensor=
 and
> +sometimes as a touchscreen controller. If there is a touchscreen control=
ler, the
> +first four channels can be used either for the ADC or the touchscreen an=
d the
> +fifth channel is used for the thermal sensor.
> +If there is not a touchscreen controller, the one and only channel is us=
ed for
> +the thermal sensor.
> +
> +Currently, the touchscreen controller does not have a driver using this =
ADC
> +driver. The touchscreen controller is currently driven only by
> +input/touchscreen/sun4i-ts.c which is absolutely incompatible with this =
driver.
> +
> +The Allwinner A10, A13 and A31 SoCs already have a DT binding for the
> +aforementioned input driver, thus this MFD driver matches the existing DT
> +binding (mfd/sun4i-gpadc.c).
> +To keep DT binding compatibility, the MFD replaces the sun4i-ts input dr=
iver and
> +probes required drivers (IIO GPADC driver (iio/adc/sun4i-gpadc-iio.c),
> +iio-hwmon and soon the touchscreen driver) without the need for a DT bin=
ding for
> +each driver.
> +
> +Required properties:
> + - compatible: one of:
> +	- "allwinner,sun4i-a10-ts",
> +	- "allwinner,sun5i-a13-ts",
> +	- "allwinner,sun6i-a31-ts"
> + - #thermal-sensor-cells =3D <0>;

Same thing here, we already have such a document, please amend it if
needed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xmj3o7epfxnbflo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYWT+qAAoJEBx+YmzsjxAg0LQQAJH3PkkPfddS43dE4Vqk+4CG
mVmo8FE1UhKwi1F3rJT1TrKRsMAc8ZS7/oAh8gi8JBi9ajfo7+zvRMsGbzOHkYQ4
AhU57/nI+fwLkuX+HoucFGnk1Qf5fPJOL66ruW/WZImtHavIKtVXXLGxYb55mNVG
bq9a71o8XDwtvz3uNHKk8VFFIvOb3OEg2QUHPLs0641BlreoHor++dQGZljfZ414
WlHYOk7AVO8i4hi3bBFVJmJsBgWR5OWVy+EyjsJ90Vt5uf6d3qqipSx7MHsZWYBU
YZcAwRE+Qv2Lwy+RNyJH3MEMP8WnmQqr9ogUfPK39uqRu31JpSjn4ELm6qLfAkNT
hmhIScUVzukZV+u1Zd36aFt9+Xl7q72Dy13D/5+VGpHdtEyATT8fm4f91hVjpOUj
ZTSYhZeIpowo/O/fqXcoUGTplfFbypNwD7/yp51RcliAtHDB48ImA9EATCJplQWo
hG7q+s48V/L+xVKGUSYLdk1HxUWBVHb9jiGrlVus72zo0sAZWzPqCsJPfhJKeGM8
tr1kQfY4ukGvKaBjpDZuh52x3xzUsOWuNgEXuEh2ZELgaqxtaytt2dh5g/NpPTVE
SuseoVd+aJGqYqiA7idYUQ2lSXK0/ivfk5Abm3j34O2O6PuvyscSmdVeckb78eNf
vq9ikxK8NV2MrM1Ci8i1
=S5C8
-----END PGP SIGNATURE-----

--xmj3o7epfxnbflo7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
