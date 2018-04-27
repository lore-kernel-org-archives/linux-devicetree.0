From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH net-next v2 4/7] net: mscc: Add initial Ocelot switch
 support
Date: Fri, 27 Apr 2018 15:44:00 +0200
Message-ID: <20180427134400.GA4813@piout.net>
References: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
 <20180426195931.5393-5-alexandre.belloni@bootlin.com>
 <20180426210915.GE23481@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426210915.GE23481@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 26/04/2018 23:09:15+0200, Andrew Lunn wrote:
> > +/* Checks if the net_device instance given to us originate from our driver. */
> > +static bool ocelot_netdevice_dev_check(const struct net_device *dev)
> > +{
> > +	return dev->netdev_ops == &ocelot_port_netdev_ops;
> > +}
> 
> This is probably O.K. now, but when you add support for controlling
> the switch over PCIe, i think it breaks. A board could have two
> switches...
> 
> It might be possible to do something with dev->parent. All ports of a
> switch should have the same parent.
> 

Actually, that is fine because it simply ensures netdev_priv(dev); is a
struct ocelot_port.

Later on, we get ocelot_port->ocelot and do the right thing.

The only thing that would not be working when having multiple of those
switches on the same platform would be having interfaces from different
switches in the same bridge. Anyway, this is definitively not something
we want because of the limited bandwidth of the CPU port.


-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
