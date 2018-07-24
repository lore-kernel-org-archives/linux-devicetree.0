From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h5: Add SID for H5
Date: Tue, 24 Jul 2018 11:02:47 +0200
Message-ID: <20180724090247.uhvtnukrr5cevv2j@flea>
References: <20180723104255.94244-1-manu@freebsd.org>
 <20180723104255.94244-4-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yfpyl6fm4hqkllkg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180723104255.94244-4-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--yfpyl6fm4hqkllkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 12:42:55PM +0200, Emmanuel Vadot wrote:
> The SID controller on H5 look the same as the one present in the A64.
> But in case we find some difference one day at a compatible string
> of it's own and a fallback to the A64 one.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sunxi-sid.txt        | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi                 | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.=
txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> index e319fe5e205a..99c4ba6a3f61 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> @@ -7,6 +7,7 @@ Required properties:
>    "allwinner,sun8i-a83t-sid"
>    "allwinner,sun8i-h3-sid"
>    "allwinner,sun50i-a64-sid"
> +  "allwinner,sun50i-h5-sid"
> =20
>  - reg: Should contain registers location and length

Bindings patches should be separate.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h5.dtsi
> index 62d646baac3c..28183bf77164 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> @@ -129,3 +129,8 @@
>  		     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>  	compatible =3D "allwinner,sun50i-h5-pinctrl";
>  };
> +
> +&sid {
> +	compatible =3D "allwinner,sun50i-h5-sid",
> +		     "allwinner,sun50i-a64-sid";
> +};

I'm not sure doing a split similar to what you're doing here just to
save the reg line is worth it.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--yfpyl6fm4hqkllkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltW6zYACgkQ0rTAlCFN
r3QsIA/+KYzlpbnTerhFv1nubywZSkaDVEb46QiGxIzsPlMvzT1KckgzK9jHdnLo
TdzVqof8gIknUvyMfqE136KP+KNzz37qNG1ZJscSrvWVYjGNnKvCTuYr3CbPUkzs
PzKVUugFnmoFo1HYSSDjdQ6psR7vPRlsLAPNXlOt4bfRX41GmsKHyXM/Ia9f571J
uZ7EW6Z8fXJE6laEyQ4H4amXlfhpC2axIezEQ1rX2YqYvVt4WfikQOZ18OtylvUY
MuIkR6ZRN8/ntQYJx1RMJfM9N8LK4lflpgUzmiLMsrHL7hPyxtod6yR0G9LtYMVw
x2PEFtckbzmQUjIlm29fJoF2hbbMI3Xdx/2TT2fH7Wp+rpf6DgI7pKAgefiPKggx
9nAgEuD5TpnTkGgnlBhzggZ/v49U9/TwiP0fcIiRil6nXTM+/vMIym367I3KLTYP
lD5y5ixGXMWMno5Akiw16zehd3naO8nMBY2NVw5IkGoGrcVWg4Ch4aZgtsBgVs3S
Nw4aHHWdA1/dOGXbvCHCiWpe7fDL4+fRMxF0/QHf9cIWnsHsSoSb6i54kArUkTmw
a41HCRRSTPgODijqaRKhFO92POjwty0Lg9GLIZIoFKzjSzG8JRid0N7ifTi0/ecG
8SkH68ds7VtM1pytEyoB52uwODZu16ca1JIavT9whXb3S8UHY7E=
=QXD1
-----END PGP SIGNATURE-----

--yfpyl6fm4hqkllkg--
