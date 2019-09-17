From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 18:04:19 +0100
Message-ID: <20190917170419.GX25745@shell.armlinux.org.uk>
References: <20190910185033.GD9761@lunn.ch>
 <87muf6oyvr.fsf@tarshish>
 <20190915135652.GC3427@lunn.ch>
 <20190917124101.GA1200564@arch-dsk-01>
 <20190917125434.GH20778@lunn.ch>
 <20190917133253.GA1210141@arch-dsk-01>
 <20190917133942.GR25745@shell.armlinux.org.uk>
 <20190917151707.GV25745@shell.armlinux.org.uk>
 <20190917153027.GW25745@shell.armlinux.org.uk>
 <20190917163427.GA1475935@arch-dsk-01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917163427.GA1475935@arch-dsk-01>
Sender: linux-kernel-owner@vger.kernel.org
To: tinywrkb <tinywrkb@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 07:34:27PM +0300, tinywrkb wrote:
> The patch didn't fix the issue.
> 
> # ethtool eth0
> 
> Settings for eth0:
> 	Supported ports: [ TP MII ]
> 	Supported link modes:   10baseT/Half 10baseT/Full
> 	                        100baseT/Half 100baseT/Full
> 	                        1000baseT/Full
> 	Supported pause frame use: Symmetric
> 	Supports auto-negotiation: Yes
> 	Supported FEC modes: Not reported
> 	Advertised link modes:  10baseT/Half 10baseT/Full
> 	                        100baseT/Half 100baseT/Full
> 	                        1000baseT/Full
> 	Advertised pause frame use: Symmetric
> 	Advertised auto-negotiation: Yes
> 	Advertised FEC modes: Not reported
> 	Link partner advertised link modes:  10baseT/Half 10baseT/Full
> 	                                     100baseT/Half 100baseT/Full
> 	                                     1000baseT/Full
> 	Link partner advertised pause frame use: Symmetric
> 	Link partner advertised auto-negotiation: Yes
> 	Link partner advertised FEC modes: Not reported
> 	Speed: 1000Mb/s
> 	Duplex: Full
> 	Port: MII
> 	PHYAD: 0
> 	Transceiver: internal
> 	Auto-negotiation: on
> 	Supports Wake-on: d
> 	Wake-on: d
> 	Link detected: yes
> 
> # mii-tool -v -v eth0
> 
> Using SIOCGMIIPHY=0x8947
> eth0: negotiated 100baseTx-FD flow-control, link ok
>   registers for MII PHY 0:
>     3100 796d 004d d072 15e1 c5e1 000f 0000
>     0000 0000 0800 0000 0000 0000 0000 a000
>     0000 0000 0000 f420 082c 0000 04e8 0000
>     3200 3000 0000 063d 0000 0000 0000 0000
>   product info: vendor 00:13:74, model 7 rev 2
>   basic mode:   autonegotiation enabled
>   basic status: autonegotiation complete, link ok
>   capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
>   advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
>   link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
> 
> # journalctl -b | egrep -i 'phy|eth|fec'|grep -v usb
> 
> kernel: Booting Linux on physical CPU 0x0
> kernel: libphy: Fixed MDIO Bus: probed
> kernel: libphy: fec_enet_mii_bus: probed
> kernel: fec 2188000.ethernet eth0: registered PHC device 0
> kernel: dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.31a with HDCP (DWC HDMI 3D TX PHY)
> kernel: Generic PHY 2188000.ethernet-1:00: attached PHY driver [Generic PHY] (mii_bus:phy_addr=2188000.ethernet-1:00, irq=POLL)
> kernel: fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> systemd-networkd[242]: eth0: Gained carrier

Okay, so this is getting weird.

ethtool still shows that 1000baseT/Full is being advertised, yet the
PHY disagrees:

     3100 796d 004d d072 15e1 c5e1 000f 0000
     0000 0000 0800 0000 0000 0000 0000 a000
          ^^^^
Gigabit control register, bits 9 should be set, but it's clear.

Looking at the following registers, brings up another possibility what
is going on:

     0000 0000 0000 f420 082c 0000 04e8 0000
                    ^^^^ ^^^^

These two registers may provide a hint.  Of the first register, which
is the interrupt status register, bit 5 is set, indicating that a
"smartspeed downgrade occurred".  The second register is the smartspeed
configuration, which basically says that the feature is enabled.

Smartspeed is designed to allow the link to come up if two-pair CAT5
cable is used (are you using a 4-pair or 2-pair cable?) by making the
link fall back to 100mbit, or with CAT3 cable, 10mbit speeds.  What
isn't specified is whether it does this by clearing bits in the various
advertisement registers.

Given what you've said so far, I'd suggest that this is indeed the
case - when smartspeed is triggered, advertisement bits are cleared by
the PHY without the kernel's knowledge, leading to the kernel getting
the speed resolution incorrect after 5502b218e001.

There's another issue here - if smartspeed clears advertisement bits,
then if you connect a 4-pair cable after having used a 2-pair cable,
you'd still be limited to 100mbit.  The ethtool output will be just
as confusing.

The only thing I can think we should do is to read-back the
advertisement from the PHY whenever we read the rest of the status
and update the phy->advertising mask, just like we do with the link
partner advertisement.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
