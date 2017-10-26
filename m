From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
Date: Thu, 26 Oct 2017 10:30:36 +1030
Message-ID: <1508976036.13477.3.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-2-andrew@aj.id.au>
         <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
         <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
         <1508488347.24322.51.camel@aj.id.au>
         <20171025081141.uczvbfstmt3jcisw@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-aw/Ol/GUAsa/IMnjh/7q"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171025081141.uczvbfstmt3jcisw@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-aw/Ol/GUAsa/IMnjh/7q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:11 +0100, Charles Keepax wrote:
> On Fri, Oct 20, 2017 at 07:02:27PM +1030, Andrew Jeffery wrote:
> > On Fri, 2017-10-20 at 09:43 +0200, Linus Walleij wrote:
> > > On Fri, Oct 20, 2017 at 9:17 AM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
> > > > > > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.a=
u> wrote:
> > > > > GPIO state reset tolerance is implemented in gpiolib through the
> > > > > addition of a new pinconf parameter. With that, some renaming of =
helpers
> > > > > is done to clarify the scope of the already existing
> > > > > gpiochip_line_is_persistent(), as it's now ambiguous as to whethe=
r that
> > > > > means on suspend, reset or both.
> > > >=20
> > > > Isn't it most reasonable to say persistance covers both cases, rese=
t
> > > > and/or sleep? This seems a bit like overdefined.
>=20
> Seems reasonable to me to just expand the existing stuff to cover
> reset as well, I don't think that should cause any issues for the
> Arizona stuff.

Great. I addressed this in the non-RFC series.

Thanks for the feedback.

Andrew
--=-aw/Ol/GUAsa/IMnjh/7q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8SWlAAoJEJ0dnzgO5LT5W4MQAJxWfNFjoqzWSR7SAQqX9XPw
Avk/BBnlqsYEtjb3yVJY1gCn2JafP4V9EmiShLaUN0gqVONOxGix7gLRJXVr59N+
dMjbxc83iz7xz+KS2N4wFFJk134zuw0olkpmonMyxcSkLheRm7FODjg1CysYg5ys
t67DLyXjq2zs2ikBIO18qnL0gn1wB0l8K9WkEV5St+w1lwlYc6ekgEvF07ERXxvp
65aVjyVXF66dUsP5W0DidxTxxxU1N5h0aRh9uhELXscmCopXo8xqJrksPnLwJaO2
SN2jBeWen+GRJlQA3H+6+32G2vIqXJ4PoRUxL6PhsRBu42j80hpgSA9A3ztVpj1M
p485dd7IljFD7V+HGdoDv5rZ2Kx0p+A0IVubxE4NsDZvLYJNHvfqsDP+7Cs/HaLE
ZAL+UOpcwWT4A/gqISwpxfpt7r4SJj4e6RSdb3Fc7rWTaZpy7LXQPci0hQS8qXg6
ZRPD3l8ji0Q0r6mGPaU0sIbAYiwm8tp+cJWaBHBslF/Xixd58f5XAI0HDo20+HVR
QlUALHwsb7Di0NWV4eXedSk8kuE8m9FxD8kuZsCM5njPag6Dqvi0MGpYPm8IVYVI
9tys6RrSMnMS9QQnub1Jzq1D7Cv4EE84pWVPd6tsl3Y8okeavn/gulYartRSWE90
KWjWDqN9sdBemHBxXyG5
=e34t
-----END PGP SIGNATURE-----

--=-aw/Ol/GUAsa/IMnjh/7q--
