From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v4 3/3] net: ethernet: add ag71xx driver
Date: Mon, 20 May 2019 09:05:26 +0200
Message-ID: <5e836144-44e5-d99c-716c-8af42486a6b0@pengutronix.de>
References: <20190519080304.5811-1-o.rempel@pengutronix.de>
 <20190519080304.5811-4-o.rempel@pengutronix.de>
 <20190520003302.GA1695@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190520003302.GA1695@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>, info@freifunk-bad-gandersheim.net
List-Id: devicetree@vger.kernel.org



On 20.05.19 02:33, Andrew Lunn wrote:
> Hi Oleksij
> 
>> +static int ag71xx_mdio_mii_read(struct mii_bus *bus, int addr, int reg)
>> +{
>> +	struct ag71xx *ag = bus->priv;
>> +	struct net_device *ndev = ag->ndev;
>> +	int err;
>> +	int ret;
>> +
>> +	err = ag71xx_mdio_wait_busy(ag);
>> +	if (err)
>> +		return err;
>> +
>> +	ag71xx_wr(ag, AG71XX_REG_MII_CMD, MII_CMD_WRITE);
> 
> It looks like you have not removed this.

done.

> 
>> +	ag71xx_wr(ag, AG71XX_REG_MII_ADDR,
>> +			((addr & 0xff) << MII_ADDR_SHIFT) | (reg & 0xff));
>> +	ag71xx_wr(ag, AG71XX_REG_MII_CMD, MII_CMD_READ);
>> +
>> +	err = ag71xx_mdio_wait_busy(ag);
>> +	if (err)
>> +		return err;
>> +
>> +	ret = ag71xx_rr(ag, AG71XX_REG_MII_STATUS);
>> +	/*
>> +	 * ar9331 doc: bits 31:16 are reserved and must be must be written
>> +	 * with zero.
>> +	 */
>> +	ret &= 0xffff;
>> +	ag71xx_wr(ag, AG71XX_REG_MII_CMD, MII_CMD_WRITE);
> 
> Or this.

this one is needed. MII_CMD_WRITE is a wrong name, it is actually disabling MII_CMD_READ mode.

> 
>> +
>> +	netif_dbg(ag, link, ndev, "mii_read: addr=%04x, reg=%04x, value=%04x\n",
>> +		  addr, reg, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ag71xx_mdio_mii_write(struct mii_bus *bus, int addr, int reg,
>> +				 u16 val)
>> +{
>> +	struct ag71xx *ag = bus->priv;
>> +	struct net_device *ndev = ag->ndev;
>> +
>> +	netif_dbg(ag, link, ndev, "mii_write: addr=%04x, reg=%04x, value=%04x\n",
>> +		  addr, reg, val);
>> +
>> +	ag71xx_wr(ag, AG71XX_REG_MII_ADDR,
>> +			((addr & 0xff) << MII_ADDR_SHIFT) | (reg & 0xff));
> 
> addr have the vale 0-31. So a mask of 0xff is a couple of bits too
> big.

done

> 
>> +	ag71xx_wr(ag, AG71XX_REG_MII_CTRL, val);
>> +
>> +	return ag71xx_mdio_wait_busy(ag);
>> +}
> 
>> +static void ag71xx_link_adjust(struct ag71xx *ag, bool update)
>> +{
>> +	struct net_device *ndev = ag->ndev;
>> +	struct phy_device *phydev = ndev->phydev;
>> +	u32 cfg2;
>> +	u32 ifctl;
>> +	u32 fifo5;
>> +
>> +	if (!phydev->link && update) {
>> +		ag71xx_hw_stop(ag);
>> +		netif_carrier_off(ag->ndev);
> 
> phylib will take care of the carrier for you.

done

>         Andrew

thx!

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
