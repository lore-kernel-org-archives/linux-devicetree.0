From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v4 02/17] usb: phy-mxs: Add platform judgement code
Date: Tue, 3 Dec 2013 14:09:15 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A64980414134F@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
 <1386056231-17258-3-git-send-email-peter.chen@freescale.com>
 <20131203102416.GB27635@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131203102416.GB27635-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> > +
> > +static const struct mxs_phy_data imx23_phy_data = {
> > +	.flags = MXS_PHY_ABNORAML_IN_SUSPEND | MXS_PHY_SENDING_SOF_TOO_FAST,
> > +};
> 
> ABNORAML? -> ABNORMAL
> 

My careless, will change. Thanks.

Peter 

> > +
> > +static const struct mxs_phy_data imx6q_phy_data = {
> > +	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
> > +		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> > +};
> > +
> > +static const struct mxs_phy_data imx6sl_phy_data = {
> > +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> > +};
> > +
> > +static const struct of_device_id mxs_phy_dt_ids[] = {
> > +	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> > +	{ .compatible = "fsl,imx6q-usbphy", .data = &imx6q_phy_data, },
> > +	{ .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> > +
> >  struct mxs_phy {
> >  	struct usb_phy phy;
> >  	struct clk *clk;
> > +	const struct mxs_phy_data *data;
> >  };
> >
> > -#define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> > -
> >  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >  {
> >  	int ret;
> > @@ -131,6 +174,8 @@ static int mxs_phy_probe(struct platform_device
> *pdev)
> >  	struct clk *clk;
> >  	struct mxs_phy *mxs_phy;
> >  	int ret;
> > +	const struct of_device_id *of_id =
> > +			of_match_device(mxs_phy_dt_ids, &pdev->dev);
> >
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	base = devm_ioremap_resource(&pdev->dev, res);
> > @@ -163,6 +208,7 @@ static int mxs_phy_probe(struct platform_device
> *pdev)
> >  	ATOMIC_INIT_NOTIFIER_HEAD(&mxs_phy->phy.notifier);
> >
> >  	mxs_phy->clk = clk;
> > +	mxs_phy->data = of_id->data;
> >
> >  	platform_set_drvdata(pdev, mxs_phy);
> >
> > @@ -182,12 +228,6 @@ static int mxs_phy_remove(struct platform_device
> *pdev)
> >  	return 0;
> >  }
> >
> > -static const struct of_device_id mxs_phy_dt_ids[] = {
> > -	{ .compatible = "fsl,imx23-usbphy", },
> > -	{ /* sentinel */ }
> > -};
> > -MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> > -
> >  static struct platform_driver mxs_phy_driver = {
> >  	.probe = mxs_phy_probe,
> >  	.remove = mxs_phy_remove,
> > --
> > 1.7.8
> >
> >
> >
> 
> --
> Pengutronix e.K.                           |
> |
> Industrial Linux Solutions                 | http://www.pengutronix.de/
> |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555
> |


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
