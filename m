From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Sun, 15 Sep 2019 15:58:44 +0100
Message-ID: <20190915145844.GE25745@shell.armlinux.org.uk>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch>
 <87muf6oyvr.fsf@tarshish>
 <20190915135652.GC3427@lunn.ch>
 <20190915140639.GC25745@shell.armlinux.org.uk>
 <20190915141552.GD25745@shell.armlinux.org.uk>
 <20190915144252.GA17261@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190915144252.GA17261@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, tinywrkb <tinywrkb@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2019 at 04:42:52PM +0200, Andrew Lunn wrote:
> > > OF: fdt: Machine model: SolidRun HummingBoard Solo/DualLite
> > > ...
> > > # ethtool eth0
> > > Settings for eth0:
> > >         Supported ports: [ TP MII ]
> > >         Supported link modes:   10baseT/Half 10baseT/Full
> > >                                 100baseT/Half 100baseT/Full
> > >                                 1000baseT/Full
> > >         Supported pause frame use: Symmetric
> > >         Supports auto-negotiation: Yes
> > >         Supported FEC modes: Not reported
> > >         Advertised link modes:  10baseT/Half 10baseT/Full
> > >                                 100baseT/Half 100baseT/Full
> > >                                 1000baseT/Full
> > >         Advertised pause frame use: Symmetric
> > >         Advertised auto-negotiation: Yes
> > >         Advertised FEC modes: Not reported
> > >         Link partner advertised link modes:  10baseT/Half 10baseT/Full
> > >                                              100baseT/Half 100baseT/Full
> > >                                              1000baseT/Full
> > >         Link partner advertised pause frame use: Symmetric
> > >         Link partner advertised auto-negotiation: Yes
> > >         Link partner advertised FEC modes: Not reported
> > >         Speed: 1000Mb/s
> > >         Duplex: Full
> > >         Port: MII
> > >         PHYAD: 0
> > >         Transceiver: internal
> > >         Auto-negotiation: on
> > >         Supports Wake-on: d
> > >         Wake-on: d
> > >         Link detected: yes
> 
> > Note that the FEC does *not* support 1000baseT/Half.
> 
> Hi Russell
> 
> fec_main.c has code to mask it out. And it is not listed in the modes
> you have above. So as you say, this all looks to be working.
> 
> I'm wondering if there is an older variant of the hardware with
> 100Mbps magnetics, and the boot loader is setting something in the
> PHY? It could be we are now stomping over that?

Not according to Rabeeh, the SolidRun CTO:

< rabeeh> all i.MX6 based machines from SolidRun are 1Gbps phys
< rabeeh> i thought that we fixed that information, documentation wise;
          but seems not

Even the Carrier1 board that pre-dates Hummingboards had the AR8035
with 1G magnetics.

The schematics I have for the Cubox-i state that the RJ45 jack (which
contains the magnetics) is to be "Gigabit".

There was a 10/100M option for the microsom, which is selected by where
a resistor pack is fitted, having the effect of configuring the AR8035
differently.  I seem to recall the 10/100M option in the early days was
to use a different Atheros PHY.

However, I'm not aware of 10/100M option making it into production, and
Rabeeh's comment (who was involved in the design) confirms that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
