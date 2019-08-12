From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 10/14] net: phy: adin: implement PHY subsystem
 software reset
Date: Mon, 12 Aug 2019 16:19:54 +0200
Message-ID: <20190812141954.GP14290@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-11-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812112350.15242-11-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +static int adin_reset(struct phy_device *phydev)
> +{
> +	/* If there is a reset GPIO just exit */
> +	if (!IS_ERR_OR_NULL(phydev->mdio.reset_gpio))
> +		return 0;

I'm not so happy with this.

First off, there are two possible GPIO configurations. The GPIO can be
applied to all PHYs on the MDIO bus. That GPIO is used when the bus is
probed. There can also be a per PHY GPIO, which is what you are
looking at here.

The idea of putting the GPIO handling in the core is that PHYs don't
need to worry about it. How much of a difference does it make if the
PHY is both reset via GPIO and then again in software? How slow is the
software reset? Maybe just unconditionally do the reset, if it is not
too slow.

> +
> +	/* Reset PHY core regs & subsystem regs */
> +	return adin_subsytem_soft_reset(phydev);
> +}
> +
> +static int adin_probe(struct phy_device *phydev)
> +{
> +	return adin_reset(phydev);
> +}

Why did you decide to do this as part of probe, and not use the
.soft_reset member of phy_driver?

> +
>  static struct phy_driver adin_driver[] = {
>  	{
>  		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200),
>  		.name		= "ADIN1200",
>  		.config_init	= adin_config_init,
> +		.probe		= adin_probe,
>  		.config_aneg	= adin_config_aneg,
>  		.read_status	= adin_read_status,
>  		.ack_interrupt	= adin_phy_ack_intr,
> @@ -461,6 +503,7 @@ static struct phy_driver adin_driver[] = {
>  		PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300),
>  		.name		= "ADIN1300",
>  		.config_init	= adin_config_init,
> +		.probe		= adin_probe,
>  		.config_aneg	= adin_config_aneg,
>  		.read_status	= adin_read_status,
>  		.ack_interrupt	= adin_phy_ack_intr,

Thanks
	Andrew
