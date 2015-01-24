From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] irqchip: mtk-sysirq: Get irq number from register
 resource size
Date: Sat, 24 Jan 2015 18:26:21 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501241825410.5526@nanos>
References: <1421054073-43468-1-git-send-email-eddie.huang@mediatek.com> <1421054073-43468-3-git-send-email-eddie.huang@mediatek.com> <CABuKBeKGbxR8YQcVPJyZDpnVsNUsTxQQhsisW_F2L13zfgeyjw@mail.gmail.com>
 <CABuKBeKJGx8mrjd+izR1zjxQNcWF+T2uUK=MbMbHYrXdRDTOyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBeKJGx8mrjd+izR1zjxQNcWF+T2uUK=MbMbHYrXdRDTOyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?GB2312?Q?YH_Chen_=28=EA=90=
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jan 2015, Matthias Brugger wrote:
> 2015-01-13 14:12 GMT+01:00 Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > 2015-01-12 10:14 GMT+01:00 Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> >> From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>
> >> Originally mtk-sysirq hardcoded supported irq number to 224. This
> >> was fine since all SoCs before support the same number of irqs for
> >> intpol.
> >>
> >> However MT8173 intpol support 32 more irq pins, changes to get
> >> irq number from register resource size to suppor MT8173 properly.
> >>
> >> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> ---
> >>  drivers/irqchip/irq-mtk-sysirq.c | 18 +++++++++++-------
> >>  1 file changed, 11 insertions(+), 7 deletions(-)
> >>
> >
> > Jason, Thomas, will you take this patch through your branch?
> > I will take the rest of the series.
> >
> > Best regards,
> > Matthias
> >
> > --
> > motzblog.wordpress.com
> 
> Hi Thomas, hi Jason,
> 
> do you have any comments on this patch?

Jason is swamped. I'm currently collecting stuff.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
