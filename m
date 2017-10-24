From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] phy: add combo phy driver for HiSilicon STB SoCs
Date: Tue, 24 Oct 2017 16:58:26 +0800
Message-ID: <20171024085825.GE6403@dragon>
References: <1508757968-22729-1-git-send-email-shawnguo@kernel.org>
 <1508757968-22729-3-git-send-email-shawnguo@kernel.org>
 <0ccecbc3-68fe-e134-36e0-6075f723d384@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0ccecbc3-68fe-e134-36e0-6075f723d384-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 07:42:32PM +0800, Jiancheng Xue wrote:
> > +static int histb_pcie_phy_init(struct histb_combphy_priv *priv)
> > +{
> > +	struct regmap *peri = priv->peri;
> > +	int ret;
> > +
> > +	/* set to pcie mode */
> > +	regmap_update_bits(peri, PERI_CTRL, COMBPHY1_MODE_MASK,
> > +			    COMBPHY_MODE_PCIE << COMBPHY_MODE_SHIFT);
> > +
> > +	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
> > +			    COMBPHY1_BYPASS_CODEC_MASK,
> > +			    ~COMBPHY1_BYPASS_CODEC_VAL);
> > +
> > +	ret = clk_prepare_enable(priv->ref);
> > +	if (ret) {
> > +		dev_err(&priv->phy->dev, "clk_prepare_enable fail!\n");
> > +		return ret;
> > +	}
> > +
> > +	reset_control_deassert(priv->por);
> > +
> > +	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
> > +			    COMBPHY1_CLKREF_OUT_OEN_MASK,
> > +			    COMBPHY1_CLKREF_OUT_OEN_VAL);
> > +
> > +	/* need to wait for EP clk stable */
> > +	mdelay(5);
> > +
> > +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1, 0x8);
> > +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0xc, 0x9);
> > +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1a, 0x4);
> > +
> > +	return 0;
> > +}
> > +
> > +static int histb_pcie_phy_exit(struct histb_combphy_priv *priv)
> > +{
> > +	regmap_update_bits(priv->peri, PERI_COMBPHY1_CFG,
> > +				COMBPHY1_CLKREF_OUT_OEN_MASK,
> > +				~COMBPHY1_CLKREF_OUT_OEN_VAL);
> > +	reset_control_deassert(priv->por);
> > +	clk_disable_unprepare(priv->ref);
> > +
> > +	return 0;
> > +}
> > +
> > +static int histb_usb_phy_init(struct histb_combphy_priv *priv)
> > +{
> > +	int ret;
> > +
> I think the work mode should be set to usb3 first as histb_pcie_phy_init does.
> The current one may be not usb3.

Thanks for the reminding.  We will address that in the next version.

Shawn

> > +	ret = clk_prepare_enable(priv->ref);
> > +	if (ret) {
> > +		dev_err(&priv->phy->dev, "clk_prepare_enable fail!\n");
> > +		return ret;
> > +	}
> > +	reset_control_deassert(priv->por);
> > +	mdelay(1);
> > +
> > +	return 0;
> > +}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
