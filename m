From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/7] net: phy: mscc: add support for VSC8584 PHY
Date: Fri, 14 Sep 2018 19:27:54 +0200
Message-ID: <20180914172754.GC3811@lunn.ch>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org


>  struct vsc8531_private {
>  	int rate_magic;
>  	u16 supp_led_modes;
> @@ -181,6 +354,7 @@ struct vsc8531_private {
>  	struct vsc85xx_hw_stat *hw_stats;
>  	u64 *stats;
>  	int nstats;
> +	bool pkg_init;

> +/* bus->mdio_lock should be locked when using this function */
> +static int vsc8584_cmd(struct mii_bus *bus, int phy, u16 val)
> +{
> +	unsigned long deadline;
> +	u16 reg_val;
> +
> +	__mdiobus_write(bus, phy, MSCC_EXT_PAGE_ACCESS,
> +			MSCC_PHY_PAGE_EXTENDED_GPIO);
> +
> +	__mdiobus_write(bus, phy, MSCC_PHY_PROC_CMD, PROC_CMD_NCOMPLETED | val);

Hi Quentin

All the __mdiobus_write() look a bit ugly. Maybe add bus and base_addr
to the vsc8531_private structure. Then add helpers
phy_write_base_phy(priv, reg, val) and phy_read_base_phy(priv, reg).

You could also add in:

        if (unlikely(!mutex_is_locked(&priv->bus->mdio_lock))) {
                dev_err(bus->dev, "MDIO bus lock not held!\n");
                dump_stack();
        }

Having such code in the mv88e6xxx driver has found a few bugs for me.

       Andrew
