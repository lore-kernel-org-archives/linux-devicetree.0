From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Mon, 16 Jan 2017 20:41:54 +0100
Message-ID: <20170116194154.v2p2gbyvvfb5bwe6@pengutronix.de>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
 <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 02:55:01PM +0100, Rafał Miłecki wrote:
> On 16 January 2017 at 14:35, Uwe Kleine-König
> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > The MR25 family doesn't support JEDEC, so they need explicit mentioning
> > in the list of supported spi IDs. This makes it possible to add these
> > using for example:
> >
> >         compatible = "everspin,mr25h40";
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Hello,
> >
> > independent of the decision if -nonjedec is ok for m25p, this is needed
> > to make Everspin's MRAMs work.
> >
> > Best regards
> > Uwe
> >
> >  drivers/mtd/devices/m25p80.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
> >         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec"},
> >         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjedec"},
> >
> > +       /* Everspin MRAMs without JEDEC support */
> > +       { "mr25h256" }, /* 256 kib, 40 MHz */
> 
> A trivial thing: I think it should be Kib
> https://en.wikipedia.org/wiki/Binary_prefix

Oh, really? 10^3 = k and 2^10 = Ki, stange. Should I resend for that?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
