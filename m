From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 14:24:39 +0000
Message-ID: <20171201142439.vi7al4xcir4vmgqt@sirena.org.uk>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
 <CAOFm3uFWhOMy=0nibOjDP_vP+m7Dcf1cGOmXXgcrSy6PDfqEWQ@mail.gmail.com>
 <20171201124935.qgqclyoatnnph63p@sirena.org.uk>
 <CAOFm3uHsT8PTZL0tQ0E+7Bje9C8ZUcPd13qz9v6jZHzqEoXqKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ta4mmhipuis5c35e"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOFm3uHsT8PTZL0tQ0E+7Bje9C8ZUcPd13qz9v6jZHzqEoXqKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ta4mmhipuis5c35e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2017 at 02:39:42PM +0100, Philippe Ombredanne wrote:
> On Fri, Dec 1, 2017 at 1:49 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> >> or at least this with the id on the first and the // comment style

> >> > +// SPDX-License-Identifier: GPL-2.0

I snipped a bit of context here, the full example was actually:

| > +// SPDX-License-Identifier: GPL-2.0
| > +/*
| > + * Copyright (C) 2017 Spreadtrum Communications Inc.
| > + *

> > Are you saying SPDX requires C++ style comments?  That seems totally
> > broken.

> In can understand your point, but for reference please check Linus
> [1][2][3], Thomas[4] and Greg[5] comments on the topic.

> I am just a lowly messenger and even though I personally agree with
> Linus points and taste in this area, my weightless voice does not
> matter.

OK, so that's not quite what you were saying then.  The desire is to
have the SPDX block be the first line of the file (which you didn't
mention) and in general to encourage the use of C++ comments.  The
second example you gave there with the C++ comment followed immediately
by a C comment is definitely bogus.  If this is going to be the standard
we probably need tooling to enforce it, it's an extra requirement
compared to both cross project SPDX needs and existing Linux practice so
it's going to be really easy to end up with different things.

I have to say I'd have thought that if we were going to have a fixed
format for ease of parsing we'd be putting it at the end of files where
we already often have a block of very regularly formatted MODULE_FOO()
lines (not that that's 100% regular but it's more common than not) but
it doesn't make much difference and we've already got a large number of
these SPDX things done so it's a bit of a done deal.

--ta4mmhipuis5c35e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlohZiYACgkQJNaLcl1U
h9ATRAf/Xm9mH4NDU0dt8Suwsyj7nw34VryXLuEwdHYX1jcE3N1JaPqj10tKg//I
H2xTEi/EDTvDN4JKcj+Mv5kqvP6SVZgFo4fF58zN/rNS3SyxdtTSwhGw7RdM7aiI
aNeswjGJKAf6DzgUss/RpVxdleNGj2Xfbpxgx62dTFpcRLU+gO5K/80ii0JTmEfp
76L5cC0me8k+KLcArwtxjTyw/OdlSA9rYONKEi10HRKas99nnm56CFMgSN/N7aKW
R3lWYR/pv6E3SwGBfeJoZqfKakvT7mv7IVP3p/FdHpos2vyKWbuYG9TUjt3k3HHx
Ng+w1rTa8C1gTU26RRlVcgA4pBOUUg==
=xnOE
-----END PGP SIGNATURE-----

--ta4mmhipuis5c35e--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
