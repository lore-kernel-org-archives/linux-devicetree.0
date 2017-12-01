From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 12:49:35 +0000
Message-ID: <20171201124935.qgqclyoatnnph63p@sirena.org.uk>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
 <CAOFm3uFWhOMy=0nibOjDP_vP+m7Dcf1cGOmXXgcrSy6PDfqEWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d77pgti6tbi35qod"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOFm3uFWhOMy=0nibOjDP_vP+m7Dcf1cGOmXXgcrSy6PDfqEWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--d77pgti6tbi35qod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 01, 2017 at 10:13:27AM +0100, Philippe Ombredanne wrote:
> On Fri, Dec 1, 2017 at 9:58 AM, Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:

> I think that per Linus, and Thomas doc patches for SPDX ids this
> should be instead either:

> > +// SPDX-License-Identifier: GPL-2.0
> > + // Copyright (c) 2017 Spreadtrum Communications Inc.

> or at least this with the id on the first and the // comment style

> > +// SPDX-License-Identifier: GPL-2.0

Are you saying SPDX requires C++ style comments?  That seems totally
broken.

--d77pgti6tbi35qod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlohT98ACgkQJNaLcl1U
h9Bwowf7ByYSx3vPIYSgOxwwkE2lJNf1NR2EUl9AxOUucJtw5+dtADmfY603T2wX
2LwdoTMyj6rnEvU9iIrS+27qDmCvJ6RNVCIiANBOmmb3WO15bpzBPUgcmksZ9i3+
NanzGw5X5Y+n8bxwk+eOph6K+XuPHBln8FQwiBlKvQ6s+4RSmWhzse13jSoULCVN
BXripFLPQnsFIXtibGfILglRxF+c8h88FQ+UNI2iuXfy0BKpRdnF0ikC3CLVX0gN
ZEStv3L6m/CExJmpBnG0/2d/ZQsTbmFBCJl9xchnFlJWQxeFJNGcI9xRJR4OnmTv
oiGuwSnma7HkYLJ8VclSUSL9UkuSgA==
=3jZ5
-----END PGP SIGNATURE-----

--d77pgti6tbi35qod--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
