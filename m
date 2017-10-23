From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] phy: add combo phy driver for HiSilicon STB SoCs
Date: Mon, 23 Oct 2017 09:55:06 +0800
Message-ID: <20171023015504.GG8700@dragon>
References: <1508042882-20922-1-git-send-email-shawnguo@kernel.org>
 <066fef03-7c21-fe7c-218a-fdec446500da@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <066fef03-7c21-fe7c-218a-fdec446500da-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Thanks for taking time to review the patch.

This combo phy support PCIe and USB3 on HiSilicon STB SoC.  We will
address all your comments and add USB3 support in the new version.

On Wed, Oct 18, 2017 at 06:13:31PM +0530, Kishon Vijay Abraham I wrote:
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index 3a52dcb09566..11754b293fb4 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
> >  obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
> >  obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
> >  obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
> > +
> 
> spurious blank space..

Left from rebasing the change to latest kernel.  Fixed.  Thanks.

> >  obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
> >  obj-$(CONFIG_ARCH_MESON)		+= amlogic/
> >  obj-$(CONFIG_LANTIQ)			+= lantiq/

<snip>

> > +static struct phy *histb_combphy_xlate(struct device *dev,
> > +				       struct of_phandle_args *args)
> > +{
> > +	struct histb_combphy_priv *priv = dev_get_drvdata(dev);
> > +
> > +	if (args->args_count < 1) {
> > +		dev_err(dev, "DT did not pass correct no of args\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	priv->mode = args->args[0];
> > +
> > +	if (priv->mode > COMBPHY_MODE_SATA) {
> 
> this should use generic bindings from include/dt-bindings/phy/phy.h.

Great.  Thanks for the info.  Will use it.

> > +		dev_err(dev, "DT did not pass correct phy mode\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	return priv->phy;
> > +}

<snip>

> > +	phy_provider = devm_of_phy_provider_register(dev, histb_combphy_xlate);
> > +	if (IS_ERR(phy_provider)) {
> > +		dev_err(dev, "failed to register phy provider\n");
> > +		return PTR_ERR(phy_provider);
> > +	}
> > +
> > +	return 0;
> 
> return PTR_ERR_OR_ZERO(phy_provider) instead?

Yes.  Thanks for the suggestion.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
