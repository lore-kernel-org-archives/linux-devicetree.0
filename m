From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Fri, 20 Sep 2019 14:42:15 +0100
Message-ID: <20190920134215.GM25745@shell.armlinux.org.uk>
References: <20190917124101.GA1200564@arch-dsk-01>
 <20190917125434.GH20778@lunn.ch>
 <20190917133253.GA1210141@arch-dsk-01>
 <20190917133942.GR25745@shell.armlinux.org.uk>
 <20190917151707.GV25745@shell.armlinux.org.uk>
 <20190917153027.GW25745@shell.armlinux.org.uk>
 <20190917163427.GA1475935@arch-dsk-01>
 <20190917170419.GX25745@shell.armlinux.org.uk>
 <20190917171913.GY25745@shell.armlinux.org.uk>
 <20190917214201.GB25745@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917214201.GB25745@shell.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: tinywrkb <tinywrkb@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 10:42:01PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Sep 17, 2019 at 06:19:13PM +0100, Russell King - ARM Linux admin wrote:
> > whether you can get the link to come up at all.  You might need to see
> > whether wiggling the RJ45 helps (I've had that sort of thing with some
> > cables.)
> > 
> > You might also need "ethtool -s eth0 advertise ffcf" after trying that
> > if it doesn't work to take the gigabit speeds out of the advertisement.
> > 
> > Thanks.
> > 
> >  drivers/net/phy/at803x.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
> > index b3893347804d..85cf4a4a5e81 100644
> > --- a/drivers/net/phy/at803x.c
> > +++ b/drivers/net/phy/at803x.c
> > @@ -296,6 +296,11 @@ static int at803x_config_init(struct phy_device *phydev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	/* Disable smartspeed */
> > +	ret = phy_modify(phydev, 0x14, BIT(5), 0);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	/* The RX and TX delay default is:
> >  	 *   after HW reset: RX delay enabled and TX delay disabled
> >  	 *   after SW reset: RX delay enabled, while TX delay retains the
> 
> Hi,
> 
> Could you try this patch instead - it seems that the PHY needs to be
> soft-reset for the write to take effect, and _even_ for the clearance
> of the bit to become visible in the register.
> 
> I'm not expecting this on its own to solve anything, but it should at
> least mean that the at803x doesn't modify the advertisement registers
> itself.  It may mean that the link doesn't even come up without forcing
> the advertisement via the ethtool command I mentioned before.
> 
> Thanks.
> 
>  drivers/net/phy/at803x.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
> index b3893347804d..69a58c0e6b42 100644
> --- a/drivers/net/phy/at803x.c
> +++ b/drivers/net/phy/at803x.c
> @@ -296,6 +296,16 @@ static int at803x_config_init(struct phy_device *phydev)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Disable smartspeed */
> +	ret = phy_modify(phydev, 0x14, BIT(5), 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Must soft-reset the PHY for smartspeed disable to take effect */
> +	ret = genphy_soft_reset(phydev);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* The RX and TX delay default is:
>  	 *   after HW reset: RX delay enabled and TX delay disabled
>  	 *   after SW reset: RX delay enabled, while TX delay retains the

Bad news I'm afraid.  It looks like the AR8035 has a bug in it.
Disabling the SmartSpeed feature appears to make register 9, the
1000BASET control register, read-only.

For example:

Reading 0x0009=0x0200
Writing 0x0014=0x082c	<= smartspeed enabled
Writing 0x0000=0xb100	<= soft reset
Writing 0x0009=0x0600
Reading 0x0009=0x0600	<= it took the value

Reading 0x0009=0x0600
Writing 0x0014=0x080c	<= smartspeed disabled
Writing 0x0000=0xb100	<= soft reset
Writing 0x0009=0x0200
Reading 0x0009=0x0600	<= it ignored the write

Reading 0x0009=0x0600
Writing 0x0014=0x082c	<= smartspeed enabled
Writing 0x0000=0xb100	<= soft reset
Writing 0x0009=0x0200
Reading 0x0009=0x0200	<= it took the value

If it's going to make register 9 read-only when smartspeed is disabled,
then that's another failure mode and autonegotiation cockup just
waiting to happen - which I spotted when trying to configure the
advertisement using ethtool, and finding that it was impossible to stop
1000baseT/Full being advertised.

I think the only sane approach - at least until we have something more
reasonable in place - is to base the negotiation result off what is
actually stored in the PHY registers at the time the link comes up, and
not on the cached versions of what we should be advertising.

5502b218e001 has caused this regression, and where we are now after
more than a week of trying to come up with some fix for this
regression, the only solution that seems to work without introducing
more failures is to revert that commit.

Adding Heiner (original commit author), Florian, David and netdev.

Thoughts?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
