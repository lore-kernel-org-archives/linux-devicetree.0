From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 1/2] gpio: gpiolib: Expand sleep tolerance to include
 controller reset
Date: Mon, 30 Oct 2017 10:26:26 +1030
Message-ID: <1509321386.13477.13.camel@aj.id.au>
References: <20171025050417.27992-1-andrew@aj.id.au>
         <20171025050417.27992-2-andrew@aj.id.au>
         <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
         <1508978453.13477.7.camel@aj.id.au>
         <20171026090318.uv6lvmkt4injiihc@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-1HsBu1GI6qFSDyOpsPJT"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171026090318.uv6lvmkt4injiihc@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com, joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com, ryan_chen@aspeedtech.com, bgolaszewski@baylibre.com, mwelling@emacinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-1HsBu1GI6qFSDyOpsPJT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-26 at 10:03 +0100, Charles Keepax wrote:
> On Thu, Oct 26, 2017 at 11:10:53AM +1030, Andrew Jeffery wrote:
> > On Wed, 2017-10-25 at 09:32 +0100, Charles Keepax wrote:
> > > On Wed, Oct 25, 2017 at 03:34:16PM +1030, Andrew Jeffery wrote:
> > > This means that if we have a set_config we are directly
> > > equating PERSISTENT to RESET_TOLERANT, which seems wrong to
> > > me. I might have a GPIO on a controller with pinconf that
> > > doesn't have anything to do with RESET_TOLERANT. Should the
> > > PIN_CONFIG_RESET_TOLERANT, really just be PIN_CONFIG_PERSISTENT?
> > > And then its upto the driver what persistence means for that
> > > chip?
> >=20
> > Right, maybe I'm tying the design in a bit too closely with the Aspeed =
hardware
> > again. I'm coming out in favour of changing it based on my thoughts bel=
ow.
> >=20
> > However, I want to understand whether there are alternatives to reset t=
olerance
> > as a property. The obvious one is sleep persistence as implemented in t=
he
> > Arizona driver, but it didn't take the set_config() route with its init=
ial
> > implementation.
> >=20
> > The set_config() approach was largely driven by the sysfs patch in
> > the RFC series, because I wanted a way to propagate the desired propert=
y
> > to hardware without affecting (or again calling through the handlers fo=
r) the
> > export state or direction. It seemed to come out neat enough in general=
 so I
> > kept it.
> >=20
> > Were you thinking of using set_config() to control the Arizona's behavi=
our and
> > do something other than the calls to gpiochip_line_is_persistent() in
> > arizona_gpio_direction_{in,out}() (as in, keep the state inside the dev=
ice
> > driver rather than querying gpiolib where the state is currently stored=
)? That
> > would seem neat in that it gives us one method of setting both persiste=
nce
> > types (and in this case I should rename the pinconf parameter). With th=
at we
> > could probably get rid of gpiochip_line_is_persistent(). A small downsi=
de is
> > some duplicated state (we probably still want to keep FLAG_TRANSITORY i=
n
> > gpiolib).
> >=20
> > Would it be reasonable for other drivers to implement sleep persistence=
 in the
> > same manner as the Arizona driver currently does? If that's the case, I=
 don't
> > think there is a third tolerance option in addition to sleep and reset,=
 and so
> > we might not need to rename the pinconf parameter.
> >=20
> > Finally, we could implement reset persistence in the same manner as the
> > Arizona's sleep persistence (with gpiochip_line_is_persistent()) given =
the
> > sysfs patch has been thrown away.
> >=20
> > So to summarise, having rambled a bit, I see the situation as:
> >=20
> > 1. Rename the pinconf parameter, and patch the Arizona driver to use
> > =C2=A0=C2=A0=C2=A0set_config() and hold sleep persistence state interna=
lly.
> > 2. Drop the pinconf parameter and do something similar to the Arizona's=
 sleep
> > =C2=A0=C2=A0=C2=A0persistence for reset persistence in the Aspeed drive=
r.
> > 3. Keep things as proposed are and live with two approaches to persiste=
nce
> >=20
> > Point 3 seems like the least desirable. I'm leaning towards 1. I could =
probably
> > live with 2. after experimenting with it and confirming it's workable f=
or me.
> >=20
> > If you think 1. is the way to go are you happy for me to send a patch t=
o the
> > Arizona driver implementing the change?
> >=20
>=20
> I guess the design was more playing to the fact that in the
> Arizona case we arn't really setting any register bit for the
> persisence, we are just not letting the CODEC power down whilst
> the GPIO is in use. The config approach does make more sense in
> the case where you are actually setting register bits.
>=20
> I don't have any great objection to keeping the persistence state
> in the Arizona GPIO driver, but it does seem to be duplicating
> the state a little. Also an early version of the patch chain did
> that and we decided it would better in the core.
>=20
> I am not opposed to option 3 either. For example open-drain has
> a similar setup where there is a pin config option for it and
> also a GPIO function call to check for its presence on a specific
> GPIO. Certainly my objection was just that we were equating the
> very generic property to a very specific pinconf.
>=20
> I think I would probably be keen to see what Linus's thoughts
> are, but my feelings are really your patch is probably good if we
> just rename the RESET_TOLERANT pinconf to something a little more
> generic.

Okay, well in that case I'll do the rename and send out the patches, it
is simple enough. Thanks again for your feedback.

Andrew
--=-1HsBu1GI6qFSDyOpsPJT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9mqqAAoJEJ0dnzgO5LT5Y00P/1FS/NlkwJZND2ILIEzoOvdl
mo3imkiD0ocvY3nB1z4YNL8WLJDbDb7/6DuRz8mJFRk12Qj/TSPSVyFxAnGnzuTP
tHTBo530AuMbR7mc9xtdKSOiC2sHsiL1tdJhAkkqSNMtefblimB/oRdS2Kdm3xGB
7itqR7jIjVv8mDxgkyJQvKiAWLH4ufBSSJazXfXhj1cu5KUPZwc0tyxxl/6y26+g
zr5XaeqHdl7jRRQX2Qkng9ti3JuCG00XvbWkxFuXQyvomJXU7YKrUcudy7IebDa5
6dOJtRatq8Zc7fiUQ3BCyRzUt79i9N71hDsuvXo3qg9sXlvrbK/o/ewVJcbOpWWr
DFiozZWFlmw51ftZCm9wbrvJV+9EGBmeJU2b/pHy6LDW8QOTMfomQ8eE+nra1lhW
DHobb6coFL0DcoWtZGkEMABx2kbYjQt1LZnXyJ3z/ylFrNvRK+DE5VY0VVKPZyfq
EYcr+vw+lLsl3DE/HhTlzzwx3pMlBBXGFJd7yv4G9oX2QgMtjAd22+Zn7CqtNOhr
vkTunj7OeyiU6PeqyYudatBruAzR/GZltsu9DPgTnP+GT6TIINK4U2pb1W24+H8h
2zBv6AghcAXk/CbS2hAlOHqmo5Vlq2C0knZtYxEwK8RpFRcLyROWiZMiUL2sy52J
Df6ykR/e3fRklkYAxTC1
=OOYC
-----END PGP SIGNATURE-----

--=-1HsBu1GI6qFSDyOpsPJT--

