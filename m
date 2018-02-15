From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM64: dts: allwinner: sun50i-h5-orangepi-zero-plus2:
 rename mmc0_pins_a to mmc0_pins
Date: Thu, 15 Feb 2018 09:21:17 +0100
Message-ID: <20180215082117.rggaheb2k47azkgi@flea.home>
References: <1518598487-29201-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3aj2kuunf7odfd6s"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1518598487-29201-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--3aj2kuunf7odfd6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2018 at 08:54:47AM +0000, Corentin Labbe wrote:
> mmc0_pins_a were renamed in arch/arm but not in arch/arm64 resulting in
> a build failure.
>=20
> Fixes: 813f2c8fa119 ("ARM: dts: sunxi: h3-h5: rename mmc0_pins_a and mmc1=
_pins_a")
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index feee125a4e9a..87c1a0dace5f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -82,7 +82,7 @@
> =20
>  &mmc1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&mmc1_pins_a>;
> +	pinctrl-0 =3D <&mmc1_pins>;

The actual issue was that the commit 4db86a4b103e ("ARM: dts: sunxi:
h3-h5: Move pinctrl of mmc1 from dts to dtsi") didn't remove the node
in that DTS.

I've amended it.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--3aj2kuunf7odfd6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqFQvwACgkQ0rTAlCFN
r3TQzRAAhvpNysWihu2H8Q82BRoVyuyxiR4J8JSvu7e9G0TgE1ebufVN9pPtQd/U
2AG8TRpd/3pJXemBZ0HH/dWFH65okWYUwBIT4dQ9lQlF29NtPyI81qlAZnHuj5Tq
cYd5+AYT8w0aFmv5X3JTMKNKhCwKPo4B0OdZwVkkXOcP3feSAJJl3LETXgecF5qB
FWofa66HE+0dPR6XfMB+Jc9cMAdcp3B3uwVFSkX7s9IL5Z+4Evi7PsuJU4PgtTIN
QnWNJPcQfPxsWpAVyRQ+ui/CNLq8tQVMnHbQu1VTqjqMMkNhErmCzFOhg9SDIwxz
nndwbZBIPbuof1Vzi9ZrWNk7Q+HVgjl0vAjLpWkfwTRPox3i8m1LF4cMid4qEKB/
NIARd8xeMo0kmTfohDkCqbaD+542NKTGnUW4H77/H8O/S56C66mT8SQ0+UGdbkNv
B/P1pS8cvGCEhvpmRVZqRkrVVGYmf8OkBMW+k7b/WELMq7DQJa6h1P4VCiroyjQK
qMIzV2V//gpF868k9XChLLOEjnK1K47gqxqKfIlhhkWhYjw/d5Jm/wF3uHcq6tEQ
UarFy44fF90UtU02NRffCpryfApiNKO+nFezJGq6A/WaVTzCV1llB02S1ttbd6y2
jBrrtF3onpvnaGJQgMol8IgaZ3C0wISF5IzTy1sndgIcvQ8ZYB0=
=Nok/
-----END PGP SIGNATURE-----

--3aj2kuunf7odfd6s--
