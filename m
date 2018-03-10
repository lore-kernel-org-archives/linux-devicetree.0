Return-Path: <SRS0=AP7R=GA=lunn.ch=andrew@kernel.org>
Date: Sat, 10 Mar 2018 17:17:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 net-next 1/3] net: macb: Reorganize macb_mii bringup
Message-ID: <20180310161718.GC29174@lunn.ch>
References: <20180308173247.GA22340@lunn.ch>
 <20180309221233.71202-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180309221233.71202-1-brad.mouring@ni.com>
To: Brad Mouring <brad.mouring@ni.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 09, 2018 at 04:12:31PM -0600, Brad Mouring wrote:
> The macb mii setup (mii_probe() and mii_init()) previously was
> somewhat interspersed, likely a result of organic growth and hacking.

Hi Brad

For netdev it is normal to include a cover note for patch series,
which explains the big picture of the series. The cover note is then
used as the merge commit message.

> 
> This change moves mii bus registration into mii_init and probing the
> bus for devices into mii_probe.
> 
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 89 ++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e84afcf1ecb5..7b69a291ab7a 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -470,10 +470,48 @@ static void macb_handle_link_change(struct net_device *dev)
>  static int macb_mii_probe(struct net_device *dev)
>  {
>  	struct macb *bp = netdev_priv(dev);
> -	struct macb_platform_data *pdata;
> +	struct macb_platform_data *pdata = dev_get_platdata(&bp->pdev->dev);
>  	struct phy_device *phydev;
> +	struct device_node *np = bp->pdev->dev.of_node;
>  	int phy_irq;
> -	int ret;
> +	int ret, i;

These should be in 'Reverse Christmas Tree' order. i.e. longest
first. That makes pdata tricky, so do the assignment in the body of
the function.

> +
> +	if (np) {
> +		if (of_phy_is_fixed_link(np)) {
> +			if (of_phy_register_fixed_link(np) < 0) {
> +				dev_err(&bp->pdev->dev,
> +					"broken fixed-link specification\n");
> +				return -ENODEV;
> +			}
> +			bp->phy_node = of_node_get(np);
> +		} else {
> +			/* fallback to standard phy registration if no phy were
> +			 * found during dt phy registration
> +			 */
> +			if (!phy_find_first(bp->mii_bus)) {
> +				for (i = 0; i < PHY_MAX_ADDR; i++) {
> +					struct phy_device *phydev;
> +
> +					phydev = mdiobus_scan(bp->mii_bus, i);
> +					if (IS_ERR(phydev) &&
> +					    PTR_ERR(phydev) != -ENODEV) {
> +						ret = PTR_ERR(phydev);
> +						break;
> +					}
> +				}
> +
> +				if (ret)
> +					return -ENODEV;
> +			}
> +		}
> +	} else {
> +		for (i = 0; i < PHY_MAX_ADDR; i++)
> +			bp->mii_bus->irq[i] = PHY_POLL;
> +
> +		if (pdata)
> +			bp->mii_bus->phy_mask = pdata->phy_mask;

I would say these two are to do with the mdio bus setup. Setting irq
to POLL is not required, the core will do that. So you could add one
patch removing that.

      Andrew
