From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 19:05:44 +0100
Message-ID: <20150828180544.GT12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PjTdUoKi0+yCYsVx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PjTdUoKi0+yCYsVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2015 at 10:24:54AM -0700, Chris Read wrote:
> On Fri, Aug 28, 2015 at 3:12 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

> > So long as the DT describes the HW, the subsystem can then choose to
> > expose the devices as it wishes, and any policy atop of that can then be
> > applied in the usual manner (e.g. udev for access control, naming, etc).

> The issue I see is that drivers may want to expose something in one case,
> but not in another, in a very board-specific way.  For example an I2C GPIO
> expander has a driver that allows reading and writing the GPIOs that it
> provides.  In one system the GPIOs control power switches and the DT
> is used to connect them to regulators, and they are activated as device
> files are opened.  There is no need to expose any GPIOs to userspace.
> On another board the GPIOs are attached to a connector that is intended
> for customization by an end user.  The same driver will want to expose
> the GPIOs to userspace in one case, but not in another.  Thus I see a
> need for some kind of board-specific configuration mechanism--without
> a "board file". It doesn't need to be DT.

What's the issue you see here?  The GPIO subsystem isn't really for
exposing things to userspace, it's for exposing GPIOs to the rest of the
kernel.  The DT should just describe how the GPIOs are used and then the
bindings for whatever the GPIOs are connected to will work out what to
do with them, including exporting them to userspace if that's how
they're handled.

> > I don't see this as strictly a policy issue, because it's so
> board-specific.

> A policy would need to allow for features like GPIOs to be both exposed or
> to not be exposed, but in a board-specific way.

You're trying to handle this at the wrong level, it's not an issue for
the GPIOs themselves.

> I see a strong need for board-specific configuration of drivers as they
> apply
> to exposure to userspace, but that need does not yet seem well addressed.
> There are some kernel modules (such as userspace-consumer.c) that are
> specifically designed to assist with this, but without some way to specify
> how to hook them up to other devices, they aren't available.

A driver can instantiate a userspace consummer if it finds that useful.

--PjTdUoKi0+yCYsVx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4KL3AAoJECTWi3JdVIfQqkwH/0LOb/VeSOIlHhyaqDUPqlJm
qHCre35Iew6L2CKxaCI7axRTL/rjHbj/b5nzSJuJv7FdV72sN8wAsuuMXZ07qU/f
N21Xe93GPtTfl0Y5LI2/MLiFKTbGsITSoPGFYiHmsniqnvVR3gGK/W2Tb7ijjLcl
G1BaghkN2rDvNjDmMREqzDaW3ApbsUVHy5+jS6D0PdXcapdofqsbCzvE9TwFc2h0
5rE4xDJ0wwWTpfWAw5qRRUbk+VEOtZD1i3MoCxzaUc5RMG1uzEXaH12N3AjGisMM
npU1c4RWeBhzgAL/QXjx3x/Q12crxQxBiqKOuhR+6Ipt59Uul9XQ53kVKb2Na/Y=
=httT
-----END PGP SIGNATURE-----

--PjTdUoKi0+yCYsVx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
