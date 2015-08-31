From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 31 Aug 2015 19:01:40 +0100
Message-ID: <20150831180140.GS12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
 <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
 <20150831145500.GP12027@sirena.org.uk>
 <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z7r403WH++3KXERB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z7r403WH++3KXERB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2015 at 08:53:54AM -0700, Chris Read wrote:
> On Mon, Aug 31, 2015 at 7:55 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Why would this be appropriate?  Exporting a GPIO to userspace doesn't
> > sound like a property of the hardware...

> You're right.  It is not strictly hardware.  But I still need a place to specify
> this attribute in a board-dependent way. I suppose you could think of an
> end user as a hardware component (though we have soft parts too), then
> you'd be specifying that hardware's access to the hardware via the
> export flag.

That doesn't really hang together - it's nothing to do with the hardware
that this is what you want to do, someone might decide to connect an
expansion board which would most usefully be controlled by in kernel
drivers to exactly the same base hardware.

> >> For the regulator case, it looks like a hogging mechanism might be
> >> appropriate.

> > Do you mean something like the existing support for marking regulators
> > as always enabled?

> No.  I was assuming that the hogging mechanism would include the
> exporting capability from GPIOs.

So when you say "hogging" what you actually mean to say is "userspace
control"?  Please be clear in what you are saying, hogging normally just
means a way to provide a fixed configuration rather than runtime
configuration from userspace.  I'm sorry but I really don't think that
doing this is something that it is sensible to have as a feature, it's
not describing the hardware and it's an invitation to poor system
implementations.

We really need people working on these maker devices to recognise that
Linux is a general purpose OS used on a wide ranging systems and that as
a result we need to explicitly describe things like expansion ports in
the DT rather than just hacking the system.  We don't want people making
routers and similar devices to form the impression that the simple and
idiomatic way to extend Linux is to just hack things fromm userspace.

--z7r403WH++3KXERB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5JaAAAoJECTWi3JdVIfQAzYH/07CnAwQjGwJ8bDR/hiHBL3A
Hvt9WJA8ZC51BkrDiXSTLgn7urKmi/AAYZCLUZRmHjhlaCdmRSAq5NpAND0VJFEa
1hI40hp6DabXiwetxB1k3A9VqLSmRphfdxuloK3KSt/dbOLMP5rGy4f36ftVTZrF
EXD5Oa1CpXNEJyZtoLXv1Bl9jI0yHQUi9moAJxcKw5AuHWJtHJSP9KD3OWuVu8Kx
kUCfX+RPYU0NMvf3zzRtdrLNhQNTNA4aTfDD8tqcWskl1NI9Y7af8yzpJHtPweST
/lmo0u1Xpcq+rBrnvxrimy0j+Z3T//fUZpJsRwQNYiAe4qoFvrer2ibBYVXur5U=
=X5ZQ
-----END PGP SIGNATURE-----

--z7r403WH++3KXERB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
