From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 4/7] net: mscc: Add initial Ocelot switch
 support
Date: Thu, 26 Apr 2018 23:09:15 +0200
Message-ID: <20180426210915.GE23481@lunn.ch>
References: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
 <20180426195931.5393-5-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426195931.5393-5-alexandre.belloni@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

> +/* Checks if the net_device instance given to us originate from our driver. */
> +static bool ocelot_netdevice_dev_check(const struct net_device *dev)
> +{
> +	return dev->netdev_ops == &ocelot_port_netdev_ops;
> +}

This is probably O.K. now, but when you add support for controlling
the switch over PCIe, i think it breaks. A board could have two
switches...

It might be possible to do something with dev->parent. All ports of a
switch should have the same parent.

       Andrew
