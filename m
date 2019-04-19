From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 3/3] net: ethernet: add ag71xx driver
Date: Fri, 19 Apr 2019 14:35:19 -0700 (PDT)
Message-ID: <20190419.143519.94034508850689697.davem@davemloft.net>
References: <20190418052620.20835-1-o.rempel@pengutronix.de>
        <20190418052620.20835-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418052620.20835-4-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: o.rempel@pengutronix.de
Cc: paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, jcliburn@gmail.com, chris.snook@gmail.com, mark.rutland@arm.com, kernel@pengutronix.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, nbd@nbd.name, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Thu, 18 Apr 2019 07:26:20 +0200

> +static int ag71xx_remove(struct platform_device *pdev)
> +{
> +	struct net_device *ndev = platform_get_drvdata(pdev);
> +	struct ag71xx *ag;
> +
> +	if (!ndev)
> +		return 0;
> +
> +	ag = netdev_priv(ndev);
> +	ag71xx_phy_disconnect(ag);
> +	ag71xx_mdio_remove(ag);
> +	unregister_netdev(ndev);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}

You should unregister the netdev before you disconnect the PHY and remove
the MDIO.

Also you need to call free_netdev() afterwards otherwise you will leak it.
