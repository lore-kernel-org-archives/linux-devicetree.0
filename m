From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 2/2] net: phy: adin: implement Energy Detect Powerdown
 mode via phy-tunable
Date: Sat, 14 Sep 2019 17:29:31 +0200
Message-ID: <20190914152931.GK27922@lunn.ch>
References: <20190912162812.402-1-alexandru.ardelean@analog.com>
 <20190912162812.402-3-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190912162812.402-3-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, mkubecek@suse.cz
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 07:28:12PM +0300, Alexandru Ardelean wrote:

> +static int adin_set_edpd(struct phy_device *phydev, u16 tx_interval)
> +{
> +	u16 val;
> +
> +	if (tx_interval == ETHTOOL_PHY_EDPD_DISABLE)
> +		return phy_clear_bits(phydev, ADIN1300_PHY_CTRL_STATUS2,
> +				(ADIN1300_NRG_PD_EN | ADIN1300_NRG_PD_TX_EN));
> +
> +	val = ADIN1300_NRG_PD_EN;
> +
> +	switch (tx_interval) {
> +	case 1000: /* 1 second */
> +		/* fallthrough */
> +	case ETHTOOL_PHY_EDPD_DFLT_TX_MSECS:
> +		val |= ADIN1300_NRG_PD_TX_EN;
> +		/* fallthrough */
> +	case ETHTOOL_PHY_EDPD_NO_TX:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return phy_modify(phydev, ADIN1300_PHY_CTRL_STATUS2,
> +			  (ADIN1300_NRG_PD_EN | ADIN1300_NRG_PD_TX_EN),
> +			  val);
> +}
> +

>  
> +	rc = adin_set_edpd(phydev, 1);
> +	if (rc < 0)
> +		return rc;

Hi Alexandru

Shouldn't this be adin_set_edpd(phydev, 1000);

	Andrew
