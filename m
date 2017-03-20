From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/5] arm64: only select PINCTRL for Allwinner platforms
Date: Mon, 20 Mar 2017 10:09:19 +0100
Message-ID: <20170320090919.ifngfkrwu2rcyegt@lukather>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
 <20170301180111.12365-3-icenowy@aosc.xyz>
 <CACRpkdYJfycBqcAfu-K0i8TnEMwOZmDGvujHA25YWbBax6+6MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kzjddv4dlp2xryyb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYJfycBqcAfu-K0i8TnEMwOZmDGvujHA25YWbBax6+6MA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andre Przywara <andre.przywara@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--kzjddv4dlp2xryyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2017 at 02:12:34PM +0100, Linus Walleij wrote:
> On Wed, Mar 1, 2017 at 7:01 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
>=20
> > As the pinctrl driver selecting is refactored in Kconfig file of
> > pinctrl-sunxi, now we can select only PINCTRL for Allwinner platform,
> > and the default value of several pinctrl drivers useful on ARM64
> > Allwinner SoCs will become Y.
> >
> > This is the situation of 32-bit ARM ARCH_SUNXI option.
> >
> > Drop the select of per-SoC pinctrl choices, but keep selecting PINCTRL.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > ---
> > Changes in v2:
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Please funnel this through the ARM SoC tree.

Applied!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kzjddv4dlp2xryyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz5w6AAoJEBx+YmzsjxAgz54P/jh5ZVO3ff9Ruar3fennxOTQ
rlQ9aDEg4m6G8NyUQ+FyuzgzlN6EtuRN4mbVIJxUEkk1ytX7Jf6rcPP5oM8GMLxD
1My/cJXHu/ieOpiu8KY0X3rKvjT7+ZM1sB0d8fjG3yGqvRoxpg12OcaLtEJpZN07
g/uNRPgJKHnmmMuTTuUp4jpFx2BEUkhHlhnbYo1P92Dwcht5QIm9Apfo+NjIP225
EHL1o7Vz+KSAwBxUyADtPgWv0TxkOIi+yV94jBOvnIi/mugvFYLZT+QHs3int5ty
0eMlqz6JFMzZRmNycUCn+7XIl7QcrzQE41OjBdDzxZG33xiNQxYmYu7rwHxlegxP
gC/dP/cVxakg6018rVdg/WLQ6I5vVt68pR4ImnWFGYqih5axuw3Az2jLpiABoEXC
mSmE5TBIMNnTWSPD2L0ZklZS2TO+9SubLTdnZLNaGcoed2Mk+m8/DJ0stt+n6hS7
8WBfDScv71Cp17IkZY4uZOjUCPkMznDagWTGIOsZ3+RZJVNWEyBOpmZpdAzrwfq9
8pZzcLlMBetRJ9CjeiuMdOBwueYkjjmD7dVGj3hhXG6JZC2r0JdrZUPniE9ZiXIS
y54QvsuFDj9Hy3/uGGNuZ+in2lR4JKqLJGK/JqvaNEozLAylZjG+LZY9/pEqlNP4
skjGQuKPm0dd2U4e/Bgh
=Ood3
-----END PGP SIGNATURE-----

--kzjddv4dlp2xryyb--
