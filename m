From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 2/2] rtc: add driver for RX6110SA real time clock
Date: Sun, 31 Jan 2016 15:04:18 +0100
Message-ID: <20160131140418.GD11885@pengutronix.de>
References: <1451927075-8656-1-git-send-email-s.trumtrar@pengutronix.de>
 <1451927075-8656-2-git-send-email-s.trumtrar@pengutronix.de>
 <20160131115457.GL20165@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160131115457.GL20165-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 12:54:57PM +0100, Alexandre Belloni wrote:
> On 04/01/2016 at 18:04:35 +0100, Steffen Trumtrar wrote :
> > The RX6110 comes in two different variants: SPI and I2C.
> > This driver only supports the SPI variant.
> > 
> > If the need ever arises to also support the I2C variant, this driver
> > could easily be refactored to support both cases.
> > 
> > Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > 
> > Changes since v3:
> >     - remove old copyright infos
> >     - use the BIT() macro
> >     - replace rx6110_get_week_day() with ffs()
> >     - replace hardcoded offsets with enum
> >     - use regmap_bulk_write in set_time
> >     - use regmap_register_patch in init function
> >     - return -EINVAL instead of "fixing" time in the rtc
> > 
> >  drivers/rtc/Kconfig      |   9 ++
> >  drivers/rtc/Makefile     |   1 +
> >  drivers/rtc/rtc-rx6110.c | 402 +++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 412 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-rx6110.c
> > 
> Applied, after realigning some lines in rx6110_probe().
> 

Thanks :-)

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
