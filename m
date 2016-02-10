From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Date: Wed, 10 Feb 2016 13:59:36 +0100
Message-ID: <20160210125936.GD31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rln2GmQ7CFmDhc9B"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B4E2FB.3050703@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Rln2GmQ7CFmDhc9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 05, 2016 at 05:59:23PM +0000, Andre Przywara wrote:
> Hi Maxime,
>=20
> just found this while looking at your current git branch, so sorry for
> the late reply.
>=20
> CC:ing DT people, since you touch both existing DTs(!) and the binding do=
c.
>=20
> On 01/02/16 20:20, Maxime Ripard wrote:
> > Remove the fixed dividers from the PLL6 driver to be able to have a
> > reusable driver that can be used across several SoCs that share the same
> > controller, but don't have the same set of dividers for this clock, and=
 to
> > also be reused multiple times in the same SoC, since we're droping the
> > clock name.
> >=20
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >=20
> > Changes from v3:
> >   - Fixed the documentation
> >   - Added pll6d2 back
> >=20
> > Changes from v2:
> >   - Rebased and converted over to the new factors refactoring. Fixed the
> >     retrieved rate
> >=20
> >  Documentation/devicetree/bindings/clock/sunxi.txt |  2 +-
> >  arch/arm/boot/dts/sun6i-a31.dtsi                  | 36 +++++++++++----=
-------
> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi              | 25 ++++++++++-----
> >  arch/arm/boot/dts/sun8i-a23.dtsi                  |  2 +-
> >  arch/arm/boot/dts/sun8i-a33.dtsi                  |  4 +--
> >  arch/arm/boot/dts/sun8i-h3.dtsi                   | 37 ++++++++++++++-=
--------
>=20
> So are you really breaking all those systems by changing the DT and the
> driver in an incompatible way?

Yes.

> Please correct me if this assessment is wrong, but to me it looks like
> any user out there is either stuck with 4.5 at best _or_ will only be
> able to run 4.6 and later (depending on which version of the DT she is
> using)? And no, switching DTs along with the kernel is _not_ an option.

It is. And it is one that every other ARM platform chose. And so did
every distribution.

> That is not how I understand DT.

I'm sorry for that. This has never been something we said was
happening.

> Also this totally ignores any other DT user (U-Boot, FreeBSD, you
> name it).

Which all have their own DT copies, with their own bindings, that we
(ie Linux) never agreed on.

By further extending that argument, you're currently looking at the DT
=66rom Allwinner, do you want to support theirs as well?

> I actually appreciate this rework, it's more flexible now and looks
> better, but you really can't do this in a way to breaks compatibility
> with existing DTs.
>=20
> Jean-Francois came up with another solution for the pll8 clock [1], so
> could this be considered at least?
> I think changing the H3 PLL8 clock from dummy to something real is a
> different story in terms of compatibility (since it never really worked
> before and this wouldn't change for any old-DT user).

So, one would have to update the DT anyway to benefit from these
changes? What's the point of maintaining DT stability if you add every
new release new stuff to the DT that users are going to want? Beside
adding untested, unmaintained, dead, and possibly broken code, that is.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Rln2GmQ7CFmDhc9B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWuzQ4AAoJEBx+YmzsjxAgA/wP/3p54jR5zJcXXIjc2IsAuTBe
Y9eGrrWTsO0lhRSql1rUni0fVcA9A4rM003Z576mvDbD+Np5SYlNLEzAVL8IW+9K
TefehsFQ97E68CUQAYKDvIJ24vtxYsR2LpTcvEpkacdCXBbUK5+NJg+9BElcVrAx
mz9NzjrGpX3j+4H/B5yvv7E8geRMdJXxicPQO6qJp27L1cA5KY4YCgEoOL7dCXx3
zYfUy8AXZFWjtfMPdVmsAT0cmUnikxO+0teAIMINUNnrtTMjVWfYRO3VUv7UtUV3
c3CXawqd4FEortgTnVwDOfYCPZy3Ps7HZztd0ZUftvPLC70+o7c2Hzi4AsNoixll
6ibI32vWW/HaY0TcaEKM4ZF2mW1LHx/bJt0StVKKKZAxZ9QQ7TS2QQsHWKwvybYq
olIGAGDRDGkk5uL3T0KMjUjSeMkLB+0gkYIivFGgpS1v7KJelZkr83Grd1VwX6xa
OkaFHRc6b6GFmwY01hP3ozc47m8c8WpqNS18viQLy4LlOnSU31Pg/9AxCw8PpJah
UWJgFn5WCBN/cLm+bBP9eBbwqkzex4NxMeHx8oUNBG2FlFC3+q/eEVuWAJlkLUaD
voycn9drHyzjYJaOFbmLb2E+k8Z+t46vjMsYYplNIYwEi8M8RdWKvYXVOZnDsrCo
PieFjnuG8BJhr4cU5e15
=N1Zy
-----END PGP SIGNATURE-----

--Rln2GmQ7CFmDhc9B--
