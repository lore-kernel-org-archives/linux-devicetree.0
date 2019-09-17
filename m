From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 18:37:28 +0100
Message-ID: <20190917173728.GZ25745@shell.armlinux.org.uk>
References: <20190917124101.GA1200564@arch-dsk-01>
 <20190917125434.GH20778@lunn.ch>
 <20190917133253.GA1210141@arch-dsk-01>
 <20190917133942.GR25745@shell.armlinux.org.uk>
 <20190917151707.GV25745@shell.armlinux.org.uk>
 <20190917153027.GW25745@shell.armlinux.org.uk>
 <20190917163427.GA1475935@arch-dsk-01>
 <20190917170419.GX25745@shell.armlinux.org.uk>
 <20190917171913.GY25745@shell.armlinux.org.uk>
 <20190917172658.GB9591@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917172658.GB9591@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: tinywrkb <tinywrkb@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Baruch Siach <baruch@tkos.co.il>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 07:26:58PM +0200, Andrew Lunn wrote:
> > diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
> > index b3893347804d..85cf4a4a5e81 100644
> > --- a/drivers/net/phy/at803x.c
> > +++ b/drivers/net/phy/at803x.c
> 
> Hi Russell
> 
> This won't work. In the kernel logs, you see 
> 
> kernel: Generic PHY 2188000.ethernet-1:00: attached PHY driver [Generic PHY]
> 
> The generic PHY driver is being used, not the at803x driver.

Well, the _correct_ driver needs to be used for the PHY specific
features to be properly controlled.  Using the generic driver
in this situation will not be guaranteed to work.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
