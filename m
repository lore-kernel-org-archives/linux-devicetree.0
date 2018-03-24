Return-Path: <SRS0=/B89=GO=gmail.com=richardcochran@kernel.org>
Date: Sat, 24 Mar 2018 09:59:11 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 2/5] net: phy: Move time stamping
 interface into the generic mdio layer.
Message-ID: <20180324165911.m34hxpyaszmxvi4p@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <b032dcdb34684e3831530da1bb198c764e61968b.1521656774.git.richardcochran@gmail.com>
 <e6c7b4e1-9449-58be-f670-4b6a8aa4b526@gmail.com>
 <20180321214513.5kkw4qpbhp3juxur@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321214513.5kkw4qpbhp3juxur@localhost>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 02:45:13PM -0700, Richard Cochran wrote:
> On Wed, Mar 21, 2018 at 12:10:07PM -0700, Florian Fainelli wrote:
> > > +	phydev->mdio.ts_info = dp83640_ts_info;
> > > +	phydev->mdio.hwtstamp = dp83640_hwtstamp;
> > > +	phydev->mdio.rxtstamp = dp83640_rxtstamp;
> > > +	phydev->mdio.txtstamp = dp83640_txtstamp;
> > 
> > Why is this implemented a the mdio_device level and not at the
> > mdio_driver level? This looks like the wrong level at which this is done.
> 
> The question could be asked of:
> 
> struct mdio_device {
> 	int (*bus_match)(struct device *dev, struct device_driver *drv);
> 	void (*device_free)(struct mdio_device *mdiodev);
> 	void (*device_remove)(struct mdio_device *mdiodev);
> }
> 
> I saw how this is done for the phy, etc, but I don't see any benefit
> of doing it that way.  It would add an extra layer (or two) of
> indirection and save the space four pointer functions.  Is that
> trade-off worth it?

Actually, there was another reason not to put these methods into the
driver structure.  In contrast to phy_device, mdio_device doesn't have
a pointer to the driver structure.  It looks like there is no way to
start from a mdio_device and get to a mdio_driver.  Please correct me
if I'm wrong.

I propose keeping those methods in the mdio_device, wrapping them in
#ifdef CONFIG_NETWORK_PHY_TIMESTAMPING.  That way, they do not add any
burden to the vast majority of users.

Thoughts?

Thanks,
Richard
