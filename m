From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
Date: Mon, 16 Jan 2017 11:40:59 +0100
Message-ID: <20170116104059.cz2ypa5ixvvtfeqc@pengutronix.de>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdXJi9hJrY0ZV37gejp2XC6fkuLF7i7BqX4CUYTB7j_q1A@mail.gmail.com>
 <20170113194226.GH2472@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170113194226.GH2472@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, Jan 13, 2017 at 07:42:27PM +0000, Mark Rutland wrote:
> On Fri, Jan 13, 2017 at 07:42:34PM +0100, Geert Uytterhoeven wrote:
> > CC devicetree
thanks

> > 
> > On Fri, Jan 13, 2017 at 10:35 AM, Uwe Kleine-König
> > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> > > possible to use a mr25h40 by writing
> > >
> > >         compatible = "mr25h40", "jedec,spi-nor";
> > 
> > No vendor prefix?
> > 
> > >
> > > in a device tree. This chip however isn't JEDEC compatible however, so
> > > change the chip string and add a compatible entry to bless
> > >
> > >         compatible = "mr25h40-nonjedec";
> > >
> > > as the right way.
> > 
> > This whole "-nonjedec" business looks wrong to me.
> > If the device is called "mr25h40", its compatible value should be
> > "everspin,mr25h40". Adding some (in)compatibility indicator violates the
> > spirit of compatible values, IMHO.
> 
> Agreed on all counts.
> 
> The compatible string should specify the vendor and device, any
> compliance details should either be known for that string or derived
> from other properties.
> 
> IIUC this is following an existing pattern, which we should deprecate
> (retaining support for those strings so old DTBs work).

Looking at drivers/mtd/spi-nor/spi-nor.c there is in the spi_nor_ids
array:

	...
        { "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
	...
        { "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },

and similar entries for the other M25P members. So I guess these chips
couldn't do JEDEC at the beginning, then got feature updates but no new
name. So "m25p05-nonjedec" is fine as compatibility string?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
