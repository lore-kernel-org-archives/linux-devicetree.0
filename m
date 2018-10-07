From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 4/5] net: mdio: of: Register discovered MII
 time stampers.
Date: Sun, 7 Oct 2018 20:17:54 +0200
Message-ID: <20181007181754.GA22794@lunn.ch>
References: <20181007173823.21590-5-richardcochran@gmail.com>
 <8a238abb-dfaa-54b4-1c10-86fa619f41e3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8a238abb-dfaa-54b4-1c10-86fa619f41e3@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> > +	if (err == -ENOENT)
> > +		return NULL;
> > +	else if (err)
> > +		return ERR_PTR(err);
> > +
> > +	if (args.args_count >= 1)
> > +		port = args.args[0];
> 
> If it's greater than one, than it is an error, and it should be flagged
> as such.
> 
> The idea looks good though, should of_find_mii_timestamper() somehow be
> made conditional to CONFIG_PTP and we should have a stub for when it is
> disabled?

Hi Florian

There already is a stub. But register return -EOPNOTSUPP.

 
> > +
> > +	return register_mii_timestamper(args.np, port);

So this returns EOPNOTUP

> > +}
> > +
> >  static int of_mdiobus_register_phy(struct mii_bus *mdio,
> >  				    struct device_node *child, u32 addr)
> >  {
> > +	struct mii_timestamper *mii_ts;
> >  	struct phy_device *phy;
> >  	bool is_c45;
> >  	int rc;
> >  	u32 phy_id;
> >  
> > +	mii_ts = of_find_mii_timestamper(child);
> > +	if (IS_ERR(mii_ts))
> > +		return PTR_ERR(mii_ts);
> > +

and this returns EOPNOPTSUPP, so the PHY is not registered :-(

    Andrew
