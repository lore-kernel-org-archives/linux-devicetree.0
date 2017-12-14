From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dts: sun8i: a83t: Add an unit address to the
 memory node
Date: Thu, 14 Dec 2017 10:54:30 +0100
Message-ID: <20171214095430.uw5zaf6h3u5hgkrv@flea.lan>
References: <20171213193715.31039-1-clabbe.montjoie@gmail.com>
 <20171213193715.31039-2-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2perrynkyopspshs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171213193715.31039-2-clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2perrynkyopspshs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 13, 2017 at 08:37:15PM +0100, Corentin Labbe wrote:
> This will fix the following warning:
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property,=
 but no unit name
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index 715719f9ea2e..bddde0141f24 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -160,7 +160,7 @@
>  		};
>  	};
> =20
> -	memory {
> +	memory@40000000 {
>  		reg =3D <0x40000000 0x80000000>;
>  		device_type =3D "memory";
>  	};

Can't we just get rid of the memory node entirely? U-Boot will add it
for us anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2perrynkyopspshs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloySlIACgkQ0rTAlCFN
r3RDCQ//UeMHrfJYil9imJuy/xKhjUxrhLfmMkNT2+BC4FckOncDbeHZ47qfqyVx
E+0wPDvbFIyKk8zgKQUO9KPLODxW19kR4jlIsHgqgbb1h5KErA8xZqqvHrRiC56j
J5TGw2GnS5Frj9ErhH+Pm64hXrgvnmIiAoNoJ6wQKfSTrssgvMOHUyNMYWPxV5Kn
e9qRhbifc2YSDeYvaRnsguISJvOuCkRSbPr2JQgopmR20JLjZazYoXxFaodiTKIt
0G6+0W9UnKW3+pHnivdTipm5dDlInPqal/PAvXrdoKstNv0RNosXNcssAYJSGgXY
rzznf/Z1dz0qt9Nj0JRcR/yLgywp2wfFQ5ce7YvYRmeWa16U207IdbS/djqFSibF
eB58Abho755WJ2YB61XcjOQukd8go153xnEAJod+nfpgo3h14ay5d71zEajigv/K
VBxT7MT+1gI1C4kxqujh3gGSeuf2MM++2NkvShb6bIVmAbQibCNbxuZb02mfXq9g
TI5LUkjtCJ+RCck7UQej1Bsf9q9x3LFQQo/5d6FS0df/7HNyIB8th5eO9nbkBOH+
yhk+jLz8N5A4eNvQGiwEUYst9nrWW6PfrTFUr+f+sKqFtG1h9T0rbLDwZ7W7hIE7
ZRZ41O7LWFJJXbRmnurCxb52S20N+xOqlha+1kKcbhirXOCIbQo=
=Vy1m
-----END PGP SIGNATURE-----

--2perrynkyopspshs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
