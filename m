From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Fri, 15 May 2015 16:12:16 +0200
Message-ID: <20150515141216.GW4004@lukather>
References: <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <20150429202332.GG6062@lukather>
 <20150430095722.GB1815@x1>
 <20150501053406.GI4946@pengutronix.de>
 <20150501064405.GB4047@x1>
 <20150507212052.GM11057@lukather>
 <20150508072246.GH16220@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CpBQqYjq/d0HQTAP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150508072246.GH16220@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
List-Id: devicetree@vger.kernel.org


--CpBQqYjq/d0HQTAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2015 at 08:22:46AM +0100, Lee Jones wrote:
> On Thu, 07 May 2015, Maxime Ripard wrote:
>=20
> > On Fri, May 01, 2015 at 07:44:05AM +0100, Lee Jones wrote:
> > > > > Does Sascha's antidote patch change your opinion?  We can use DT =
to
> > > > > declare critical clocks, and in the rare case of the introduction=
 of a
> > > > > new DDRFreq-like feature, which doesn't adapt the DT will still be
> > > > > able to unlock the criticalness of the clock and use it as expect=
ed?
> > > >=20
> > > > Honestly I'm not very fond of declaring these in the device tree, b=
ut
> > >=20
> > > I know why you guys are saying that, but I'd like you to understand
> > > the reasons for me pushing for this.  Rather than be being deliberate=
ly
> > > obtuse, I'm thinking of the mess that not having this stuff in DT will
> > > cause for clock implementations like ours, which describe more of a
> > > framework than a description.
> >=20
> > The DT should dictate our implementation, not the other way around. I
> > know that we are pretty bad at doing this, and that there's some clear
> > abstraction violations already widely used, but really, using this
> > kind of argument is pretty bad.
>=20
> I guess then you haven't correctly understood my argument, as that's
> exactly what's happened.  We have a DT implementation which accurately
> describes the clock architecture on each of our platforms. The
> associated C code in drivers/clk/ is written to extract the
> information from it, the hardware description and register the clocks
> properly.
>=20
> What makes you think differently?
>=20
> > The DT can (and is) shared between several OS and bootloaders, what if
> > the *BSDs or barebox, or whatever, guys come up with the exact same
> > argument to make a completely different binding?
> >=20
> > We'd end up either in a deadlock, or forcing our solution down the
> > throat to some other system. I'm not sure any of these outcomes is
> > something we want.
>=20
> Not sure I understand why this is different from any other binding?

The other bindings don't dictate the OS behaviour, this one does.

> > > The providers in drivers/clock/st are blissfully ignorant of platform
> > > specifics.  Per-platform configuration is described in DT.
> >=20
> > Maybe they just need a small amount of education then.
>=20
> Easy to say (and implement), but that means duplicating the hardware
> description in DT, which is not a design win.

Except that clock-always-on isn't an hardware information, it's what
you expect the OS to do with this clock. The fact that it's a critical
clock, would be way better, as it gives the OS the information that
this clock should be treated with care, and *possibly* never disable
it, but still leaves the option open to do whatever it needs to do
with it if it knows what it's doing.

> > > So we'd have 2 options to use a C-only based API; 1) duplicate
> > > platform information in drivers/clk/st, or 2) supply a vendor
> > > specific st,critical-clocks binding, pull out those references then
> > > run them though the aforementioned framework.  It is my opinion that
> > > neither of those methods are desirable.
> >=20
> > 3) have a generic solution for this in the clock framework, like Mike
> > suggested.
>=20
> Did you actually read and understand the points here?  If not, just
> say so and I'll figure out a way to explain the issues better.  3) is
> not an alternative to 1) and 2).  Instead 1) and 2) imply 3).

Ok, I misunderstood what you meant then, my bad.

> I *want* to have a generic solution, and have made several passes at
> writing one.  The question here is; what does that look like?  Some
> people don't like the idea of having it in DT due to possible abuse of
> the property.  But we can't have anything only in C because our clock
> implementation (rightly) doesn't know or (shouldn't have to) care
> about platform specifics.

This is exactly the point I was using in my previous argument. You're
using the state of your code and implementation ("our clock
implementation doesn't know about platform specifics") to push for a
DT binding ("I want to use clock-always-on or st,critical-clocks").

And you *can* have such a description in your code. You just don't
want to.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CpBQqYjq/d0HQTAP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVf7AAAoJEBx+YmzsjxAgxkUP/A6nL3BvHeyRpGaVjMy4AduC
vHnq1mQNGKldvLB1NxCrXlZFU3bKIKIMxPyXNOYjHyRCaxSfrKuOUeBIIFMkIe+M
ZrkOmlvyiA7lidv31htWhsbR+nubVgS8F+1IOzA4sCFU7YJ1RVCZZiQbPLgsxWaK
Ryc4KPnlTH6r708i4AInPICo2/sjccF6+AfC0gWO6LW7sEFlyoNv4MU+lqJttNdn
IRA82Fb/pFEEmmMPHkGNOVJQJIBcacg/4FM5VvIjXsX2zInwZMPqBj+9VDQrepX3
5+iZP+knIYDGw6vJLDBtuZVE00YEVeXoG7EPF5r3nN99JdfgyllvCibWxylMPi2w
m5PhEsAzbGOcZADDmTM//tWS0sBaWD9D7Vrds9jnSSx7qnexcDqol4CVh3ZBEt9q
xenF8GwznGX8U6YaFf8YxpWFCHqy+p5rladqwX4UV+M5G8+3Xvad+8EiDhi3f7bx
EzLc//hsCazwJEXW0qeNoVA0xyOQw3W0QOsqOrgIEr8CWRTDUjC85cMCX9ZQ1XhW
mGlCKFQR9pI4KCSzyUVFF7wLaRJ3t2fbKacl6npK0fCuuI5h8KwFva/6b27Lmdhp
6jN+elaoM2BHaCyhLKYCqwzVSEAzGVfDavnP4kAsLZaAWUD9pEPWuLQLz9D4SpII
Kav2iguGBeCBXdTtuOGq
=6QDu
-----END PGP SIGNATURE-----

--CpBQqYjq/d0HQTAP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
