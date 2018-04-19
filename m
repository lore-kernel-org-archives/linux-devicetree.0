From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/9] media: platform: Add Sunxi Cedrus
 decoder driver
Date: Thu, 19 Apr 2018 16:56:05 +0200
Message-ID: <e26c30b31aa8a5ae9692dc050b08d2bca85d4536.camel@bootlin.com>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
	 <20180309101445.16190-3-paul.kocialkowski@bootlin.com>
	 <a9cc2e3b-585a-b238-4187-e3c874013d2a@iki.fi>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-g3Z6ANf+IGQOvuuMrD+p"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBVG44LLAKGQEOLKUYEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <a9cc2e3b-585a-b238-4187-e3c874013d2a-X3B1VOXEql0@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Joonas =?ISO-8859-1?Q?Kylm=E4l=E4?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Florent Revest <revestflo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Thomas van Kleef <thomas-XCRq7eEM0/pmR6Xm/wNWPw@public.gmane.org>, "Signed-off-by : Bob Ham" <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-g3Z6ANf+IGQOvuuMrD+p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2018-03-12 at 20:29 +0000, Joonas Kylm=C3=A4l=C3=A4 wrote:
> Paul Kocialkowski:
> > diff --git a/drivers/media/platform/sunxi-cedrus/sunxi_cedrus.c
> > b/drivers/media/platform/sunxi-cedrus/sunxi_cedrus.c
> > new file mode 100644
> > index 000000000000..88624035e0e3
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi-cedrus/sunxi_cedrus.c
> > @@ -0,0 +1,313 @@
> > +/*
> > + * Sunxi Cedrus codec driver
> > + *
> > + * Copyright (C) 2016 Florent Revest
> > + * Florent Revest <florent.revest-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > + *
> > + * Based on vim2m
> > + *
> > + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> > + * Pawel Osciak, <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>
> > + * Marek Szyprowski, <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This software is licensed under the terms of the GNU General
> > Public
> > + * License version 2, as published by the Free Software Foundation,
> > and
> > + * may be copied, distributed, and modified under those terms.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include "sunxi_cedrus_common.h"
> > +
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/delay.h>
> > +#include <linux/fs.h>
> > +#include <linux/sched.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/videobuf2-dma-contig.h>
>=20
> I think that the definitions
>=20
> #include <linux/clk.h>
> #include <linux/delay.h>
> #include <linux/fs.h>
> #include <linux/sched.h>
> #include <linux/slab.h>
> #include <linux/videodev2.h>
>=20
> are not used directly in the sunxi_cedrus.c file. Therefore they
> should be removed.

Thanks for the review, this will be done in v2.

Cheers,

--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-g3Z6ANf+IGQOvuuMrD+p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlrYrgUACgkQ3cLmz3+f
v9E/2wf/YjU0oWpwWBmey5xWwP7D4QnN2xXU7lTHzGNrzNeVayz5oY+oyHO76Gxw
No/1oYVhExYX5aD4D2MXx9leJuzulc2NpNF2J7dut/lRJgdUdeRqjJpd24MclL+T
M126jX6i9SV7ImAzANajenJhQOe40DTLcWu5LL4L4zt6Djj+r1KRdztncTQEV55m
2LYx6C3p1JW/qDYJaXhSRU09sKyB2f81+6GLO+yz4Cp4j1FYoy35tW7xRZYzPvZ/
irJI67+ApZ7EUJ1Yx1Bf5Yt1nzGwWcXR3CSAS+ZK4KADdui4oalQbBS0OmEOnkG9
Th93avgs532b7BYZhr9ZU5YSvmEL+g==
=b9ts
-----END PGP SIGNATURE-----

--=-g3Z6ANf+IGQOvuuMrD+p--
