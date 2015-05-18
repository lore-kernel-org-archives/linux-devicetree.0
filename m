From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Date: Mon, 18 May 2015 11:45:01 +0100
Message-ID: <20150518104501.GD3551@leverpostej>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150515195541.GL11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 15, 2015 at 08:55:41PM +0100, Brian Norris wrote:
> It really helps if I test patches...
>=20
> On Thu, May 14, 2015 at 10:32:53AM -0700, Brian Norris wrote:
> > In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add "no=
r-jedec"
> > binding"), we added a generic "nor-jedec" binding to catch all
> > mostly-compatible SPI NOR flash which can be detected via the READ =
ID
> > opcode (0x9F). This was discussed and reviewed at the time, however
> > objections have come up since then as part of this discussion:
> >=20
> >   http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074
> >=20
> > It seems the parties involved agree that "jedec,spi-nor" does a bet=
ter
> > job of capturing the fact that this is SPI-specific, not just any N=
OR
> > flash.
> >=20
> > This binding was only merged for v4.1-rc1, so it's still OK to chan=
ge
> > the naming.
> >=20
> > At the same time, let's move the documentation to a better name.
> >=20
> > Next up: prune the m25p_ids[] table to the minimal necessary listin=
g, so
> > we can stop referring to code (drivers/mtd/devices/m25p80.c) from t=
he
> > documentation.
> >=20
> > Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> > Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > I'd *really* like to get an 'ack' from a DT maintainer for this, th=
ose those
> > are apparently very hard to come by. And I'd really not like to hav=
e to revisit
> > this again in a few weeks. We have patches getting queued up for 4.=
2 that are
> > using the "nor-jedec" binding, and I'd like to nip those in the bud=
 ASAP.
> >=20
> >  .../devicetree/bindings/mtd/{m25p80.txt =3D> jedec,spi-nor.txt}   =
    | 6 +++---
> >  drivers/mtd/devices/m25p80.c                                      =
  | 6 +++---
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  rename Documentation/devicetree/bindings/mtd/{m25p80.txt =3D> jede=
c,spi-nor.txt} (85%)
> >=20
> ...
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25=
p80.c
> > index 7c8b1694a134..3d59ebc16b6e 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -223,7 +223,7 @@ static int m25p_probe(struct spi_device *spi)
> >  	 */
> >  	if (data && data->type)
> >  		flash_name =3D data->type;
> > -	else if (!strcmp(spi->modalias, "nor-jedec"))
> > +	else if (!strcmp(spi->modalias, "jedec,spi-nor"))
> >  		flash_name =3D NULL; /* auto-detect */
> >  	else
> >  		flash_name =3D spi->modalias;
> > @@ -255,7 +255,7 @@ static int m25p_remove(struct spi_device *spi)
> >   * since most of these flash are compatible to some extent, and th=
eir
> >   * differences can often be differentiated by the JEDEC read-ID co=
mmand, we
> >   * encourage new users to add support to the spi-nor library, and =
simply bind
> > - * against a generic string here (e.g., "nor-jedec").
> > + * against a generic string here (e.g., "jedec,spi-nor").
> >   *
> >   * Many flash names are kept here in this list (as well as in spi-=
nor.c) to
> >   * keep them available as module aliases for existing platforms.
> > @@ -305,7 +305,7 @@ static const struct spi_device_id m25p_ids[] =3D=
 {
> >  	 * Generic support for SPI NOR that can be identified by the JEDE=
C READ
> >  	 * ID opcode (0x9F). Use this, if possible.
> >  	 */
> > -	{"nor-jedec"},
> > +	{"jedec,spi-nor"},
>=20
> So I forgot (again; we hit this before) that the SPI/OF framework str=
ips
> everything before the first comma before binding devices. See
> of_modalias_node(). So I'll have to squash in the patch below to get =
a
> usable binding.

Is it not possible to use the of_match_table on spi_driver::driver? If
not, we really should make it so.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
