From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 20:39:34 +0200
Message-ID: <20190917183934.GJ20778@lunn.ch>
References: <20190917133253.GA1210141@arch-dsk-01>
 <20190917133942.GR25745@shell.armlinux.org.uk>
 <20190917151707.GV25745@shell.armlinux.org.uk>
 <20190917153027.GW25745@shell.armlinux.org.uk>
 <20190917163427.GA1475935@arch-dsk-01>
 <20190917170419.GX25745@shell.armlinux.org.uk>
 <20190917171913.GY25745@shell.armlinux.org.uk>
 <20190917172658.GB9591@lunn.ch>
 <20190917173728.GZ25745@shell.armlinux.org.uk>
 <20190917181905.GA25745@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917181905.GA25745@shell.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, tinywrkb <tinywrkb@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > Well, the _correct_ driver needs to be used for the PHY specific
> > features to be properly controlled.  Using the generic driver
> > in this situation will not be guaranteed to work.

I fully agree about the PHY driver. I'm expect this device is
violating c22 when it modifies the advertisement register itself. So
all bets are off for the genphy.

> Well, this hasn't worked, but not for the obvious reason.  Register 0x14
> is documented as read/write.  Bits 15:6 are reserved, bit 5 is the
> smart speed enable, 4:2 configures the attempts, bit 1 sets the link
> stable condition, bit 0 is reserved.
> 
> Writing 0x80c results in the register reading back 0x82c.  Writing
> 0x800 results in the same.  Writing 0 reads back 0x2c.  Writing 0xffff
> seems to prevent packets being passed - and at that point I lost
> control so I couldn't see what the result was.
> 
> There is nothing in the data sheet which suggests that there is any
> gating of this register.  So it looks like we're stuck with smartspeed
> enabled.
> 
> So, I think there's only two remaining ways forward - to revert commit
> 5502b218e001 to restore the old behaviour, read back the advertisement
> from the PHY along with the rest of the status, as I've previously
> stated.  It means that phylib will modify phydev->advertising at
> random points, just as it modifies phydev->lp_advertising, so locking
> may become an issue.  The revert approach is probably best until we
> have something working along those lines.

We have a couple of other PHYs which support downshift. We should see
if we can follow what they do. What is i think important is that
read_status return the correct speed. So we probably cannot use
genphy_read_status() as is. Maybe we should split genphy_read_status()
into two, so the register reading bit can be done unconditionally by
phy drivers for hardware which don't report link down when they
should?

    Andrew
