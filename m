From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 5/8] net: mscc: Add initial Ocelot switch support
Date: Fri, 30 Mar 2018 15:54:22 +0200
Message-ID: <20180330135422.GA28244@lunn.ch>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-6-alexandre.belloni@bootlin.com>
 <1df0a932-f7c1-f1b5-9a35-3c16d0c551e5@gmail.com>
 <20180330124537.GC14180@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180330124537.GC14180@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

> > All of this sounds like it should be moved into the br_join/leave, this
> > does not appear to be the right place to do that.
> > 
> 
> No, I've triple checked because this is a comment that both Andrew and
> you had. Once a port is added to the PGID MASK, it will start forwarding
> frames so we really want that to happen only when the port is in
> BR_STATE_FORWARDING state. Else, we may forward frames between the
> addition of the port to the bridge and setting the port to the
> BR_STATE_BLOCKING state.

Hi Alexandre

Interesting observation. I took a look at some of the other join
implementations. mv88e6xxx does the join immediately. mt7539 does it
immediately, if the port is enabled. lan9303 does it immediately.
qca8k does it immediately. b53 does it immediately.

Either they all get it wrong, or we make the assumption the bridge
sets the STP state first, then has the port join the bridge.

Looking at the code, br_add_if() it calls
netdev_master_upper_dev_link() and then later

        if (netif_running(dev) && netif_oper_up(dev) &&
            (br->dev->flags & IFF_UP))
                br_stp_enable_port(p);

So it does look like there is a window of time between the port
joining and the STP state being set.

I know in the past, we have run into the opposite problem. A port
leaves the bridge, while in blocked state. The port should then
becomes an individual port, so the STP state needs setting to
forwarding. I don't remember where we fix this.

I don't like that this new driver is different, but it also looks like
we have a real problem here. More digging needed.

   Andrew
