From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 13:59:06 -0700
Message-ID: <20181007205906.3h7fpyxdhc24o6lc@localhost>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007195400.GA25883@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 09:54:00PM +0200, Andrew Lunn wrote:
> Sure, but things have moved on since then.

If you have a specific suggestion on how to better implement this,
please tell us what it is.
  
> I can think of three obvious use cases where this does not work:
> 
> 1) phylink, not phdev. We have been pushing some MAC drivers towards
> phylink, especially those which support >1Gbp.

If a phylink device appears that wants time stamping, can't we add the
call to register_mii_timestamper()?
 
> 2) When an SFP is connected to the MAC, not a copper PHY. The class of
> device you are adding a driver for will work just as well for an SFP
> as for a copper PHY. The SERDES interface remains the same,
> independent of if a copper PHY is used, or a SFP. But an SFP does not
> have an instance of a phydv.

Well, as I said before in v1, CONFIG_NETWORK_PHY_TIMESTAMPING depends
on phylib, plain and simple, and expanding beyond phylib is not within
the scope of the this series.
 
> 3) Firmware controlled PHYs. phylib/phylink is not used, the MAC turns
> all ethtool calls into RPCs to the firmware. I've no numbers about
> this, but i have the feeling this is becoming more popular. It does
> however tend to be high end devices, and those are more likely to have
> timestamping in the MAC. I suppose they could also offload
> tomestamping to the firmware, in which case, they might want to make
> use of this new API.

Any MAC with private PHY stuff (that doesn't use phylib) can implement
SO_TIMESTAMPING directly, as if it were a MAC.

Thanks,
Richard
