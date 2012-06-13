From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [Patch v5 06/13] usb: chipidea: add imx platform driver
Date: Wed, 13 Jun 2012 23:57:34 +0200
Message-ID: <201206132357.35099.marex@denx.de>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <1339590863-10564-7-git-send-email-richard.zhao@freescale.com> <20120613214622.GE30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120613214622.GE30400-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Sascha Hauer,

> On Wed, Jun 13, 2012 at 08:34:16PM +0800, Richard Zhao wrote:
> > This patch supports only the host-mode functionality so far.
> > 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > ---
> > 
> >  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 +++
> >  drivers/usb/chipidea/Makefile                      |    3 +
> >  drivers/usb/chipidea/ci13xxx_imx.c                 |  189
> >  ++++++++++++++++++++ 3 files changed, 212 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> >  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
> > 

[...]

> > +
> > +	ci13xxx_imx_platdata.phy = data->phy;
> > +
> > +	if (!pdev->dev.dma_mask) {
> > +		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
> > +				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> > +		if (!pdev->dev.dma_mask) {
> > +			ret = -ENOMEM;
> > +			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
> > +			goto err;
> > +		}
> > +		*pdev->dev.dma_mask = DMA_BIT_MASK(32);
> > +		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
> > +	}
> 
> Do you need this? I assume not.

Ain't this the dma mask crap without which the usb stuff won't work?

> Sascha

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
