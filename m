From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 01/10] arm64: allwinner: a64: enable RSB on A64
Date: Thu, 27 Apr 2017 15:28:05 +0200
Message-ID: <20170427132805.izv6xfktlhfc4yty@lukather>
References: <20170426152023.41567-1-icenowy@aosc.io>
 <20170426152023.41567-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vmgrw4du3ohy337q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170426152023.41567-2-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vmgrw4du3ohy337q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 11:20:14PM +0800, Icenowy Zheng wrote:
> Allwinner A64 have a RSB controller like the one on A23/A33 SoCs.
>=20
> Add it and its pinmux.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v2:
> - Removed bonus properties in pio node.
> - Added Chen-Yu's ACK.
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index c7f669f5884f..05ec9fc5e81f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -422,6 +422,25 @@
>  			#gpio-cells =3D <3>;
>  			interrupt-controller;
>  			#interrupt-cells =3D <3>;
> +
> +			r_rsb_pins: rsb@0 {
> +				pins =3D "PL0", "PL1";
> +				function =3D "s_rsb";
> +			};
> +		};
> +
> +		r_rsb: rsb@1f03400 {
> +			compatible =3D "allwinner,sun8i-a23-rsb";
> +			reg =3D <0x01f03400 0x400>;
> +			interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&r_ccu 6>;

Please use the defines here..

> +			clock-frequency =3D <3000000>;
> +			resets =3D <&r_ccu 2>;

And here.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vmgrw4du3ohy337q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZAfHiAAoJEBx+YmzsjxAgAsYP/2Nj0i4mzSliuHS4kLEdEpeF
LxYjEWpghrcLtV4oHr/ow4rK3VNlcom5OucUmLqpupmQZWv7ZKuD4gRJ74yf0zhg
yzoq2xNDjFBdrV6d68hKzjyXlATXAfEq43wODvvUcrmyiP/a8u4SZmZBDT94QLaP
mh0UGVwKhZFRdhKiMQ/eHwhpTyMbWKVOj91Hrqb+Obnmb4zXaas/7FWHuZV6ibL1
kxVp+1BMcESOBlN+CCphcGSLZF+F0gS+FKKHn7NeyzSp6/Cp3ZYYPlGz1UU+K/QJ
oVs2o3sR616WU2uO/1aP/sDyKy87hJZHnECr+NPjZVigt5MokKYjoy7bSbG5sGJO
XHDbVvxNQvw5/H1aAzwuAcssn6/KP6rCt8nEhZ55jIxUeH1oSRhL9xaIWNjtJWlN
CwIlmoQZSA2F1aAazyCsxJrV7RcexDK/cWeWDkXPAHhtqhgILiJ5s7KjmDsTRI5p
2PX6qKMZLqrGfAQFz1fM93K6LS1eiwOrnhR012m7yMXw3+hWN61IgNyUvhxo1pyY
dTA+Qs4vJoFMcwdXJpwmfxS5u3wFfX7Fakwxii8zZIQ2HbZnNttFXDONDF88ZRGf
8WVm2XUnDCzJDTD7uEHm8PoV2IoJ0XjKgZi/CT3k8WFODMGceF9OZRDfporCIwYI
OZvj1vfcKctvYPbpxxCF
=R/kK
-----END PGP SIGNATURE-----

--vmgrw4du3ohy337q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
