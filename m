From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 19:52:56 +0100
Message-ID: <20150828185256.GW12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
 <20150828180544.GT12027@sirena.org.uk>
 <CAPiN7iXep-rWN5DyU1+Toso9CT7ppuNyEXX6ySU3AnxwBro2_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rfmCU+hJU+UQGUl0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iXep-rWN5DyU1+Toso9CT7ppuNyEXX6ySU3AnxwBro2_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rfmCU+hJU+UQGUl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2015 at 11:43:19AM -0700, Chris Read wrote:
> On Fri, Aug 28, 2015 at 11:05 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

Please delete unneeded context from your replies, it makes it much
easier to find any new content you have added.

> > What's the issue you see here?  The GPIO subsystem isn't really for
> > exposing things to userspace, it's for exposing GPIOs to the rest of the
> > kernel.  The DT should just describe how the GPIOs are used and then the
> > bindings for whatever the GPIOs are connected to will work out what to
> > do with them, including exporting them to userspace if that's how
> > they're handled.

> There is also the case, as in the connector example above, where the
> GPIOs are not connected to anything that has a driver associated with
> it.  In those circumstances it seems reasonable to allow a kernel module
> to act like the driver which you suggest would normally work out what

In this case the connector is the thing with the driver (or other in
kernel user) and should be reponsible for doing something sensible with
what's on the other end of the connector.

> to do with the GPIOs, and export them if necessary.  My thought,
> however, is that the kernel module would need to be configured with
> board-specific data, including whether to expose the GPIOs to userspace.
> It also seems like such configuration data might look like DT data.

Sure, but that's just a normal driver...  ideally for these sorts of
connectors there'd also be a way of enumerating anything that is
connected (but often that's not specified).

> > A driver can instantiate a userspace consummer if it finds that useful.

> There is a userspace power-regulator consumer driver (found in
> drivers/regulator/userspace-consumer.c) that was created to do
> just that.  It allows hooking up a userspace controlled consumer
> to any regulator allowing control from userspace.  So far so good.

No, you're missing the point.  The point is that that driver can be
instantiated from another device (one that describes the actual
hardware) if it is useful to do so.

> If a driver writer needs to conditionally expose some kind of control
> to userspace based on some board-specific configuration mechanism,
> I don't currently see a way to do that.

I'd be very cautious about general drivers exposing regulators to
userspace at all...

--rfmCU+hJU+UQGUl0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4K4HAAoJECTWi3JdVIfQCUEH/iaawrbSwDoPipf1kyzExovP
RkcyYKo+A249aWnRUwcN/C2SK0RKiRbaBJkIKoKFm5OJ6bmX1A1bk/MLSmQWcmg3
BumNxs+QUzr9h3e1HlYetqXZzbkvJSWgC/vaJHDlI+v22cZiAsb46SyS4RBVLcXR
WAb331Z9lrguifCw+Vq5Ffm+bCvvd7CO954KVSwpVZmbb3Htya/hyFdWbXdDw1Y1
NaVdd+bELbgc+TZS/4FREvxiJTFm9tOfTJWh+QE0IcGRb37HKv355G9ePutQW+vs
rZU9C5oyXh36rwJnrkUdzigwaMlNSyLXIakQkYSv3yi08ASrkCh80Y/cNCLdYsw=
=py9l
-----END PGP SIGNATURE-----

--rfmCU+hJU+UQGUl0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
