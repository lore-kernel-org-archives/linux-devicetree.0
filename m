From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Thu, 28 Jul 2016 22:07:05 +0200
Message-ID: <20160728200705.GG6682@lukather>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <20160727104623.e9ca7b708e5c6462f44a5d01@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160727104623.e9ca7b708e5c6462f44a5d01@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 10:46:23AM +0200, Jean-Francois Moine wrote:
> On Tue, 26 Jul 2016 22:30:28 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > ere is the previous A64 patches made by Andre [1], reworked to use
> > the new sunxi-ng clock framework.
> >=20
> > This uses the current H3 clock code, as both are really similar. The
> > first patches are just meant to rework slightly the H3 code, before
> > introducing the A64-related patches.
> >=20
> > Some WiP stuff have been removed, such as the MMC part, but this serie
> > already has a decent amount of devices supported: uart, i2c, rsb, etc.
> >=20
> > Let me know what you think,
>=20
> I don't see the interest to have common code for 32bits and 64bits.
> The clock driver of a SoC will never evolve, so, it is simpler to
> copy the source common with the H3 into a clean A64 clock driver.

I'm not sure why 32 bits vs 64 bits matters here. We're going to share
a significant number of drivers already between armv7 and armv8, like
MMC, EMAC, I2C, and so on.

And I expect to share the data in other SoCs for the A10, A13 and A20
for example, or A23/A33, which have a lot of clocks in common too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmmXpAAoJEBx+YmzsjxAgb7UQAKU1jYxdxf3tNMkTf9LT88V1
1KtWMXeQSMtZcf0RWme4Q5Y8fKUukD7nf++Q15YyfLd1MSR+RVNlUmrbqDI5WnAE
j28DajydppKEx+VUPEsLmXVAI1L+WTcVifscoCrNVn4aubcpuHoJ9PwymZk/KlFG
p6U9YM6GRoazhlueBnVUxUliVC/zELBunr+lOjVPBDrzfcAFwS1lHvODPb165xDd
7NcEik15V4pRbnhbARy/EFCcGP8fnTKRLPIhIS6tRyb63WU9GQDs78MJ7HgypzFS
wg7tt40D4iIT5RevgaaJYz0z53xkz1haPzlwj2kjvfBV8ea/iTdaRo+HUS54etuw
sW93Zwoire7YmJ3NiI2iVzela/2xeMGKrTlotqI3jjO0jmZdyi8Zf5KG48kCX4c5
brVxgEQ4wuGsLVOA8v21GWhvfea5MJ9tM38OX79wXsnyZXiwySf5gBgu+vj0J5nh
AOyrsemVgCiM5lCA/KNEiDfiqqjRMuhGbuhgTk8RW3Ht02gxCcFUmAmNcz4hTS/f
ldZlr0YAPYJpXw5yTcFLTDGt7jIh8LLv9IO5isZ0+jxq1/WdszQiQ3sxC4jW8NRE
A8O/HFEXSGioRlf08Pm67Lo+eNmRd5vQrPf2SRKckvaFuk++tZUN02MZs7rpCSc9
qhjbaty3/g6iOXWh7F3V
=erFk
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--
