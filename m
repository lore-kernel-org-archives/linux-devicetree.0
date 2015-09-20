From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v4 4/8] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2
 pads
Date: Sun, 20 Sep 2015 11:22:11 +0200
Message-ID: <20150920092211.GA27897@pengutronix.de>
References: <1442593798-11501-1-git-send-email-aalonso@freescale.com>
 <1442593798-11501-4-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442593798-11501-4-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 18, 2015 at 11:29:54AM -0500, Adrian Alonso wrote:
> Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings
>=20
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: Resend
> Changes for V3: Resend
> Changes for V4: Resend
>=20
>  arch/arm/boot/dts/imx7d-sdb.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sd=
b.dts
> index 8059458..c8a178c 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -419,3 +419,18 @@
> =20
>  	};
>  };
> +
> +&iomuxc_lpsr {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_hog_2>;
> +
> +	imx7d-sdb {
> +		pinctrl_hog_2: hoggrp-2 {
> +			fsl,pins =3D <
> +				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14
> +				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59
> +				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74

I think this belong to the watchdog node.

Also some comments for the GPIOs may probably be nice to know what they
are for.

Regards,

Markus

> +			>;
> +		};
> +	};
> +};
> --=20
> 2.1.4
>=20
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/nrDAAoJEEpcgKtcEGQQPXwP/1SN70cdva4htriTwScYhZFS
eGtHQxwham5wAE1Yi2+IErsNj09Mdy6DW8cBVwdFwywtLU22iYpUuaoQdlHG6IQ7
LxcMZbVgAzW9cxgLC6W/WXiDBvyQfyZaa+dNMI5sqq3mZY8+bBFERt/h9WF7fvgS
cdKYzJgn5dXbC07F1GXtbQnuCkI/FVrTvSVmkUBvvJbxgcm6YpiYVrG5IADlVSX0
mrWbT1d+7WyHoBgA9SseSqdo22gm3zHnFW67fJZNcso0kOPV7ANHBYnbc2bappjl
6TuHCPKmjnFjMWOrhVUvSFpRJVpbeIEEBbUYXd864I7gjl742Owtgn2AUGVyTndf
p1fy+HaGiDCafAAR36gZcgdlDMhrLrPQ12hEZmqHCATf5T7ed/otPptUHoe/FfGI
Yd4g+p/Izc/Xh+qUXH5jFaalGfEzZaIqVwINrXaymCFggjfIJp8Ouab2ZE/GA0IZ
MMpwszU9761jcUm8WFhovkuTtGgX5BSYSmSUFSj7Q3X1X39/qzm00KvmHsL4zNzS
Fg70NvAlVi7G/cmGc5+jZU6NGMS9CSkvZ9DYSTJW4dx6fePpTwPh6Y3a7RF1+7Mw
VlxYuASV7J+L+tx8eR22Er/OzRlT++s9IObkxIOtRHK6cvspdXaVDIn6AGR7NmAo
g5vxG4eX/I6XIv3Zgc9F
=rowL
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
