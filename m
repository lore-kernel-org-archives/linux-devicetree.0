From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv3 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 15 Jan 2018 23:57:18 +0100
Message-ID: <20180115225718.GA4927@lunn.ch>
References: <20180115193722.10241-1-sebastian.reichel@collabora.co.uk>
 <20180115193722.10241-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180115193722.10241-2-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>  int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  {
>  	struct device_node *dn = dp->dn;
> @@ -305,6 +354,10 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  			ds->ops->adjust_link(ds, port, phydev);
>  
>  		put_device(&phydev->mdio.dev);
> +	} else {
> +		err = dsa_port_setup_phy_of(dp, true);
> +		if (err)
> +			return err;

Hi Sebastian

First off, i tend to agree with Florian. I'm not sure how reliable
this is. There is normally a state machine moving the PHY between
different states. But in order to do that, i think you need a netdev.
Have you tried multiple down/up of the other MAC/PHY? Does it always
work?

But, at the moment, we don't have much better.

What i don't like is having this code inside
dsa_port_fixed_link_register_of(). This has nothing to do with a fixed
link. Please export functions from port.c and call them directly from
dsa_port_setup() and dsa_port_teardown().

	 Andrew
