From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 14/16] net: phy: adin: make sure down-speed auto-neg is
 enabled
Date: Tue, 6 Aug 2019 07:52:48 +0200
Message-ID: <baac3842-bd9c-75af-83e3-9e89def1c429@gmail.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-15-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805165453.3989-15-alexandru.ardelean@analog.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On 05.08.2019 18:54, Alexandru Ardelean wrote:
> Down-speed auto-negotiation may not always be enabled, in which case the
> PHY won't down-shift to 100 or 10 during auto-negotiation.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/net/phy/adin.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> index 86848444bd98..a1f3456a8504 100644
> --- a/drivers/net/phy/adin.c
> +++ b/drivers/net/phy/adin.c
> @@ -32,6 +32,13 @@
>  #define   ADIN1300_NRG_PD_TX_EN			BIT(2)
>  #define   ADIN1300_NRG_PD_STATUS		BIT(1)
>  
> +#define ADIN1300_PHY_CTRL2			0x0016
> +#define   ADIN1300_DOWNSPEED_AN_100_EN		BIT(11)
> +#define   ADIN1300_DOWNSPEED_AN_10_EN		BIT(10)
> +#define   ADIN1300_GROUP_MDIO_EN		BIT(6)
> +#define   ADIN1300_DOWNSPEEDS_EN	\
> +	(ADIN1300_DOWNSPEED_AN_100_EN | ADIN1300_DOWNSPEED_AN_10_EN)
> +
>  #define ADIN1300_INT_MASK_REG			0x0018
>  #define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
>  #define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
> @@ -425,6 +432,22 @@ static int adin_config_mdix(struct phy_device *phydev)
>  	return phy_write(phydev, ADIN1300_PHY_CTRL1, reg);
>  }
>  
> +static int adin_config_downspeeds(struct phy_device *phydev)
> +{
> +	int reg;
> +
> +	reg = phy_read(phydev, ADIN1300_PHY_CTRL2);
> +	if (reg < 0)
> +		return reg;
> +
> +	if ((reg & ADIN1300_DOWNSPEEDS_EN) == ADIN1300_DOWNSPEEDS_EN)
> +		return 0;
> +
> +	reg |= ADIN1300_DOWNSPEEDS_EN;
> +
> +	return phy_write(phydev, ADIN1300_PHY_CTRL2, reg);

Using phy_set_bits() would be easier.

> +}
> +
>  static int adin_config_aneg(struct phy_device *phydev)
>  {
>  	int ret;
> @@ -433,6 +456,10 @@ static int adin_config_aneg(struct phy_device *phydev)
>  	if (ret)
>  		return ret;
>  
> +	ret = adin_config_downspeeds(phydev);
> +	if (ret < 0)
> +		return ret;
> +
>  	return genphy_config_aneg(phydev);
>  }
>  
> 
