From: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6dl: disable dma support for spi on
 i.mx6dl
Date: Wed, 17 Sep 2014 16:41:22 +0800
Message-ID: <20140917084120.GA6369@Robin-OptiPlex-780>
References: <1410327012-31185-1-git-send-email-b38343@freescale.com>
 <1410774073.3314.1.camel@pengutronix.de>
 <20140916034123.GA20800@Robin-OptiPlex-780>
 <1410861006.2746.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410861006.2746.1.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 16, 2014 at 11:50:06AM +0200, Lucas Stach wrote:
> Hi Robin,
> 
> Am Dienstag, den 16.09.2014, 11:41 +0800 schrieb Robin Gong:
> > Hi Lucas,
> >   I understood your concern,but looks we have to break old DT.
> 
> Sorry, but this isn't going to happen. And honestly I don't even see the
> need to do so.
> 
> > Our old DT
> > support SPI DMA on i.mx6q/dl(v2,b3810c3dc1bcbc6a), but the DMA support patch
> > for SPI driver is still in reviewing(v6).
> 
> So this means now is the time to fix this driver patch to not enable DMA
> on imx6dl. Nobody will experience any breakage in this case.
>
Sorry, i.mx6q and i.mx6dl are totally same, not only IP but also clock. So we
can't distinguish them except for different compatible name....
> > So the violation you mentioned comes
> > if someone use the DT during the time(from v2 to spi driver patch upstreamed).
> >   The different behaviors on different chips(only i.mxdl can't pass strength
> > test) are just found from last month, this is why I sent the patch for disable
> > SPI DMA support on i.mx6dl during I sent v6 patch for spi driver. I think that's
> > make sense, because DTs are also in development, new difference between different
> > chips maybe found in the future although they share the same IP....
> >   Yes, I can check cpu type by looking at DT in spi driver, but it's not nice.
> 
> Yeah it would have been nicer if we had an explicit DT compatible for
> the imx6dl ecspi version, but it's not there, so we have to cope with
> this.
> 
> > So I'm afraid that we have to break the old DTs in the gap between the two
> > levels patch accepted cycle.
> > 
> > On Mon, Sep 15, 2014 at 11:41:13AM +0200, Lucas Stach wrote:
> > > Am Mittwoch, den 10.09.2014, 13:30 +0800 schrieb Robin Gong:
> > > > There is one weird data in rxfifo after one full rx/tx transfer
> > > > done sometimes. It looks a design issue and hard to workaround
> > > > totally, so disable dma functhion here. And will re-enable it
> > > > once the root cause found.
> > > > 
> > > Sorry, I'm late to this as Shawn seems to already have picked up this
> > > patch, but this isn't the right way to fix the problem.
> > > 
> > > We made it clear at kernel summit last year that we try to not break
> > > existing DTs as booting a new kernel with an old DT is a valid use case.
> > > While you don't strictly violate this rule what you do here is only
> > > fixing systems booting with a new DT while leaving others broken.
> > > 
> > > If you are working around a hardware problem please disable DMA support
> > > in the driver. This will also allow you to enable it again, if you find
> > > another workaround without touching the DT again.
> > > 
> > > So this patch gets a NAK from me.
> > > 
> 
> Regards,
> Lucas
> -- 
> Pengutronix e.K.             | Lucas Stach                 |
> Industrial Linux Solutions   | http://www.pengutronix.de/  |
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
