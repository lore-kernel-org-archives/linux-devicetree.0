Return-Path: <SRS0=xnB1=GC=lunn.ch=andrew@kernel.org>
Date: Mon, 12 Mar 2018 18:59:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 net-next 3/4] net: macb: Add phy-handle DT support
Message-ID: <20180312175956.GS27783@lunn.ch>
References: <20180310161718.GC29174@lunn.ch>
 <20180312171001.129209-1-brad.mouring@ni.com>
 <20180312171001.129209-4-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180312171001.129209-4-brad.mouring@ni.com>
To: Brad Mouring <brad.mouring@ni.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

> @@ -488,6 +488,9 @@ static int macb_mii_probe(struct net_device *dev)
>  			}
>  			bp->phy_node = of_node_get(np);
>  		} else {
> +			/* attempt to find a phy-handle */
> +			bp->phy_node = of_parse_phandle(np, "phy-handle", 0);
> +

Hi Brad

It seems like you should check the return value here, any only
continue with the fallback if there was not a phy-handle.

>  			/* fallback to standard phy registration if no phy were
>  			 * found during dt phy registration
>  			 */

	 Andrew
