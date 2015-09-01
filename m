From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Tue, 1 Sep 2015 21:17:55 +0100
Message-ID: <20150901201755.GZ5313@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
 <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
 <20150831145500.GP12027@sirena.org.uk>
 <CAPiN7iWFR2Sm8t9dUttNzwj-qZmUc-cdK69rGhG2RjD+s1gdSA@mail.gmail.com>
 <20150831180140.GS12027@sirena.org.uk>
 <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kr6QJ6xGUOmSrVQA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iWWAxhg6YQ8BjYHh+Gu8bvQrntvT4QGV+oDe4KAnb1nvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kr6QJ6xGUOmSrVQA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2015 at 12:20:20PM -0700, Chris Read wrote:

> Yes.  That is what we do.  We make custom boards for our main Arm
> CPU board.  However, rather than create a new kernel driver for every
> variant of hardware, we have the application software act like drivers in
> cases where high speed isn't required (such as GPIOs and switching
> on/off power supplies).

Yeah, so the power supplies bit is not something we want to encourage.

> > We really need people working on these maker devices to recognise that
> > Linux is a general purpose OS used on a wide ranging systems and that as
> > a result we need to explicitly describe things like expansion ports in
> > the DT rather than just hacking the system.  We don't want people making
> > routers and similar devices to form the impression that the simple and
> > idiomatic way to extend Linux is to just hack things from userspace.

> I want to follow the standard paradigms and elegance of the mainline
> kernel.  I don't want to create a set of hacks to do what we require, just
> use standard kernel mechanisms and drivers.  I also don't want to have
> to create custom drivers for every single board we create.  Nor do I want
> to have a "board file" to initialize every board.



> From what I see the standard kernel allows exposing GPIOs to userspace.
> There are kernel calls to do so.  It seems to be recognized as an important
> feature.  The standard kernel also has a regulator-consumer whose whole
> purpose is to expose control of a regulator to userspace.  So it looks like
> such userspace control is intended.

At least in the case of regulators those are specifically for use in
board file cases, they should never have direct DT bindings.

> My concern is that, while these features are appropriate to expose in
> userspace, I can't expose them using what are now the standard ways
> (i.e. without a board file or customized driver for each board).  I'd like
> to have a way to use the same kernel for all our boards, and have a
> configuration that can be provided that will expose the required ones.

So one thing you could do here is have your connector have a driver that
handles what it knows about for the cases where that's useful and just
punts everything else to userspace.  That way you don't need to actually
write the kernel code for every last thing and can still punt to
userspace but don't need to have a DT that represents the actual
hardware.

I don't know if other people think that makes sense though.

--kr6QJ6xGUOmSrVQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5gfyAAoJECTWi3JdVIfQfhYH/AzhW31OoabHEdTkxE3wad75
DlXCPkey5KTRvW2qqP6qJvW2ETXx+7LBGr2bKTbdixCK2dPlWi4AHD79XrrMsmi2
wp6Y3mZiBzHsi1O+089iZZFIx8q6Dwe2NfSFD1/ylgM0/D5CWi4PsfBkO0457kJD
2PvuOj/OmrZBcOGXBODDFSMRdlZN89N5PczCuKmNyhKj+LqeUIFpIl1erVoe2BXT
ezKdRZM6dcLxsqh5ygzu8YaZwEIRhscWednurHR7N36NV+I33zQ4WK98I92L28ra
AbEVkfHFZF8K5YvpgqL17MXbaqZwMdUQpzzNi3O3m7CfFJ7m173S2uW73JVdVXM=
=6w3G
-----END PGP SIGNATURE-----

--kr6QJ6xGUOmSrVQA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
