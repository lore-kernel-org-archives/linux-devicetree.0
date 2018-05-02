From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next v2 15/15] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Wed, 2 May 2018 11:51:18 +0200
Message-ID: <20180502095118.rqnfwy576xh6ercm@flea>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-16-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7sjvnulmm2nvbrt"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180501161227.2110-16-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org


--w7sjvnulmm2nvbrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 02, 2018 at 12:12:27AM +0800, Chen-Yu Tsai wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> Allwinner A64 has a SRAM controller, and in the device tree currently
> we have a syscon node to enable EMAC driver to access the EMAC clock
> register. As SRAM controller driver can now export regmap for this
> register, replace the syscon node to the SRAM controller device node,
> and let EMAC driver to acquire its EMAC clock regmap.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23 +++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..1c37659d9d41 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -168,10 +168,25 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> -		syscon: syscon@1c00000 {
> -			compatible =3D "allwinner,sun50i-a64-system-controller",
> -				"syscon";
> +		sram_controller: sram-controller@1c00000 {
> +			compatible =3D "allwinner,sun50i-a64-sram-controller";

I don't think there's anything preventing us from keeping the
-system-controller compatible. It's what was in the DT before, and
it's how it's called in the datasheet.

Otherwise, the whole serie looks good to me:
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--w7sjvnulmm2nvbrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrpihUACgkQ0rTAlCFN
r3RVCw//aZA2rPyqkFmrSHOFRQHH0hAa+nSEsBT2aj4vg1uvHpzp7bgW5Kn7fwxK
H+5q5JgE0pDHB3yy3O5CyGdu9U9dEkAIG/+Cu6STgF8JP1VAhzRckZ+Wsv9Zo5/W
fPwHjndcQ3zth4QGAybc0xR8yjxbsxQ4u93moPjiy5xWxJNzb8XJv1Cc2kmFfNxh
6mofpQ5hAyWi5LBMFYje4XYQvrt1rYAEGri2eWY3yscTQk9p9krzWe4MXfn9KoH/
DHSPblL2BuwyuL93MH9dTDHMS11PPQamQP5YrXaT3Sysruk3UJcBysdiEcw2ctlM
7wDct57Vwakg7WjfiPjxJ+jBssn2ljOBLeq9pg59Qe+Y6WRfk6K7L10kPReRccDs
fjGJooCwiQe11pMJmYvgJ6V0T+gNRqU6Q/FAQXxcyeRatHG5Ftdj02s+mBdbAtoe
z4kkdjQIDAfS4C1ZAwOdpgZZUr50eJ9NKfwAeBHOwNHmWDjfGGD3tLD0qaUafS2d
XDG/wBjB/d0nYShAyLBavoD/JsCx6F3V7z3wGoKGgO5DuEyZypo5oTMWb6i2et+w
gAnF7zicG4L9pNsBLBVNz/6w4C0oQ4JcNMjTQpsLpBzlkd3KYJwvlCYDhzoAvUJx
JL9HgNFZPHFrL1K41DbGSjwI9UQaZUQCRes2rftss+ms5xhTW8c=
=sbTc
-----END PGP SIGNATURE-----

--w7sjvnulmm2nvbrt--
