From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: a83t: add dwmac-sun8i ethernet driver
Date: Thu, 8 Jun 2017 10:34:28 +0200
Message-ID: <20170608083428.csv54tryvgwdb552@flea.home>
References: <20170607173345.22462-1-clabbe.montjoie@gmail.com>
 <20170607173345.22462-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ufzyn6xsae3ty5r2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170607173345.22462-3-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ufzyn6xsae3ty5r2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 07:33:45PM +0200, Corentin Labbe wrote:
> The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 spee=
d.
> This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tree.
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index 01a83406f9ae..7d719b4aeaa9 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -200,6 +200,14 @@
>  			#interrupt-cells =3D <3>;
>  			#gpio-cells =3D <3>;
> =20
> +			emac_rgmii_pins: emac-rgmii-pins {
> +				pins =3D "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +				       "PD11", "PD12", "PD13", "PD14", "PD18",
> +				       "PD19", "PD21", "PD22", "PD23";
> +				function =3D "gmac";
> +				drive-strength =3D <40>;
> +			};
> +

This is not used anywhere.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ufzyn6xsae3ty5r2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOQwUAAoJEBx+YmzsjxAgJBIP/R2bEeJTNnNYpZAPLYhiL/as
ujo3zNy8NlpCzQWHtMqnP3BubOeNB7+ojcnAlV/TSqOVQmqEhoAAUGAJpYTUBqjk
7fK8bl36Nig82AaBGXYHqV9vIyxAoMvJHx//mAoIDqGoiEZ7bg1YYLd/uf+zLvM4
4x148+6MaiRQG6aHkfMOWAWBby0DeOL2iQ5bAXDZJ2xhozdHHN5n5PeYAfHl/+vn
9w93l4aEgQbyv77QeJHGJIGRaIvOfAOx8ETt8eIZUd7PkKZHVn2iYzbPCCYwvz/5
VuL3slVsR4UvJZIrVxJHtQ5vCzFZLmZsChl/Epf0Uxpq7jKDiLiituc8sJAdxCR5
tbtizzxzDZ7G5fNZ1/Bhnii1o3HSZ8apJGQQ/5hGRoWRpbQZih2ORJX7VgZQx0WY
MIQWW6oKEuUK+DEkyZUCnyRzpy9kw1/vkh4NavEsihHOpmuu5Pm/9Ss8PgMOH/xD
vNp36sttuVhPnKeM13wBzgY5azUVYu1FlUOAtnJPdqdodFjDIB3Pm17jG5BSHVR8
qMsPHjMJboRREbTkJtfICebwsZjhlZImkXcIdiouZrOxgmaazUj7YbSH/VErzSXp
54Bu85E+v4J39JrL6cQFAQRPzEyKkPk3dGPFNMIe8taNSX3Lpb+ZURrWkpwBM9WZ
FxgUT705bBlu0RNXFnEV
=ho2r
-----END PGP SIGNATURE-----

--ufzyn6xsae3ty5r2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
