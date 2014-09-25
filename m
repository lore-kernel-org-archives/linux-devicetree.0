From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] [RFC] Using hierarchy irqdomian to implement MTK intpol.
Date: Thu, 25 Sep 2014 21:20:24 +0200
Message-ID: <201409252120.24570.arnd@arndb.de>
References: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com> <alpine.DEB.2.10.1409251609500.4604@nanos>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1409251609500.4604@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>"Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1561eoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 25 September 2014, Thomas Gleixner wrote:
> On Thu, 25 Sep 2014, Joe.C wrote:
> > From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Here's the first draft of using hierarchy irqdomain to implement MTK intpol
> > support. I have tested it and intpol works fine. Before continue, I'd like
> > to get your comments. This is based on Jiang's hierarchy irqdomian [1] and
> > my mediatek SoC basic support [2].
> > 
> > Simplified block diagram for interrupt:
> > 
> >     ---------      ---------
> >  ---| CIRQ  |------|ARM GIC|
> >  ---|       |------|       |
> >  ---|       |------|       |
> >  ---|       |------|       |
> >  ---|       |------|       |
> >     ---------      ---------
> >  
> > In device tree, interrupt-parent for other devices is cirq, child of gic.
> > This describe HW better and allow device to specify polarity as it is sent
> > by the device. I'm using interrupt-parent to specify irq domain parent in
> > cirq now. Maybe adding another name like 'interrupt-domain-parent' will be
> > better.
> 
> I leave that to the DT folks.

interrupt-parent really defines a domain already, I think using this is
perfectly fine.


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
