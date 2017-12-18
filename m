From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] arm: dts: sun8i: a83t: Add support for the ir
 interface
Date: Mon, 18 Dec 2017 08:47:14 +0100
Message-ID: <20171218074714.ei4cuvl3ydc72zev@flea.lan>
References: <20171217224547.21481-1-embed3d@gmail.com>
 <20171217224547.21481-5-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2a2bt6rf4xkmfrxc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171217224547.21481-5-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2a2bt6rf4xkmfrxc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2017 at 11:45:46PM +0100, Philipp Rossak wrote:
> The ir interface is like on the H3 located at 0x01f02000 and is exactly
> the same. This patch adds support for the ir interface on the A83T.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index 954c2393325f..9e7ed3b9a6b8 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -503,6 +503,16 @@
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		ir: ir@01f02000 {
> +			compatible =3D "allwinner,sun5i-a13-ir";
> +			clocks =3D <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
> +			clock-names =3D "apb", "ir";
> +			resets =3D <&r_ccu RST_APB0_IR>;
> +			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			reg =3D <0x01f02000 0x40>;

The size should be the size of the whole memory block, not just the
registers you need.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2a2bt6rf4xkmfrxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo3cn4ACgkQ0rTAlCFN
r3TdQw/+LOU8KwRDTCJhkvri2pXWNexLbAAsvlxfU2qNmsb6wlLW+A8RRoso2byo
oqUXyWoYy0ynKhxPofbzKHwMPirXrp4dzY8Lt5WEtwTWeT1FGC5h1ND02XODFb0Q
6F0sOpim+m8YWw5M9uAh/hjoAFYKJ+Dr7OXN2AEUJodL50rrmLi2/Wk1wMrWkhQ/
BGaqH8AJs6X/D6vhYyNTJ3i9pqIuYq4CElcyojWtAaO4VdB1LxI+xYnTHl0lXC+V
JV7hyzQCOnlufsqgnr2lQQhLPS7OxFWfquQ84yrrFR+Xqpm0xoWPxQbYEPnKI+qg
4OyH3GdyFyJXhX93zh8D+F/ew1hGoAs4RQyXw6kcyuyMYW8q5vt0n+fvfWZeGx7r
fvcZ7as9MATHdT4+OXFP5Wg9sTZ7JhnjqIdylaKbWWvfeIjiFl1dHkSRzduLSz5q
LOScA2JdA1rQukns7iseYXs1ziVDHwK7RQ74iXM4YMZZsoQ5L6OSSfBBJ+3xvt+F
sfGHM0LJo0uJ7qCbU6Y0ru9mtcemrNvwIwT3KYx/o8fBY7EgeFTc3ZHYN12fpslk
xo/LA2GOD0m6sRBPnBF2pC4CHiD4BHvOvim7vL+VxelhzzLtHzHE5q4K5eht+Org
DnT1HDKt6rDntZM/y+PcRwtnLgVABpT4BqJPglEq9x+Tk9Eb4go=
=OlBX
-----END PGP SIGNATURE-----

--2a2bt6rf4xkmfrxc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
