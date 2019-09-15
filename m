From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Sun, 15 Sep 2019 16:42:52 +0200
Message-ID: <20190915144252.GA17261@lunn.ch>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch> <87muf6oyvr.fsf@tarshish>
 <20190915135652.GC3427@lunn.ch>
 <20190915140639.GC25745@shell.armlinux.org.uk>
 <20190915141552.GD25745@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190915141552.GD25745@shell.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, tinywrkb <tinywrkb@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > OF: fdt: Machine model: SolidRun HummingBoard Solo/DualLite
> > ...
> > # ethtool eth0
> > Settings for eth0:
> >         Supported ports: [ TP MII ]
> >         Supported link modes:   10baseT/Half 10baseT/Full
> >                                 100baseT/Half 100baseT/Full
> >                                 1000baseT/Full
> >         Supported pause frame use: Symmetric
> >         Supports auto-negotiation: Yes
> >         Supported FEC modes: Not reported
> >         Advertised link modes:  10baseT/Half 10baseT/Full
> >                                 100baseT/Half 100baseT/Full
> >                                 1000baseT/Full
> >         Advertised pause frame use: Symmetric
> >         Advertised auto-negotiation: Yes
> >         Advertised FEC modes: Not reported
> >         Link partner advertised link modes:  10baseT/Half 10baseT/Full
> >                                              100baseT/Half 100baseT/Full
> >                                              1000baseT/Full
> >         Link partner advertised pause frame use: Symmetric
> >         Link partner advertised auto-negotiation: Yes
> >         Link partner advertised FEC modes: Not reported
> >         Speed: 1000Mb/s
> >         Duplex: Full
> >         Port: MII
> >         PHYAD: 0
> >         Transceiver: internal
> >         Auto-negotiation: on
> >         Supports Wake-on: d
> >         Wake-on: d
> >         Link detected: yes

> Note that the FEC does *not* support 1000baseT/Half.

Hi Russell

fec_main.c has code to mask it out. And it is not listed in the modes
you have above. So as you say, this all looks to be working.

I'm wondering if there is an older variant of the hardware with
100Mbps magnetics, and the boot loader is setting something in the
PHY? It could be we are now stomping over that?

We need to see output like yours, but on a device which is
experiencing the problem.

	     Andrew
