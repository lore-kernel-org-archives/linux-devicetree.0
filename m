From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 13/16] arm: dts: sun8i: h3: add thermal zone to H3
Date: Mon, 29 Jan 2018 10:50:34 +0100
Message-ID: <20180129095034.5crx7ydq5k6f7omv@flea.lan>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-14-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lg27farh6a5fhzif"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128232919.12639-14-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lg27farh6a5fhzif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2018 at 12:29:16AM +0100, Philipp Rossak wrote:
> This patch adds the thermal zones to the H3. We have only one sensor and
> that is placed in the cpu.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index fbb007e5798e..3f83f6a27c74 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -72,6 +72,15 @@
>  		};
>  	};
> =20
> +	thermal-zones {
> +		cpu-thermal {
> +			/* milliseconds */
> +			polling-delay-passive =3D <250>;
> +			polling-delay =3D <1000>;
> +			thermal-sensors =3D <&ths 0>;

if the thermal-sensor-cells value is indeed 0, the phandle parsing
will be broken here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lg27farh6a5fhzif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpu7mkACgkQ0rTAlCFN
r3QDZA/8CrtqR44aBfoKWeYehohaL9qAUcVRBLM1jGC618gOFGdy6jXjCGo5hZj+
8O3Jx+X3JwSIAciVG2eM8Z5/iWv9NctjUAcU61iSezb2E30PG72Fesd6xqwNjxoR
0bqs/kvVD/VIaTCVftrb2hDYSNWtLTati4ErWPmwi+RYPKiqsNvtWIHckdMxfM7z
iKYVP/ok2G5k7jMe/97yYK0MkZJEXeQLf0ElzRdBTeCaMWlhWXHAN9kt690o1yek
UT4C4XpuTzMKeuZFXSsTbK+ezfsu7Rb/yKncxaS057dv5GWgq4Ni1noAJvdED6Gd
V7J8jqhWUsutAWUXHiZGG9urB1JsF8GHu8fINhgQQBUVeVbOthJxkclzjLZufs1U
SOHkWt+/E8ywSMq7uHdxiicSslBWRXzvD8CAd2z5WSRJ1V5YYoDo83sh97ywm6/y
k6P52VQiN/KpchmwXpwfSbOz+YY2vMhfDGCazrYGkOcNpn+0WvMBerbqAGujWh5P
xVuIiTHIuXaUs1xz4sFr8wY1vZ74pvdo/L5slhnOB74PAU9vMH8oVmH6vGmbGoC5
1w2VZPVl49XzVIN60olwQwtOi61PslUyJcKchr2qyzzBYLzLpMFGoGJ6p1Mm79e5
vkvAzqxzHHEz12vZoK1xwkx1JCKwXAc5ww4loFkKH+BHm4LGj7Y=
=U4ga
-----END PGP SIGNATURE-----

--lg27farh6a5fhzif--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
