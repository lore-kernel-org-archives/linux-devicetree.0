From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 02/20] usb: ehci-orion: Add the optional PHY support
Date: Wed, 7 May 2014 11:40:06 +0200
Message-ID: <20140507114006.466347a0@free-electrons.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
	<1399335255-589-3-git-send-email-gregory.clement@free-electrons.com>
	<20140506133341.GE6503@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140506133341.GE6503-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Tue, 6 May 2014 15:33:41 +0200, Andrew Lunn wrote:

> > +	priv->phy = devm_phy_get(&pdev->dev, "usb");
> > +	if (!IS_ERR(priv->phy)) {
> > +		err = phy_init(priv->phy);
> > +		if (err)
> > +			goto err2;
> > +
> > +		err = phy_power_on(priv->phy);
> > +		if (err)
> > +			goto err3;
> > +	}
> 
> Hi Gregory
> 
> What about EPROBE_DEFERRED?

In v4 (to be submitted soon), I've changed this to:

	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
	if (IS_ERR(priv->phy)) {
		err = PTR_ERR(priv->phy);
		goto err_phy_get;
	} else {
		err = phy_init(priv->phy);
		if (err)
			goto err_phy_init;

		err = phy_power_on(priv->phy);
		if (err)
			goto err_phy_power_on;
	}

Thanks to devm_phy_optional_get(), the fact of not having a PHY in the
DT is not considered an error. So on any error from
devm_phy_optional_get() (including -EPROBE_DEFER), we simply bail out.
Does this looks good?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
