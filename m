From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 7/8] pinctrl: aspeed-g4: Add mux configuration for all
 pins
Date: Tue, 04 Oct 2016 11:32:53 +1030
Message-ID: <1475542973.5030.1.camel@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
         <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
         <20161003190833.GA3065@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-3NRTLbmWWQvYFjUXjHHe"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161003190833.GA3065@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Timothy Pearson <tpearson@raptorengineering.com>
List-Id: devicetree@vger.kernel.org


--=-3NRTLbmWWQvYFjUXjHHe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-03 at 14:08 -0500, Rob Herring wrote:
> On Wed, Sep 28, 2016 at 12:20:19AM +0930, Andrew Jeffery wrote:
> >=20
> > The patch introducing the g4 pinctrl driver implemented a smattering of
> > pins to flesh out the implementation of the core and provide bare-bones
> > support for some OpenPOWER platforms. Now, update the bindings document
> > to reflect the complete functionality and implement the necessary pin
> > configuration tables in the driver.
> We prefer bindings to be complete if possible where as drivers can be=C2=
=A0
> expanded over time.

Noted.

>=20
> >=20
> >=20
> > Cc: Timothy Pearson <tpearson@raptorengineering.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |=C2=
=A0=C2=A0=C2=A019 +-
> Acked-by: Rob Herring <robh@kernel.org>

Thanks,

Andrew

--=-3NRTLbmWWQvYFjUXjHHe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX8v+9AAoJEJ0dnzgO5LT5NE0QAKOQ4eHtmtADd4WH2zN9RKBi
GdKv5ia2zRKevryRrzc4hAGZHi3CFVOQgHxS7qurBSUng9qnrCx7UFBIBvhV4iRM
kdLEQuUjB4qurUeX2Ym3S8oLbgLWCiEDVsOg9DPC8+SiBpGXJc6jrd/h4IAI/js9
1NKTZQQiSAmpRuj3T8MhC+myo4OK56rEfalp30OEUnB8QnTiAtXk4DS7cmK2E2HX
HMv9BMREHBV5M4wSJByBNQ1+MPG0PFwfIp/eWkMxh3zJrf3ljPCX5iwZTlGS0qIX
zudvWMk3ffMblj6rhWVGUPMPhpsD6CafNHbGAe+K+7dNdY92ozmv6HBMEz8ug7lv
G97mtnYvDCUNHrDAsA5v1CHVre+hsiwMT9xj3fHzgBl4gkmFkGxhHa12TkqRWtL0
I+znNONJVanV5ETuYGVrVB3K04cnk8e4sqECdti0w19vLmdLMT0NQ0CO58JrQuJe
X8GyRMuLlf3R7meAXQCRf3jxD2umqDHm7XsLjAIbs60g07HBZBMHVihhR2mCHllR
LAUWzxg8j+kFTOJrWZlcrMfEg1/IWZppX2GiN+ya9rwq6AxsUGPClXvxfy4fMhB1
XlX7SIl7a3CLOiLJaGtVti7sQTbC9icID8SCZLHG18zbSQUpF2dv5CDU8Qf4uQ6q
ld+DrBwXYb5z3ZyBFpI4
=0/YM
-----END PGP SIGNATURE-----

--=-3NRTLbmWWQvYFjUXjHHe--
