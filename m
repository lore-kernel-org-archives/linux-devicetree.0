From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/5] nvmem: sunxi-sid: add support for H5's SID controller
Date: Mon, 18 Feb 2019 09:49:31 +0100
Message-ID: <20190218084931.fdut6d4cgwkwvihx@flea>
References: <20190217162316.14111-1-tiny.windzz@gmail.com>
 <20190217162316.14111-3-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="scnr26aml4g7phhd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190217162316.14111-3-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--scnr26aml4g7phhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 17, 2019 at 11:23:13AM -0500, Yangtao Li wrote:
> Add support for H5's SID controller.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/nvmem/sunxi_sid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index 570a2e354f30..036029e90921 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -219,11 +219,17 @@ static const struct sunxi_sid_cfg sun50i_a64_cfg =
=3D {
>  	.size =3D 0x100,
>  };
> =20
> +static const struct sunxi_sid_cfg sun50i_h5_cfg =3D {
> +	.value_offset =3D 0x200,
> +	.size =3D 0x100,
> +};

IIRC, there was an endianness issue on the newer SoCs, with the driver
converting the data from big endian to little endian, while it's
actually stored little endian in the SID.

Have you checked the SID content?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--scnr26aml4g7phhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGpxmwAKCRDj7w1vZxhR
xXx7AQDcwq0iKz7NwrOgeLiQJtBdc0cgjMZh9PBcdpG0bCWIBwD7BwtI5UEDPuB5
GNkfU1d6DR0iUKSDPFYUTL3dTKlK0QU=
=Okil
-----END PGP SIGNATURE-----

--scnr26aml4g7phhd--
