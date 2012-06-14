From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Patch v5 06/13] usb: chipidea: add imx platform driver
Date: Thu, 14 Jun 2012 09:21:41 +0800
Message-ID: <20120614012141.GC29684@b20223-02.ap.freescale.net>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <1339590863-10564-7-git-send-email-richard.zhao@freescale.com>
 <20120613214622.GE30400@pengutronix.de>
 <201206132357.35099.marex@denx.de>
 <20120613220700.GI30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120613220700.GI30400-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2012 at 12:07:00AM +0200, Sascha Hauer wrote:
> On Wed, Jun 13, 2012 at 11:57:34PM +0200, Marek Vasut wrote:
> > Dear Sascha Hauer,
> > 
> > > > +
> > > > +	if (!pdev->dev.dma_mask) {
> > > > +		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
> > > > +				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> > > > +		if (!pdev->dev.dma_mask) {
> > > > +			ret = -ENOMEM;
> > > > +			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
> > > > +			goto err;
> > > > +		}
> > > > +		*pdev->dev.dma_mask = DMA_BIT_MASK(32);
> > > > +		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
> > > > +	}
> > > 
> > > Do you need this? I assume not.
> > 
> > Ain't this the dma mask crap without which the usb stuff won't work?
> 
> Yes, the device needs this, but afaik the of platform code will set this
> for you. You only have to do this manually for devices which you
> allocate yourself.
Unfortunately, devices device tree populated don't set dma_mask.
It always hit if (!pdev->dev.dma_mask). I'm not the only one suffer it.

Thanks
Richard
> 
> Sascha
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
