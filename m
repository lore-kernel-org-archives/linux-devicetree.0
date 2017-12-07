From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 08/15] drm/sun4i: Add LVDS support
Date: Thu, 7 Dec 2017 11:50:29 +0100
Message-ID: <20171207105029.w4k2zwlr4aygzdzg@flea.lan>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
 <b900e5963180c94ca02bde178b6674622a127787.1512486553.git-series.maxime.ripard@free-electrons.com>
 <CAOFm3uEpnBFUDBHK+SqQ-pGUPcWbGXNrWum4HRJ34tMtoX-2Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkiix4nqlogualap"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOFm3uEpnBFUDBHK+SqQ-pGUPcWbGXNrWum4HRJ34tMtoX-2Qw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vkiix4nqlogualap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 07, 2017 at 11:14:27AM +0100, Philippe Ombredanne wrote:
> On Tue, Dec 5, 2017 at 4:10 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The TCON supports the LVDS interface to output to a panel or a bridge.
> > Let's add support for it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> []
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
> > @@ -0,0 +1,183 @@
> > +/*
> > + * Copyright (C) 2015 NextThing Co
> > + * Copyright (C) 2015-2017 Free Electrons
> > + *
> > + * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
>=20
> Would you consider using the new SPDX ids instead of this fine legalese?
> e.g. this as the top line:
>=20
> // SPDX-License-Identifier: GPL-2.0+

I did, and then forgot about it.

This will be in my next iteration, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vkiix4nqlogualap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlopHPEACgkQ0rTAlCFN
r3SfUw//d6qnHKb19/Uzy/A6Z3TZNaVbrOpW5DTeqBaK8I8oey3oeaxYOjKTpJQ1
tL70bj7sSSZN1g3kYv+VHmM6Fb7iIcRSHEAJXYitahLur8DWGMSsLoQ/8KOyyH8C
F8BxN5005AbSZU1zSmN9LkMaY64lSJiOyn+kw/6ZXjWYKoDH1ou44qrLri4dDUf5
Kaw7VsMmxDPK6O4ljZ1PV8qZ8Ym3FGSJfFopDJqPNlAzE3ME5fdXvk7JKg5/0O46
KgfSbcgIKQ9JTkBGff5GuNTBfb+2kHRf0IXrJhSo/2LUyDpLAgQuEKJkhKJJIRHa
JnFopyx60+5RExDYJaQuQksohAqTe/luGXvMXCwftpiQ9t+2to13kgALRfJ/+QD/
8TKC9lCfx9qNoKfnisZoIJ4vEkfAlKo+AuWoKuL/99LibKb7U9W6OjFvIAXGJm6R
JqvsMB9KFIf/Z/E/Eg0rRl3jQzZpQvJxxTtHG4ExVRqcb7ZtEB85xlxPhhcpaIk7
g0xIF9zkNjL6LHS1llHhYOJiUi7uVC1foipvtiO42RkrXSO8tT7fS6Q7nluNejHS
LYG4ndXwoHGHQGz1cZDto+YjEbCYngO4WdRKKBy/Th2VxX4rTXqEBFxUZLJNdsYC
U7nweoaLOk1ZaB2M0n1mKH9oSApNJWg82y7Qspom4Wu4qVk2KKs=
=PIvI
-----END PGP SIGNATURE-----

--vkiix4nqlogualap--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
