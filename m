From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 1/4] phylib: Add device reset delay support
Date: Tue, 5 Dec 2017 18:28:52 +0100
Message-ID: <20171205172852.GM12805@lunn.ch>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-2-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205132600.13796-2-dev@g0hl1n.net>
Sender: netdev-owner@vger.kernel.org
To: Richard Leitner <dev@g0hl1n.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, f.fainelli@gmail.com, frowand.list@gmail.com, davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

Hi Richard

> +++ b/drivers/of/of_mdio.c
> @@ -77,6 +77,14 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
>  	if (of_property_read_bool(child, "broken-turn-around"))
>  		mdio->phy_ignore_ta_mask |= 1 << addr;
>  
> +	if (of_property_read_u32(child, "reset-delay-us",
> +				 &phy->mdio.reset_delay))
> +		phy->mdio.reset_delay = 0;
> +
> +	if (of_property_read_u32(child, "reset-post-delay-us",
> +				 &phy->mdio.reset_post_delay))
> +		phy->mdio.reset_post_delay = 0;

of_property_read_u32() should not change the variable you pass to it,
if it does not find the property. So you can change this to:

	phy->mdio.reset_delay = 0;
	phy->mdio.reset_post_delay = 0;

	of_property_read_u32(child, "reset-delay-us",
			     &phy->mdio.reset_delay);

	of_property_read_u32(child, "reset-post-delay-us",
			     &phy->mdio.reset_post_delay);


     Andrew
