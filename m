From: Philipp Zabel <pza-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 0/7] ARM: rockchip: add smp functionality
Date: Sat, 1 Feb 2014 22:51:40 +0100
Message-ID: <20140201215140.GA1375@pengutronix.de>
References: <4970034.fqvMoHdOyd@phil>
 <13010296.nzTT2PqdSR@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <13010296.nzTT2PqdSR@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Fri, Jan 31, 2014 at 11:03:03PM +0100, Heiko St=FCbner wrote:
> On Monday, 20. January 2014 16:41:43 Heiko St=FCbner wrote:
> > This series enables the use of the additional cores on Rockchip
> > Cortex-A9 SoCs.
>=20
> So, two weeks without any general complaints, but I guess part of the=
 more=20
> general patches could use an ack.
>=20
> Going forward, what would be best way to merge them?
> As one pull request to arm-soc, or for example splitting them into th=
e first=20
> three patches going through the misc tree and the rockchip specific s=
tuff going=20
> through arm-soc? Or something else altogether?
>=20
>=20
> > Heiko Stuebner (7):
> >   of: add functions to count number of elements in a property
>=20
> One of the intermediate versions of this patch got a
> 	Reviewed-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> .
> Mark, is this still true for this variant addressing some additional =
wished=20
> from Rob?
>=20
> And this final version got a "Looks good" from Rob Herring in the ori=
ginal=20
> thread, but a more formal "ack" might be nice :-) .
>=20
>=20
> >   dt-bindings: sram: describe option to reserve parts of the memory
> >   misc: sram: implement mmio-sram-reserved option
>=20
> Philipp, you acked an intermediate version, and this v7 now should al=
so=20
> contain the two separate loops (1st gathering data and 2nd creating t=
he pool=20
> parts) you asked for.
>=20
> Could I persuade you to take a look again?

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
