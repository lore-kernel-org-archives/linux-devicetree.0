From: tinywrkb <tinywrkb@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 16:32:53 +0300
Message-ID: <20190917133253.GA1210141@arch-dsk-01>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch>
 <87muf6oyvr.fsf@tarshish>
 <20190915135652.GC3427@lunn.ch>
 <20190917124101.GA1200564@arch-dsk-01>
 <20190917125434.GH20778@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917125434.GH20778@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Baruch Siach <baruch@tkos.co.il>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 02:54:34PM +0200, Andrew Lunn wrote:
> On Tue, Sep 17, 2019 at 03:41:01PM +0300, tinywrkb wrote:
> > On Sun, Sep 15, 2019 at 03:56:52PM +0200, Andrew Lunn wrote:
> > > > Tinywrkb confirmed to me in private communication that revert of
> > > > 5502b218e001 fixes Ethernet for him on effected system.
> > > > 
> > > > He also referred me to an old Cubox-i spec that lists 10/100 Ethernet
> > > > only for i.MX6 Solo/DualLite variants of Cubox-i. It turns out that
> > > > there was a plan to use a different 10/100 PHY for Solo/DualLite
> > > > SOMs. This plan never materialized. All SolidRun i.MX6 SOMs use the same
> > > > AR8035 PHY that supports 1Gb.
> > > > 
> > > > Commit 5502b218e001 might be triggering a hardware issue on the affected
> > > > Cubox-i. I could not reproduce the issue here with Cubox-i and a Dual
> > > > SOM variant running v5.3-rc8. I have no Solo/DualLite variant handy at
> > > > the moment.
> > > 
> > > Could somebody with an affected device show us the output of ethtool
> > > with and without 5502b218e001. Does one show 1G has been negotiated,
> > > and the other 100Mbps? If this is true, how does it get 100Mbps
> > > without that patch? We are missing a piece of the puzzle.
> > > 
> > > 	Andrew
> > 
> > linux-test-5.1rc1-a2703de70942-without_bad_commit
> > 
> > Settings for eth0:
> > 	Supported ports: [ TP MII ]
> > 	Supported link modes:   10baseT/Half 10baseT/Full
> > 	                        100baseT/Half 100baseT/Full
> > 	                        1000baseT/Full
> 
> So this means the local device says it can do 1000Mbps.
> 
> 
> > 	Supported pause frame use: Symmetric
> > 	Supports auto-negotiation: Yes
> > 	Supported FEC modes: Not reported
> > 	Advertised link modes:  10baseT/Half 10baseT/Full
> > 	                        100baseT/Half 100baseT/Full
> > 	                        1000baseT/Full
> 
> The link peer can also do 1000Mbps.
> 
> 
> > 	Advertised pause frame use: Symmetric
> > 	Advertised auto-negotiation: Yes
> > 	Advertised FEC modes: Not reported
> > 	Link partner advertised link modes:  10baseT/Half 10baseT/Full
> > 	                                     100baseT/Half 100baseT/Full
> > 	                                     1000baseT/Full
> > 	Link partner advertised pause frame use: Symmetric
> > 	Link partner advertised auto-negotiation: Yes
> > 	Link partner advertised FEC modes: Not reported
> > 	Speed: 100Mb/s
> 
> Yet they have decided to do 100Mbps. 
> 
> We need to understand Why? The generic PHY driver would not do this on
> its own. So i'm thinking something has poked a PHY register with some
> value, and this patch is causing it to be over written.
> 
> Please can you use mii-tool -v -v to dump the PHY registers in each
> case.
> 
> Thanks
> 	Andrew

Here's the output of # mii-tool -v -v eth0 

* linux-test-5.1rc1-a2703de70942-without_bad_commit

Using SIOCGMIIPHY=0x8947
eth0: negotiated 100baseTx-FD flow-control, link ok
  registers for MII PHY 0:
    3100 796d 004d d072 15e1 c5e1 000f 0000
    0000 0000 0800 0000 0000 0000 0000 a000
    0000 0000 0000 f420 082c 0000 04e8 0000
    3200 3000 0000 063d 0000 0000 0000 0000
  product info: vendor 00:13:74, model 7 rev 2
  basic mode:   autonegotiation enabled
  basic status: autonegotiation complete, link ok
  capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
  link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control


* linux-test-5.1rc1-5502b218e001-with_bad_commit

Using SIOCGMIIPHY=0x8947
eth0: negotiated 100baseTx-FD flow-control, link ok
  registers for MII PHY 0:
    3100 796d 004d d072 15e1 c5e1 000d 0000
    0000 0000 0800 0000 0000 0000 0000 a000
    0000 0000 0000 0000 082c 0000 04e8 0000
    3200 3000 0000 063d 0000 0000 0000 0000
  product info: vendor 00:13:74, model 7 rev 2
  basic mode:   autonegotiation enabled
  basic status: autonegotiation complete, link ok
  capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
  link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control

Thanks for helping Andrew.
