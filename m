From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Sun, 15 Sep 2019 15:06:39 +0100
Message-ID: <20190915140639.GC25745@shell.armlinux.org.uk>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch>
 <87muf6oyvr.fsf@tarshish>
 <20190915135652.GC3427@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190915135652.GC3427@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Baruch Siach <baruch@tkos.co.il>, tinywrkb <tinywrkb@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2019 at 03:56:52PM +0200, Andrew Lunn wrote:
> > Tinywrkb confirmed to me in private communication that revert of
> > 5502b218e001 fixes Ethernet for him on effected system.
> > 
> > He also referred me to an old Cubox-i spec that lists 10/100 Ethernet
> > only for i.MX6 Solo/DualLite variants of Cubox-i. It turns out that
> > there was a plan to use a different 10/100 PHY for Solo/DualLite
> > SOMs. This plan never materialized. All SolidRun i.MX6 SOMs use the same
> > AR8035 PHY that supports 1Gb.
> > 
> > Commit 5502b218e001 might be triggering a hardware issue on the affected
> > Cubox-i. I could not reproduce the issue here with Cubox-i and a Dual
> > SOM variant running v5.3-rc8. I have no Solo/DualLite variant handy at
> > the moment.
> 
> Could somebody with an affected device show us the output of ethtool
> with and without 5502b218e001. Does one show 1G has been negotiated,
> and the other 100Mbps? If this is true, how does it get 100Mbps
> without that patch? We are missing a piece of the puzzle.

Hang on.  5502b218e001 is in 5.2 already - it was merged as part of the
v5.1 merge window.  That means my imx6 Solo Hummingboard is already
running it with the AR8035 PHY, and it works fine.

# dmesg
...
OF: fdt: Machine model: SolidRun HummingBoard Solo/DualLite
...
# ethtool eth0
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Supported pause frame use: Symmetric
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Advertised pause frame use: Symmetric
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Link partner advertised link modes:  10baseT/Half 10baseT/Full
                                             100baseT/Half 100baseT/Full
                                             1000baseT/Full
        Link partner advertised pause frame use: Symmetric
        Link partner advertised auto-negotiation: Yes
        Link partner advertised FEC modes: Not reported
        Speed: 1000Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: internal
        Auto-negotiation: on
        Supports Wake-on: d
        Wake-on: d
        Link detected: yes

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
