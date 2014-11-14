From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: add pattern for respective device tree
 files to Armada entry
Date: Fri, 14 Nov 2014 21:37:10 +0100
Message-ID: <20141114203710.GR27002@pengutronix.de>
References: <1415994009-3548-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20141114201036.GH2001@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141114201036.GH2001-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Andrew,

On Fri, Nov 14, 2014 at 09:10:36PM +0100, Andrew Lunn wrote:
> On Fri, Nov 14, 2014 at 08:40:09PM +0100, Uwe Kleine-K=F6nig wrote:
> > This makes it more likely that changes to these files are addressed=
 to the
> > right maintainers.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 60b1163dba28..282e5427209c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1136,6 +1136,7 @@ M:	Sebastian Hesselbarth <sebastian.hesselbar=
th-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >  L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscri=
bers)
> >  S:	Maintained
> >  F:	arch/arm/mach-mvebu/
> > +F:	arch/arm/boot/dts/armada-*
>=20
> Hi Uwe
>=20
> Maybe also add kirkwood-* and dove-*
The maintainer entry is called "ARM/Marvell Armada 370 and Armada XP SO=
C
support". I think adding the correct dts files to the correct maintaine=
r
section is hard to get right for me as I'm not that deep into Marvell
stuff. Maybe some of you want to pick up this topic and reshuffle in a
correct way, e.g. by just merging all mvebu platforms in MAINTAINERS?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
