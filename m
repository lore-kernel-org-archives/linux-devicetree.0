From: tinywrkb <tinywrkb@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Tue, 17 Sep 2019 15:41:01 +0300
Message-ID: <20190917124101.GA1200564@arch-dsk-01>
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
Cc: Baruch Siach <baruch@tkos.co.il>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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
> 
> 	Andrew

linux-test-5.1rc1-a2703de70942-without_bad_commit

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
	Speed: 100Mb/s
	Duplex: Full
	Port: MII
	PHYAD: 0
	Transceiver: internal
	Auto-negotiation: on
	Supports Wake-on: d
	Wake-on: d
	Link detected: yes

journalctl -b | egrep -i 'phy|eth|fec'|grep -v usb
kernel: Booting Linux on physical CPU 0x0
kernel: libphy: Fixed MDIO Bus: probed
kernel: libphy: fec_enet_mii_bus: probed
kernel: fec 2188000.ethernet eth0: registered PHC device 0
kernel: dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.31a with HDCP (DWC HDMI 3D TX PHY)
kernel: Generic PHY 2188000.ethernet-1:00: attached PHY driver [Generic PHY] (mii_bus:phy_addr=2188000.ethernet-1:00, irq=POLL)
kernel: fec 2188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
systemd-networkd[243]: eth0: Gained carrier
systemd-networkd[243]: eth0: DHCPv4 address 192.168.15.101/24 via 192.168.15.1
systemd-networkd[243]: eth0: Gained IPv6LL
systemd-networkd[243]: eth0: Configured

######################################################################

linux-test-5.1rc1-5502b218e001-with_bad_commit

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

journalctl -b | egrep -i 'phy|eth|fec'|grep -v usb
kernel: Booting Linux on physical CPU 0x0
kernel: libphy: Fixed MDIO Bus: probed
kernel: libphy: fec_enet_mii_bus: probed
kernel: fec 2188000.ethernet eth0: registered PHC device 0
kernel: dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.31a with HDCP (DWC HDMI 3D TX PHY)
kernel: Generic PHY 2188000.ethernet-1:00: attached PHY driver [Generic PHY] (mii_bus:phy_addr=2188000.ethernet-1:00, irq=POLL)
kernel: fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
systemd-networkd[239]: eth0: Gained carrier
systemd-networkd[239]: eth0: Gained IPv6LL
