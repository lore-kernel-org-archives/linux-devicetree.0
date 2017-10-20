From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
Date: Fri, 20 Oct 2017 19:02:27 +1030
Message-ID: <1508488347.24322.51.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-2-andrew@aj.id.au>
         <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
         <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ZSkrhS+dG0skM+wwegTq"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-ZSkrhS+dG0skM+wwegTq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:43 +0200, Linus Walleij wrote:
> On Fri, Oct 20, 2017 at 9:17 AM, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> > > > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> w=
rote:
> >=20
> > > GPIO state reset tolerance is implemented in gpiolib through the
> > > addition of a new pinconf parameter. With that, some renaming of help=
ers
> > > is done to clarify the scope of the already existing
> > > gpiochip_line_is_persistent(), as it's now ambiguous as to whether th=
at
> > > means on suspend, reset or both.
> >=20
> > Isn't it most reasonable to say persistance covers both cases, reset
> > and/or sleep? This seems a bit like overdefined.
>=20
> I should also add: right now persistance is defined in negative terms,
> you can supply the flag "may lose value", which means the subsystem
> by default, and driver by default, will try to keep values persistent acr=
oss
> sleep.
>=20
> Then it is possible to opt in for not doing so. (Usually to save power I
> think.)
>=20
> I think that especially for userspace use cases, saving power should
> not really be the concern, but correct me if I'm wrong. I am thinking
> of a box with a DC plug wired up to a factory line here.
>=20
> What we have in the Arizona driver is an opt-in where the DT can
> say "don't preserve the value=C2=A0=C2=A0this line during system sleep" i=
.e. "lay lose
> value" and we can extend that flag to mean "don't preserve this line
> during reset either" but by default assume that we should.

Yeah, the preserve polarity was another thing I debated given the
current example with the Arizona driver. Not preserving is the default
for the Aspeed hardware, so that ended up influencing my choice. Not
that implementation details should necessarily influence interface
design, but it was at least more than a coin toss.

I don't have anything specific against preserving by default, just my
gut instinct and the hardware went the other way. As long as we expose
the option to opt out, which the additions for the Arizona already do.

Cheers,

Andrew
--=-ZSkrhS+dG0skM+wwegTq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6bSbAAoJEJ0dnzgO5LT5UUEP/RfdSznqJGJ+zlAtZ58qjsct
qRHU+r+//EDTqrv6ukCG5cY1R7invTIfP4e0+ajMz7hJ9DUhifWsc2L5efUkIMpR
mctcseROL77TI0uGtpPuW5G9xxCmxYpbE/woOtNdtQlGLgIQ+DawO+W8zvWBhsut
EjhVAEfQyvrK5q7b5D45OkH2J9ejO/k0GxpNZs66FGxgC41O6AGj4ZfUBSgBdyqm
HNjH9uLyfs4JR9bXptsdGTTCJAxog02UWLmROpGfiwz0ZwN6cdnJSl4dcu1Swn8D
4o+UPAg4j1bqHiV7dWIitJEM+cn9c0Ybpt1VPS1/WF6aGggubws89e9MnrNimrVS
k7qS3A7WRQJ3MPlBAwNLwfjPa+eBDBw5t8wZSDXSvXp37+mwHDgQotA9jZAR4Jqj
BdUAxHAy5yBIgopwo+G0XdHt/izkGGnoZBDToNBO67kD8Ct1lEDAjHn0ljal1k3l
heRjmkN2PiJ55d9QjF7qe/GbT6DZST5QiC1lOdSlg5f9G9Gm4KiyfSmkxneKYHTF
aERByeN/doqdYPtQ7LxlpBgN7bql9UBCn2I8PZimU1+zZu75no1F5eH8IFOV7vpJ
JWbHgg7JspuZY98pQMoFV6ASbJmTiQiWYMimm4ybXSb4Btdhgx0EJDOGaBi0r9ls
BzTFqMLL678jOVu0EkNA
=4duz
-----END PGP SIGNATURE-----

--=-ZSkrhS+dG0skM+wwegTq--

