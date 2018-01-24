From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 2/5] arm64: allwinner: a64: Add SPDIF TX pin
 to the A64
Date: Wed, 24 Jan 2018 12:00:31 +0100
Message-ID: <20180124110031.kksmh56krinaivh7@flea.lan>
References: <20180124103943.2062-1-codekipper@gmail.com>
 <20180124103943.2062-3-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nrninvdfjs3rr4fd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180124103943.2062-3-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nrninvdfjs3rr4fd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2018 at 11:39:40AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Add the SPDIF TX pin to the A64 dtsi.
>=20
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index c82979038b0b..db1694ec3ee4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -336,6 +336,11 @@
>  				drive-strength =3D <40>;
>  			};
> =20
> +			spdif_tx_pins_a: spdif@0 {

This will generate a dtc warning, you should use a syntax similar to
the other nodes there (ie. spdif if that's the only muxing option, or
spdif-0).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nrninvdfjs3rr4fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpoZ04ACgkQ0rTAlCFN
r3SGKQ/+JDZodu6Z17Dc2e2P0rnKP3xp7gud37HAdf+Ejst7hSHquouHyCh9oFN+
/pKOYxV9pf1CVKVL67BBE9v2OFS0/GjxRaJUeEonoMxfSHZQHuJOgLDyjkGm/opZ
NsMnvSLR1MEflswlSy6U7gvgxYN8Md+2Q4txtt2II3xm6ejXGgw+BetJurmddl0I
KdORXqFCrcfzlhI+Ye4V+WkmBYd0fhgQZ1hl1v61NUd8fgBm0XVajgryXoYyCRnJ
H0CFthVO3L+vsCu2u4MbMQMe8vzgCOO1p8wYsLUEE1yGae/xMWMD9pAwH5v4pfNB
lpaQFpmmWCgTxGs3kcpnH1LLVuaUQT/Mn8/SARj8JUsxEZUacOLrWa5wfDVEG6z+
dnfoE44VAe/jW9ed3ls9GOE3rkN2ZCcpP80caDY7p+l0IHPoxV81l/e+/brtwxLQ
8f2KbKHTDj19zP2qvSVZ0LvoumfQkfMUJfFez5ip/MxqM3AsD2crEyy8NAr2jkzW
rk7uSYZW+6nME2BWm7xAlWsIKAsywqMZWeOCZm5HQ3AAenpA2KKrA2ItmqiQ4pdi
mqPb8FVzqxmqUmhY1TwXq7yQUgmi3NsPJvYMzl6WFWBeg/wX4LCsyMB/2roEU1Un
5IkPqtyuVvS8xTIp11oojaRorE0wN3JdVAZLPFTBjVKa9JUJV8I=
=01W6
-----END PGP SIGNATURE-----

--nrninvdfjs3rr4fd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
