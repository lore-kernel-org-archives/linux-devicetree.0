From: Mark Brown <broonie@kernel.org>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Mon, 12 Jan 2015 12:45:37 +0000
Message-ID: <20150112124537.GH4160@sirena.org.uk>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com>
 <1416527684-19017-2-git-send-email-bparrot@ti.com>
 <CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com>
 <20141201163639.GI25249@lukather>
 <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com>
 <CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9pdWa5g@mail.gmail.com>
 <20141202161227.GH30256@lukather>
 <CACRpkdYuRSi8B7jr2F1zYZB4OHvpH9EXOmU0qGa9+O77gcNA7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DwoPkXS38qd3dnhB"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYuRSi8B7jr2F1zYZB4OHvpH9EXOmU0qGa9+O77gcNA7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>, Benoit Parrot <bparrot@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--DwoPkXS38qd3dnhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2015 at 10:40:04AM +0100, Linus Walleij wrote:
> On Tue, Dec 2, 2014 at 5:12 PM, Maxime Ripard

> > We do have one board where we have a pin (let's say GPIO14 of the bank
> > A) that enables a regulator that will provide VCC the bank B.

> I think it's a hog in this case though, not a GPIO regulator,
> definately not both. But let's check Mark's opinion on this.

I'm lacking some context here but my first thought is that if VCC might
be supplied by some other thing we need to use a regulator since
otherwise we can't substitute in the other regulator.

--DwoPkXS38qd3dnhB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUs8HwAAoJECTWi3JdVIfQYiQH/1nDd83kFMRVgndnF6Jt9p8y
FZPACvCGo8ThE8aFdODAQEXwl0uxs7duSSnSo7FMODl/YCqpfoil611D3BwvhPnR
jOPRzKP6vXjez/KIsADo8GhdtPf6Kj8bNvFkgsMpUfLyZqiyEZiCcz2RY+vxdahr
ue/njPwe+XZHDbolO2P6njFyI29iGz9xkNh3Iv53ikiOQgIxdVBmQRBOoV41hM0c
Z6Xd/l8KFCemE0olxuUFOmzeZHdF4rQgWbyYLCByQeMgesieAod/kVaPYXIdbAfC
DWZuQOq0iIIpSYc8OJegoB4YHMnfgnSpdjQ3M01CXuZHaH75/sUE64cpt0veNZE=
=lHho
-----END PGP SIGNATURE-----

--DwoPkXS38qd3dnhB--
