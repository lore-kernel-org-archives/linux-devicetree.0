From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] reset: Add shared reset_control_[de]assert
 variants
Date: Wed, 16 Dec 2015 11:29:34 +0100
Message-ID: <20151216102934.GR19456@lukather>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
 <20151214093607.GF19456@lukather>
 <1450086655.3407.23.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTlsQtO0VwrbBARu"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450086655.3407.23.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jTlsQtO0VwrbBARu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 10:50:55AM +0100, Philipp Zabel wrote:
> Am Montag, den 14.12.2015, 10:36 +0100 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Fri, Dec 11, 2015 at 04:41:58PM +0100, Hans de Goede wrote:
> > > diff --git a/include/linux/reset.h b/include/linux/reset.h
> > > index c4c097d..1cca8ce 100644
> > > --- a/include/linux/reset.h
> > > +++ b/include/linux/reset.h
> > > @@ -11,6 +11,8 @@ int reset_control_reset(struct reset_control *rstc);
> > >  int reset_control_assert(struct reset_control *rstc);
> > >  int reset_control_deassert(struct reset_control *rstc);
> > >  int reset_control_status(struct reset_control *rstc);
> > > +int reset_control_assert_shared(struct reset_control *rstc);
> > > +int reset_control_deassert_shared(struct reset_control *rstc);
> >=20
> > Shouldn't that be handled in reset_control_get directly?
>=20
> This is about different expectations of the caller.
> A driver calling reset_control_assert expects the reset line to be
> asserted after the call.

Is that behaviour documented explicitly somewhere?

> A driver calling reset_control_assert_shared
> just signals that it doesn't care about the state of the reset line
> anymore.
> We could just as well call the two new functions
> reset_control_deassert_get and reset_control_deassert_put.

What happens if you mix them? What happens if you have several drivers
ignoring this API?

The current default API totally allows to have several drivers getting
the same reset line, and happily poking that reset line without any
way for the others to A) know they're not the single users B) let them
know their device has been reset.

And not being able to tell at the consumer level if and when our
device is going to be reset behind our back is a big issue. Because
then, we simply have to expect it can be reset at any point in time,
good luck writing a driver with that expectation.

The reset framework should make sure that the shared case is an
exception, and not the default case (and make sure that it cannot
happen in the default case). Just like for any other framework with
similar resources constraints.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jTlsQtO0VwrbBARu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWcT0OAAoJEBx+YmzsjxAgm9EP/1WkeiW76JsNwrecLgs+5Xa7
LKZEiRev+fbgXt7GzhVHURl9OZB04LuQpXkqkiyaci8Yjl3AQm10GKV0wnxdB2zn
JWkS1R6nc3j9qnpjDdnAPLEsGpE2f8WHUc+aEiLIa6jrCBwkdvUp2iGFm0TiC3Tc
27FPdqyK1mvb1xWKiSn1Hq86w2Y4dlicteDH1pMXJBzb4BZo73r9qlOtLi4G/xug
dglnFIQgt5FYfNdqvESNJ7b09OHqFU0+CNL3YINzVn1NisitDAJ+04Fv9qDG/3qE
NL96GuQ1oRqeAVurc8PvKc+pRUdbfkFlY7zV0YY2Y16RB1XN6kj1oyNhh0EvYvBq
R9XHzwxscJ34r8b5JfxxZuryXsCUBXefMIbXZx41vJTEyzUCHCmgbd4eVcEbMBc4
+/aKYKDJzHYjaEt2/DIGSMxDnTUjHxAh/nH+FzaL2eIByGxed+rnAmdKLvdmOAwz
k/xJl9UZtGEaMDQ2lWnGvMcZ2hlbztTszDNYnDybz16aeNPcq6Oqro1Q9sb10r0I
sWKYCqdhW2/CO7jKYUrCWJ/qiai18q1CtLKGvrsvOxan+vXiZxhAEWFzH7J92YrN
nBIMto+02DcjjaFSjCu/Q4FCuNYegfA6xwUCkssyEp1Wh9GfaWr4Qq2wkaFc14BH
ueE9HhihO5gNGdCCi2mG
=BxiW
-----END PGP SIGNATURE-----

--jTlsQtO0VwrbBARu--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
