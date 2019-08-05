From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 15/16] net: phy: adin: add ethtool get_stats support
Date: Mon, 5 Aug 2019 17:28:32 +0200
Message-ID: <20190805152832.GT24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-16-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-16-alexandru.ardelean@analog.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +struct adin_hw_stat {
> +	const char *string;

> +static void adin_get_strings(struct phy_device *phydev, u8 *data)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++) {
> +		memcpy(data + i * ETH_GSTRING_LEN,
> +		       adin_hw_stats[i].string, ETH_GSTRING_LEN);

You define string as a char *. So it will be only as long as it should
be. However memcpy always copies ETH_GSTRING_LEN bytes, doing off the
end of the string and into whatever follows.


> +	}
> +}
> +
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

Does the hardware have a snapshot feature? Is there a danger that
between the two reads stat->reg1 rolls over and you end up with too
big a value?

    Andrew
