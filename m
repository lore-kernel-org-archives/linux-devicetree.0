From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Wed, 2 Nov 2016 20:51:06 +0100
Message-ID: <20161102195106.eazrl5oevykltvzd@lukather>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q@mail.gmail.com>
 <20161020135625.vro5cxkf3rxevwyn@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mclz7kicg5bjph7n"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161020135625.vro5cxkf3rxevwyn@lukather>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--mclz7kicg5bjph7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Oct 20, 2016 at 03:56:25PM +0200, Maxime Ripard wrote:
> Hi Linus,
>=20
> On Thu, Oct 20, 2016 at 03:04:46PM +0200, Linus Walleij wrote:
> > On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
> > <maxime.ripard@free-electrons.com> wrote:
> >=20
> > > The pin controller found in the Allwinner SoCs has support for interr=
upts
> > > debouncing.
> > >
> > > However, this is not done per-pin, preventing us from using the gener=
ic
> > > pinconf binding for that,
> >=20
> > How typical.
> >=20
> > > but per irq bank, which, depending on the SoC,
> > > ranges from one to five.
> > >
> > > Introduce a device-wide property to deal with this using a nanosecond
> > > resolution.
> > >
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > (...)
> > > +Note: For backward compatibility reasons, the hosc and losc clocks a=
re
> > > +only required if you need to use the optional
> > > +allwinner,debounce-time-ns property. Any new device tree should set =
them.
> > > +
> > > +Optional properties:
> > > +  - allwinner,debounce-time-ns: Array of debouncing periods in
> > > +    nanoseconds. One period per irq bank found in the controller
> >=20
> > Do you really *need* to specify this with nanosecond resolution?
> >
> > Else I would suggest to use microsecond resolution and just use
> > the generic binding (input-debounce) but on the device node instead
> > of the specific handler.
>=20
> Theorically, the debouncing clock can be set at 24MHz, which means a
> 42ns resolution.
>=20
> I've seen that the other bindings usually use microseconds, but in our
> case, we can really go lower than that.
>=20
> I don't really know if it makes sense though.

Any comments on this?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mclz7kicg5bjph7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGkOlAAoJEBx+YmzsjxAgkNsP/ia2AJYwOZTQgMrjlwqE65+a
186mWIuVAbzC56aCmx+2Y3sgoFOx+FiGaVsAZkJy/yUvtkdYvl1B9a14ZSJcTT2y
LstAi38MpAAYGbZ64iRI5dmJShtJEErZ50Y9PVBwkEh4rcoItt2/bUUyuP2O81sx
h5jU49yhviB5r2ocnGq7ZDdjNbsqc7zt1nUhy1SWuKn+fkOUiAnbt5lQgiVsWHbg
t3aoQtbZqqY5o/ArBx2qkMs26R0IuX+D0n+QwcIeGwwN65XIaW1S04vQkj4mru0r
O+QSP9aJrMjsqnY0EI+vwNCvfhR4cS+dULVJ4oOc2kVoSe0TnFDmoeBBWNOojlfy
vAaCCF6LER2oH0So27sKi5VA6q9TvIPGwWViO2vjWxXSRqjUpiQmKkNJc3NDjEt5
ll9aZEP9tHYgJKDM2RkwQNqTMS27ondq3olUkDAoB0WWmnPBPGgahmgWsIvFOZDH
nqMbWppEE9glxxBLDC3pLIJaajjDICQ0IPx2kGfHxCCh9E21xoHTnzR3Yf40ulxz
Ja/wSYvSkaBDlVgJ9tUt7kcJavoM5vEzyja4ru4aioCOqpuj3lZKM6d6Fo5dE6P6
c5pBfa3QS27yzoYkoRYDG786U0Ah79KiXKf4H4tTg0ZUFsSGtgvvLy9pOGqMCsBk
X036YLI2Ha9JEwgIKABh
=7Ega
-----END PGP SIGNATURE-----

--mclz7kicg5bjph7n--
