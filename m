From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 13/14] net: phy: adin: add ethtool get_stats support
Date: Mon, 12 Aug 2019 16:33:15 +0200
Message-ID: <20190812143315.GS14290@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-14-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812112350.15242-14-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +static int adin_read_mmd_stat_regs(struct phy_device *phydev,
> +				   struct adin_hw_stat *stat,
> +				   u32 *val)
> +{
> +	int ret;
> +
> +	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg1);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = (ret & 0xffff);
> +
> +	if (stat->reg2 == 0)
> +		return 0;
> +
> +	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg2);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val <<= 16;
> +	*val |= (ret & 0xffff);
> +
> +	return 0;
> +}

It still looks like you have not dealt with overflow from the LSB into
the MSB between the two reads.

	do {
		hi1 = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg2);
		if (hi1 < 0)
			return hi1;
		
		low = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg1);
		if (low < 0)
			return low;

		hi2 = phy_read_mmd(phydev, MDIO_MMD_VEND1, stat->reg2);
		if (hi2 < 0)
			return hi1;
	} while (hi1 != hi2)

	return low | (hi << 16);

	Andrew
