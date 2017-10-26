From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Date: Thu, 26 Oct 2017 10:35:39 +1030
Message-ID: <1508976339.13477.5.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
         <20171020033727.21557-4-andrew@aj.id.au>
         <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
         <1508490173.24322.53.camel@aj.id.au>
         <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-1vx4oX1vugrucEw+S5e1"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
Sender: linux-doc-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-1vx4oX1vugrucEw+S5e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:14 +0100, Charles Keepax wrote:
> On Fri, Oct 20, 2017 at 07:32:53PM +1030, Andrew Jeffery wrote:
> > On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> > > I don't see it as helpful to give userspace control over whether the =
line
> > > is persistent or not. It is more reasonable to assume persistance for
> > > userspace use cases, don't you think? Whether the system goes to slee=
p
> > > or the gpiochip resets should not make a door suddenly close or the
> > > lights in the christmas tree go out, right? I think if the gpiochip s=
upports
> > > persistance of any kind, we should try to use it and not have userspa=
ce
> > > provide flags for that.
> >=20
> > Right. I guess the counter argument to your examples is if the gpio is
> > controlling any active process that we don't want to continue if we've
> > lost the capacity to monitor some other inputs (some kind of dead-man's=
=C2=A0
> > switch). But maybe the argument is that should be implemented in the
> > kernel anyway?
> >=20
>=20
> To me it certainly feels like decisions like this should live in
> the kernel, your talking about things that could cause very weird
> hardware behaviour if set wrong, so it makes sense to me to have
> that responsibility guarded in the kernel.

I feel that taking this argument to its logical conclusion leads to
never exporting any GPIOs to userspace and doing everything in the
kernel. If userspace has exported the GPIO and is managing its state,
then it can *already* cause very weird hardware behaviour if set wrong.
The fact that userspace is controlling the GPIO state and not the
kernel already says that the kernel doesn't know how to manage it, so
why not expose the option for userspace to set the persistence, given
that it should know what it's doing?

Cheers,

Andrew
--=-1vx4oX1vugrucEw+S5e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8SbTAAoJEJ0dnzgO5LT5qLEP/jd93Ahv7S0hlwakKByTLmxa
YMg+pf0g8EdII1IpX6UrL5TVxZhKLP+xa7gliK6ed/2FlkLHqzS4uOi3B8ihJ0KX
2+f8eAutg+/iCzqXPADNQWmG17ADTwDltnzuO9R0fmWBeL49nrgEvxaE7PN5tPOK
iG0WYLYb1CFHht0DM4fIvpRW7fYMK0MEVKZxsiOpIUSks+87EVkPd1aeKZdS037c
45FA9zzfO3vtKeUHB63iqho3uDnnBZOrwDmtrjnqTHkfspaBkkz0WIZ+Nf0LgCii
u3y034sAV5ZIY4uPfnag+QTllXciDfFHqkODr5u7aUgklfJWB/ddFsYNMqQ1Q9M2
1mqkO7pHvrl8imrtXVdAETDTrLTMZaODko+NkxoJRz9iusW/fAF6UXy55y70pfbs
fxNa5NAwk9b8P2zjhxSOLd2+T5yDm5b4V/VmjW3E7UgBjYmlhBk1PfaFP/xTWtUX
/aO9s3ugXhYmQDZTv1CSh1gq/dqIA1zb2mr7dUmpn19dMF5g4118B4qB7Y+d6Irb
9+JODzkBg3rsPvFeWO5PD/bWIH2E7QzNrthM+RdJW/3+MuU31MJOQ0IUWdvA0Ul0
5/005r7SHPgsutaaxgN1c5nVeMxbwohS4Ilsn8X6QNo+a/nhBd1Ymb97ZztxkhdF
p6LnTB+3V/A/O5MZ5zqW
=xNEy
-----END PGP SIGNATURE-----

--=-1vx4oX1vugrucEw+S5e1--

