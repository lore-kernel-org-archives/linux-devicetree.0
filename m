From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 14:20:33 -0700
Message-ID: <20181007212033.3qdtkcjlebsdceus@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181007205906.3h7fpyxdhc24o6lc@localhost>
 <20181007211405.GD25883@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007211405.GD25883@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 11:14:05PM +0200, Andrew Lunn wrote:
> The problem is you depend on skbuf->dev->phydev. phydev will be NULL.
> net_device does not currently have a phylink member. Even if it did,
> you end up add more and more tests looking every place a
> mii_timestamper could be placed.

Ok, so the way to do this is to have something like
CONFIG_NETWORK_PHYLINK_TIMESTAMPING.  We can deal with that if and
when any real devices appear.

> I'm currently thinking register_mii_timestamper() should take a netdev
> argument, and the net_device structure should gain a struct
> mii_timestamper.
> 
> But we have to look at the lifetime problems. A phydev does not know
> what netdev it is associated to until phy_connect() is called. It is
> at that point you can call register_mii_timestamper().

Right, IOW passing a netdev won't work.

Thanks,
Richard
