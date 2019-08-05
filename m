From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 03/16] net: phy: adin: add support for interrupts
Date: Mon, 5 Aug 2019 16:21:23 +0200
Message-ID: <20190805142123.GJ24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-4-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-4-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:40PM +0300, Alexandru Ardelean wrote:
> This change adds support for enabling PHY interrupts that can be used by
> the PHY framework to get signal for link/speed/auto-negotiation changes.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/net/phy/adin.c | 44 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> index c100a0dd95cd..b75c723bda79 100644
> --- a/drivers/net/phy/adin.c
> +++ b/drivers/net/phy/adin.c
> @@ -14,6 +14,22 @@
>  #define PHY_ID_ADIN1200				0x0283bc20
>  #define PHY_ID_ADIN1300				0x0283bc30
>  
> +#define ADIN1300_INT_MASK_REG			0x0018
> +#define   ADIN1300_INT_MDIO_SYNC_EN		BIT(9)
> +#define   ADIN1300_INT_ANEG_STAT_CHNG_EN	BIT(8)
> +#define   ADIN1300_INT_ANEG_PAGE_RX_EN		BIT(6)
> +#define   ADIN1300_INT_IDLE_ERR_CNT_EN		BIT(5)
> +#define   ADIN1300_INT_MAC_FIFO_OU_EN		BIT(4)
> +#define   ADIN1300_INT_RX_STAT_CHNG_EN		BIT(3)
> +#define   ADIN1300_INT_LINK_STAT_CHNG_EN	BIT(2)
> +#define   ADIN1300_INT_SPEED_CHNG_EN		BIT(1)
> +#define   ADIN1300_INT_HW_IRQ_EN		BIT(0)
> +#define ADIN1300_INT_MASK_EN	\
> +	(ADIN1300_INT_ANEG_STAT_CHNG_EN | ADIN1300_INT_ANEG_PAGE_RX_EN | \
> +	 ADIN1300_INT_LINK_STAT_CHNG_EN | ADIN1300_INT_SPEED_CHNG_EN | \
> +	 ADIN1300_INT_HW_IRQ_EN)
> +#define ADIN1300_INT_STATUS_REG			0x0019
> +
>  static int adin_config_init(struct phy_device *phydev)
>  {
>  	int rc;
> @@ -25,15 +41,40 @@ static int adin_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int adin_phy_ack_intr(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* Clear pending interrupts.  */
> +	ret = phy_read(phydev, ADIN1300_INT_STATUS_REG);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Please go through the whole driver and throw out all the needless

	if (ret < 0)
		return ret;

	return 0;

Thanks
	Andrew
