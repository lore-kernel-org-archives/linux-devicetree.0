From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 7/8] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 9 Nov 2017 23:23:52 +0100
Message-ID: <20171109222352.GA25275@lunn.ch>
References: <20171109192915.11912-1-david.daney@cavium.com>
 <20171109192915.11912-8-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171109192915.11912-8-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +	priv->phy_np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
> +	priv->phy_mode = of_get_phy_mode(pdev->dev.of_node);
> +	/* If phy-mode absent, default to SGMII. */
> +	if (priv->phy_mode < 0)
> +		priv->phy_mode = PHY_INTERFACE_MODE_SGMII;
> +
> +	if (priv->phy_mode == PHY_INTERFACE_MODE_1000BASEX)
> +		priv->mode_1000basex = true;
> +
> +	if (of_phy_is_fixed_link(pdev->dev.of_node))
> +		priv->bgx_as_phy = true;
> +

...

> +	priv->mode = bgx_port_get_mode(priv->node, priv->bgx, priv->index);
> +

It might be a good idea to verify priv->phy_mode and priv->mode are
compatible.

> +	switch (priv->mode) {
> +	case PORT_MODE_SGMII:
> +	case PORT_MODE_RGMII:
> +		priv->get_link = bgx_port_get_sgmii_link;
> +		priv->set_link = bgx_port_set_xgmii_link;
> +		break;
> +	case PORT_MODE_XAUI:
> +	case PORT_MODE_RXAUI:
> +	case PORT_MODE_XLAUI:
> +	case PORT_MODE_XFI:
> +	case PORT_MODE_10G_KR:
> +	case PORT_MODE_40G_KR4:
> +		priv->get_link = bgx_port_get_xaui_link;
> +		priv->set_link = bgx_port_set_xaui_link;
> +		break;


  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
