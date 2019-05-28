From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V3 net-next 2/6] net: Introduce a new MII time stamping
 interface.
Date: Tue, 28 May 2019 16:01:05 +0200
Message-ID: <20190528140105.GH18059@lunn.ch>
References: <20190521224723.6116-3-richardcochran@gmail.com>
 <20190522005823.GD6577@lunn.ch>
 <20190528051750.ub4urccdwmkg2u3c@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190528051750.ub4urccdwmkg2u3c@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 10:17:50PM -0700, Richard Cochran wrote:
> On Wed, May 22, 2019 at 02:58:23AM +0200, Andrew Lunn wrote:
> > > -static int dp83640_hwtstamp(struct phy_device *phydev, struct ifreq *ifr)
> > > +static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
> > >  {
> > > -	struct dp83640_private *dp83640 = phydev->priv;
> > > +	struct dp83640_private *dp83640 =
> > > +		container_of(mii_ts, struct dp83640_private, mii_ts);
> > >  	struct hwtstamp_config cfg;
> > >  	u16 txcfg0, rxcfg0;
> > 
> > Hi Richard
> > 
> > David might complain about reverse christmas tree. Maybe define a
> > macro, to_dp83640() which takes mii_ts?
> 
> That is nice idea for another series, I think.  For now this matches
> the existing 'container_of' usage within the driver.

Well, David might reject it because it is not reverse christmas tree.

      Andrew
