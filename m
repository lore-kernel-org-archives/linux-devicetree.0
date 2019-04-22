From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] net: ethernet: add ag71xx driver
Date: Mon, 22 Apr 2019 07:13:49 +0200
Message-ID: <20190422051349.67awwpyat5sjbd7j@pengutronix.de>
References: <20190418052620.20835-1-o.rempel@pengutronix.de>
 <20190418052620.20835-4-o.rempel@pengutronix.de>
 <20190419.143519.94034508850689697.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190419.143519.94034508850689697.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, jcliburn@gmail.com, chris.snook@gmail.com, mark.rutland@arm.com, kernel@pengutronix.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, nbd@nbd.name, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Apr 19, 2019 at 02:35:19PM -0700, David Miller wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Date: Thu, 18 Apr 2019 07:26:20 +0200
> 
> > +static int ag71xx_remove(struct platform_device *pdev)
> > +{
> > +	struct net_device *ndev = platform_get_drvdata(pdev);
> > +	struct ag71xx *ag;
> > +
> > +	if (!ndev)
> > +		return 0;
> > +
> > +	ag = netdev_priv(ndev);
> > +	ag71xx_phy_disconnect(ag);
> > +	ag71xx_mdio_remove(ag);
> > +	unregister_netdev(ndev);
> > +	platform_set_drvdata(pdev, NULL);
> > +
> > +	return 0;
> > +}
> 
> You should unregister the netdev before you disconnect the PHY and remove
> the MDIO.

ok.

> Also you need to call free_netdev() afterwards otherwise you will leak it.

ndev is allocated with devm_alloc_etherdev(). Are you sure free_netdev()
should be used here?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
