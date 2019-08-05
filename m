From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 01/16] net: phy: adin: add support for Analog Devices PHYs
Date: Mon, 5 Aug 2019 17:17:36 +0200
Message-ID: <20190805151736.GQ24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-2-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-2-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +static struct phy_driver adin_driver[] = {
> +	{
> +		.phy_id		= PHY_ID_ADIN1200,
> +		.name		= "ADIN1200",
> +		.phy_id_mask	= 0xfffffff0,
> +		.features	= PHY_BASIC_FEATURES,

Do you need this? If the device implements the registers correctly,
phylib can determine this from the registers.

> +		.config_init	= adin_config_init,
> +		.config_aneg	= genphy_config_aneg,
> +		.read_status	= genphy_read_status,
> +	},
> +	{
> +		.phy_id		= PHY_ID_ADIN1300,
> +		.name		= "ADIN1300",
> +		.phy_id_mask	= 0xfffffff0,
> +		.features	= PHY_GBIT_FEATURES,

same here.

> +		.config_init	= adin_config_init,
> +		.config_aneg	= genphy_config_aneg,
> +		.read_status	= genphy_read_status,
> +	},
> +};
> +
> +module_phy_driver(adin_driver);
> +
> +static struct mdio_device_id __maybe_unused adin_tbl[] = {
> +	{ PHY_ID_ADIN1200, 0xfffffff0 },
> +	{ PHY_ID_ADIN1300, 0xfffffff0 },

PHY_ID_MATCH_VENDOR().

	Andrew
