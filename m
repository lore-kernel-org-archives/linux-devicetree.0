From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [Patch v5 05/13] usb: otg: add basic mxs phy driver support
Date: Wed, 13 Jun 2012 23:56:15 +0200
Message-ID: <201206132356.16093.marex@denx.de>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <1339590863-10564-6-git-send-email-richard.zhao@freescale.com> <20120613213312.GD30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120613213312.GD30400-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Sascha Hauer,

> On Wed, Jun 13, 2012 at 08:34:15PM +0800, Richard Zhao wrote:
> > mxs phy is used in Freescale i.MX SoCs, for example
> > imx23, imx28, imx6Q. This patch adds the basic host
> > support.
> > 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
[...]

> > +	/* Remove CLKGATE and SFTRST */
> > +	writel_relaxed(BM_USBPHY_CTRL_CLKGATE | BM_USBPHY_CTRL_SFTRST,
> > +			base + HW_USBPHY_CTRL_CLR);
> > +	udelay(10);
> 
> Is stmp_reset_block() suitable for what you want to do here?

IIRC it is.

> > +	base = devm_request_and_ioremap(&pdev->dev, res);
> > +	if (!base)
> > +		return -EBUSY;
> > +
> > +	clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(&pdev->dev, "can't get the clock!");
> 
> Please add the return value to these kind of messages.
> 
> > +		return PTR_ERR(clk);
> > +	}
> > +
> > +	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
> > +	if (!mxs_phy) {
> > +		dev_err(&pdev->dev, "Failed to allocate USB PHY structure!\n");
> 
> This message is rather useless. It is really not expected for kzalloc
> to fail. If it fails here you really have problems elsewhere and this
> message won't help you debugging it.

It's not useless, but it'll hardly ever be displayed if you run out of memory so 
badly this kzalloc() will fail.

> Sascha

Best regards,
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
