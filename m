From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 08/15] watchdog: orion: Introduce per-compatible
 of_device_id data
Date: Wed, 22 Jan 2014 14:06:22 -0300
Message-ID: <20140122170621.GC27273@localhost>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390310774-20781-9-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121163547.GB3311@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140121163547.GB3311-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 08:35:47AM -0800, Guenter Roeck wrote:
> On Tue, Jan 21, 2014 at 10:26:07AM -0300, Ezequiel Garcia wrote:
> > This commit adds an orion_watchdog_data structure to holda compatib=
le-data
>=20
> 	s/holda/hold/
>=20

Yup.

> > information. This allows to remove the driver-wide definition and t=
o
> > future add support for multiple compatible-strings.
>=20
> Maybe "and to be able to add support for multiple compatible-strings =
in the
> future" ?
>=20

Yes, sounds better.

[..]
> > =20
> >  #define WDT_MAX_CYCLE_COUNT	0xffffffff
> >  #define WDT_IN_USE		0
> >  #define WDT_OK_TO_CLOSE		1
> > =20
> While looking at the new defines below, I noticed that WDT_IN_USE and
> WDT_OK_TO_CLOSE are not used (anymore ?) and thus should be removed
> (separate patch, though).
>=20

OK, let's clean this.

> > -#define WDT_RESET_OUT_EN	BIT(1)
> > +#define WDT_A370_RATIO_MASK(v)	((v) << 16)
> > +#define WDT_A370_RATIO_SHIFT	5
> > +#define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
> > +
> > +#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
> > =20
> Those new defines are not used. They should be introduced if and when=
 used.
>=20

Hm... maybe after dozens and dozens of rebases these macros sneaked her=
e?

[..]
> > =20
> > +	match =3D of_match_device(orion_wdt_of_match_table, &pdev->dev);
> > +	if (!match)
> > +		/* Default legacy match */
> > +		match =3D &orion_wdt_of_match_table[0];
> > +
> >  	dev->wdt.info =3D &orion_wdt_info;
> >  	dev->wdt.ops =3D &orion_wdt_ops;
> >  	dev->wdt.min_timeout =3D 1;
> > +	dev->data =3D (struct orion_watchdog_data *)match->data;
>=20
> match->data is a void *, so the typecast should not be needed here.
> You might want to declare 'data' to be of type
> 'const struct orion_watchdog_data *' because otherwise you loose the
> 'const' attribute of match->data (which may be the reason for the typ=
ecast ?).
>=20

Done.

Thanks a lot for reviewing!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
