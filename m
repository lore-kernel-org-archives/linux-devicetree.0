From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: bridge: sil902x
Date: Thu, 7 Jan 2016 08:01:38 +0100
Message-ID: <20160107070138.GT13058@pengutronix.de>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
 <20160106134736.GR13058@pengutronix.de>
 <20160106145330.03479703@bbrezillon>
 <20160106152638.GS13058@pengutronix.de>
 <CAKb7UvghNhGZLUX_3LchZoiYAtywN99tEpDy+k8ApPnPF-ce+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvghNhGZLUX_3LchZoiYAtywN99tEpDy+k8ApPnPF-ce+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 06, 2016 at 10:35:37AM -0500, Ilia Mirkin wrote:
> On Wed, Jan 6, 2016 at 10:26 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > On Wed, Jan 06, 2016 at 02:53:30PM +0100, Boris Brezillon wrote:
> >> Hi Sascha,
> >>
> >> On Wed, 6 Jan 2016 14:47:36 +0100
> >> Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> >>
> >> > Hi Boris,
> >> >
> >> > On Wed, Jan 06, 2016 at 12:25:50PM +0100, Boris Brezillon wrote:
> >> > > Add basic support for the sil902x RGB -> HDMI bridge.
> >> > > This driver does not support audio output yet.
> >> > >
> >> > > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> > > ---
> >> > > Hello,
> >> > >
> >> > > This patch is only adding basic support for the sil9022 chip.
> >> >
> >> > This thing is a SiI9022 for camel case "Silicon Image" with a capital 'I',
> >> > not a small 'l'.
> >>
> >> Oh, my bad, I'll fix that, but the vendor prefix defined in
> >> Documentation/devicetree/bindings/vendor-prefixes.txt is not helping in
> >> getting this right.
> >
> > No, indeed not. Unfortunately sii is already taken by Seiko.
> >
> >>
> >> Should I also change the driver name?
> >
> > I would suggest so, yes.
> 
> For opposing opinions:
> 
> drivers/gpu/drm/i2c/sil164_drv.c
> drivers/media/platform/s5p-tv/sii9234_drv.c
> 
> One of each :)

So we have examples for both, then we can continue with the correct
name ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
