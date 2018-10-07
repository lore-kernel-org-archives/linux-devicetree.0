From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 21:54:00 +0200
Message-ID: <20181007195400.GA25883@lunn.ch>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007191551.gy4l4g6qdgz6ztez@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 12:15:51PM -0700, Richard Cochran wrote:
> On Sun, Oct 07, 2018 at 08:27:51PM +0200, Andrew Lunn wrote:
> > The mii_timestamper is generic, in the same why hwmon is generic. It
> > does not matter where the time stamper is. So i'm wondering if we
> > should remove the special case for a PHY timestamper, remove all the
> > phylib support, etc.
> 
> This implementation is (to the best of my understanding) what you were
> asking for in your review of v1:

Sure, but things have moved on since then.
 
> > So i really think you need to cleanly integrate into phylib and
> > phylink.
> 
> > Use a phandle, and have
> > of_mdiobus_register_phy() follow the phandle to get the device.
> 
> > To keep lifecycle issues simple, i would also keep it in phydev, not
> > netdev.
> 
> This present series is a reasonable, incremental improvement to the
> existing PHY time stamping support.  It will handle any use case that
> I can think of, and I would like to avoid over-engineering this.

I can think of three obvious use cases where this does not work:

1) phylink, not phdev. We have been pushing some MAC drivers towards
phylink, especially those which support >1Gbp.

2) When an SFP is connected to the MAC, not a copper PHY. The class of
device you are adding a driver for will work just as well for an SFP
as for a copper PHY. The SERDES interface remains the same,
independent of if a copper PHY is used, or a SFP. But an SFP does not
have an instance of a phydv.

2a) An SFP which is actually a Copper PHY. There is a phydev for this,
but it is associated to the phylink, not the netdev.

3) Firmware controlled PHYs. phylib/phylink is not used, the MAC turns
all ethtool calls into RPCs to the firmware. I've no numbers about
this, but i have the feeling this is becoming more popular. It does
however tend to be high end devices, and those are more likely to have
timestamping in the MAC. I suppose they could also offload
tomestamping to the firmware, in which case, they might want to make
use of this new API.

    Andrew
