From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 7/8] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 9 Nov 2017 23:29:19 +0100
Message-ID: <20171109222919.GB25275@lunn.ch>
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

> +	if (link_changed != 0) {
> +		struct port_status status;
> +
> +		if (link_changed > 0) {
> +			netdev_info(netdev, "Link is up - %d/%s\n",
> +				    priv->phydev->speed,
> +				    priv->phydev->duplex == DUPLEX_FULL ?
> +				    "Full" : "Half");
> +		} else {
> +			netdev_info(netdev, "Link is down\n");
> +		}

phy_print_status()

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
