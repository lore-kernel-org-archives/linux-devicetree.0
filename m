From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] phy: add combo phy driver for HiSilicon STB SoCs
Date: Thu, 26 Oct 2017 22:31:14 +0800
Message-ID: <20171026143112.GA13744@dragon>
References: <1508921049-16208-1-git-send-email-shawnguo@kernel.org>
 <1508921049-16208-3-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508921049-16208-3-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 25, 2017 at 04:44:09PM +0800, Shawn Guo wrote:
> +static int histb_combphy_init(struct phy *phy)
> +{
> +	struct histb_combphy_priv *priv = phy_get_drvdata(phy);
> +	u32 val;
> +	int ret;
> +
> +	/* PHY0 doesn't support mode setting */
> +	if (priv->phy_id != 0) {

With a bit more think on this, I admit it might not scale for future
SoCs which could reasonably support mode select for combphy0.  So
instead of hard checking device id, I will repost with a new property
added for this. 

Shawn

> +		ret = histb_combphy_set_mode(priv);
> +		if (ret)
> +			return ret;
> +	}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
