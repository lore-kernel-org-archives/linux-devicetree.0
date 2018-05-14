From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] net: phy: micrel: workaround for errata #2 for KSZ9031
Date: Mon, 14 May 2018 11:05:03 +0200
Message-ID: <20180514090503.kqkf2222fbqgdequ@pengutronix.de>
References: <20180514082218.29158-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514082218.29158-1-m.felsch@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, Markus Niebel <Markus.Niebel@tqs.de>, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

> diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
> index f41b224a9cdb..3e4243e4f7a7 100644
> --- a/drivers/net/phy/micrel.c
> +++ b/drivers/net/phy/micrel.c
> @@ -528,6 +528,8 @@ static int ksz9031_enable_edpd(struct phy_device *phydev)
>  
>  static int ksz9031_config_init(struct phy_device *phydev)
>  {
> +	int rc;
> +	u16 val;

These could be declared in more local scope.

>  	const struct device *dev = &phydev->mdio.dev;
>  	const struct device_node *of_node = dev->of_node;
>  	static const char *clk_skews[2] = {"rxc-skew-ps", "txc-skew-ps"};
> @@ -573,6 +575,22 @@ static int ksz9031_config_init(struct phy_device *phydev)
>  		ksz9031_of_load_skew_values(phydev, of_node,
>  				MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
>  				tx_data_skews, 4);
> +
> +		/* force master mode -> errata #2
> +		 * attention: Master <-> Master will not work
> +		 */
> +		if (of_property_read_bool(of_node, "force-master")) {
> +			rc = phy_read(phydev, MII_CTRL1000);
> +			if (rc >= 0) {
> +				val = (u16)rc;
> +				/* enable master mode, config &
> +				 * prefer master
> +				 */
> +				val |= (CTL1000_ENABLE_MASTER |
> +					CTL1000_AS_MASTER);
> +				phy_write(phydev, MII_CTRL1000, val);

There is no need for two variables, just use a single int variable that
on all Linux archs can hold the whole domain of u16 should be fine.

> +			}
> +		}

Maybe issue a warning if reading MII_CTRL1000 failed?

>  	}
>  
>  	return ksz9031_center_flp_timing(phydev);

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
