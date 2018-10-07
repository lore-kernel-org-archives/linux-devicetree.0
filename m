From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 2/5] net: Introduce a new MII time stamping
 interface.
Date: Sun, 7 Oct 2018 23:21:18 +0200
Message-ID: <20181007212118.GE25883@lunn.ch>
References: <20181007173823.21590-3-richardcochran@gmail.com>
 <20181007182751.GC22794@lunn.ch>
 <20181007191551.gy4l4g6qdgz6ztez@localhost>
 <20181007195400.GA25883@lunn.ch>
 <20181007205906.3h7fpyxdhc24o6lc@localhost>
 <20181007210728.nimnrijadb2skedg@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007210728.nimnrijadb2skedg@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 02:07:28PM -0700, Richard Cochran wrote:
> On Sun, Oct 07, 2018 at 01:59:06PM -0700, Richard Cochran wrote:
> > On Sun, Oct 07, 2018 at 09:54:00PM +0200, Andrew Lunn wrote:
> > > 1) phylink, not phdev. We have been pushing some MAC drivers towards
> > > phylink, especially those which support >1Gbp.
> > 
> > If a phylink device appears that wants time stamping, can't we add the
> > call to register_mii_timestamper()?
> 
> Actually, I see that 'struct phylink' has a 'struct phy_device *phydev',
> and so it can implement the 'struct mii_timestamper' interface directly.

Maybe. But you still don't have skb->dev->phydev. And phylink->phydev
is much more dynamic, since it can be hot-{un}plugged. You need to
handle it going away at any time.

However, your timestamper is unlikely to be hot-{un}pluggable. So
skb->dev->mii_timestamper seems a lot safer.

       Andrew
