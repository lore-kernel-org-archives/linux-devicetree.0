From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 19:19:05 +0100
Message-ID: <20190917181905.GA25745@shell.armlinux.org.uk>
References: <20190917125434.GH20778@lunn.ch>
 <20190917133253.GA1210141@arch-dsk-01>
 <20190917133942.GR25745@shell.armlinux.org.uk>
 <20190917151707.GV25745@shell.armlinux.org.uk>
 <20190917153027.GW25745@shell.armlinux.org.uk>
 <20190917163427.GA1475935@arch-dsk-01>
 <20190917170419.GX25745@shell.armlinux.org.uk>
 <20190917171913.GY25745@shell.armlinux.org.uk>
 <20190917172658.GB9591@lunn.ch>
 <20190917173728.GZ25745@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917173728.GZ25745@shell.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, tinywrkb <tinywrkb@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 06:37:28PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Sep 17, 2019 at 07:26:58PM +0200, Andrew Lunn wrote:
> > > diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
> > > index b3893347804d..85cf4a4a5e81 100644
> > > --- a/drivers/net/phy/at803x.c
> > > +++ b/drivers/net/phy/at803x.c
> > 
> > Hi Russell
> > 
> > This won't work. In the kernel logs, you see 
> > 
> > kernel: Generic PHY 2188000.ethernet-1:00: attached PHY driver [Generic PHY]
> > 
> > The generic PHY driver is being used, not the at803x driver.
> 
> Well, the _correct_ driver needs to be used for the PHY specific
> features to be properly controlled.  Using the generic driver
> in this situation will not be guaranteed to work.

Well, this hasn't worked, but not for the obvious reason.  Register 0x14
is documented as read/write.  Bits 15:6 are reserved, bit 5 is the
smart speed enable, 4:2 configures the attempts, bit 1 sets the link
stable condition, bit 0 is reserved.

Writing 0x80c results in the register reading back 0x82c.  Writing
0x800 results in the same.  Writing 0 reads back 0x2c.  Writing 0xffff
seems to prevent packets being passed - and at that point I lost
control so I couldn't see what the result was.

There is nothing in the data sheet which suggests that there is any
gating of this register.  So it looks like we're stuck with smartspeed
enabled.

So, I think there's only two remaining ways forward - to revert commit
5502b218e001 to restore the old behaviour, read back the advertisement
from the PHY along with the rest of the status, as I've previously
stated.  It means that phylib will modify phydev->advertising at
random points, just as it modifies phydev->lp_advertising, so locking
may become an issue.  The revert approach is probably best until we
have something working along those lines.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
