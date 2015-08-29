From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Sat, 29 Aug 2015 10:30:47 +0100
Message-ID: <20150829093047.GX12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
 <20150828180544.GT12027@sirena.org.uk>
 <CAPiN7iXep-rWN5DyU1+Toso9CT7ppuNyEXX6ySU3AnxwBro2_A@mail.gmail.com>
 <20150828185256.GW12027@sirena.org.uk>
 <CAPiN7iUahed1uoMaFzVYHrdb-yRFUiej+c9S3GjZ0D2jw2+ygw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U6ZV60npyt4sCA+1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iUahed1uoMaFzVYHrdb-yRFUiej+c9S3GjZ0D2jw2+ygw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--U6ZV60npyt4sCA+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2015 at 12:32:16PM -0700, Chris Read wrote:
> On Fri, Aug 28, 2015 at 11:52 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Sure, but that's just a normal driver...  ideally for these sorts of
> > connectors there'd also be a way of enumerating anything that is
> > connected (but often that's not specified).

> So for such a connector, would it be appropriate to have a kernel
> module that gets configured using DT data, that is intended to be
> an "enumerator" of GPIOs, in that it configures them (sets them to
> input/output, gives labels, etc.), and also exposes them to
> userspace (if specified in the configuration data)?

Possibly, or possibly it'd just be hard coded for the connector.

> > No, you're missing the point.  The point is that that driver can be
> > instantiated from another device (one that describes the actual
> > hardware) if it is useful to do so.

> Perhaps I'm misunderstanding.  Is there already a board-specific
> not driver-specific way to have the userspace-consumer get attached
> to a regulator?  Can you point me at it?

No.  To repeat what I said above the driver for one device can most
likely instantiate another.  This is unlikely to be board specific, a
regulator being controlled from userspace is going to depend on how we
support the device it controls not on which board the device it controls
happens to be on.

> > I'd be very cautious about general drivers exposing regulators to
> > userspace at all...

> Certainly most don't.  We have externally powered devices that we
> want to power on and off, though, so sometimes it's helpful.

I would expect the driver for the device to do that.

--U6ZV60npyt4sCA+1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4XvEAAoJECTWi3JdVIfQkhgH/ixa4nJDtCy1VVZc5cQzat6W
ZO2/LngVMbHdMhd0mZcbaqtZ1aV26xugl3qjQ+VpT0PmQFLeRbAbW/+M71OzRVCn
oV5odhExI1HeWQ9c0t49VCa83NGIbdH1O5FzQP17QYXF/9+VC5Bo0UqXq/eORk1I
4mx0BAwrMuXRe42ukgaDoLjyUZ2Lbep/aqm1c9oAsIrHLxEJSBervZPxLfGl7f4r
/9nTTg5s4qhioilypm15gQL7vA32longuX/k4gx9btY+XlYmqMMJMIF43IMRsQGT
jloFpW5ZbPpfcL9HVXgDK6pYWzdhhV/aZ/9pLmfWp6E/vRjc8S/yLWdJX/nNyQI=
=FOs0
-----END PGP SIGNATURE-----

--U6ZV60npyt4sCA+1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
