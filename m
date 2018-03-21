Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 14:51:51 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 3/5] net: Introduce field for the MII
 time stamper.
Message-ID: <20180321215151.7x5skyfrpixezmau@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <338f19a006839f1d00e3cfd3521bdd5fd0afc5fe.1521656774.git.richardcochran@gmail.com>
 <cbab700a-8a4f-8c4a-b959-e356de006f6e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbab700a-8a4f-8c4a-b959-e356de006f6e@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 12:12:00PM -0700, Florian Fainelli wrote:
> > +static int mdiobus_netdev_notification(struct notifier_block *nb,
> > +				       unsigned long msg, void *ptr)
> > +{
> > +	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
> > +	struct phy_device *phydev = netdev->phydev;
> > +	struct mdio_device *mdev;
> > +	struct mii_bus *bus;
> > +	int i;
> > +
> > +	if (netdev->mdiots || msg != NETDEV_UP || !phydev)
> > +		return NOTIFY_DONE;
> 
> You are still assuming that we have a phy_device somehow, whereas you
> parch series wants to solve that for generic MDIO devices, that is a bit
> confusing.

The phydev is the only thing that associates a netdev with an MII bus.

> > +
> > +	/*
> > +	 * Examine the MII bus associated with the PHY that is
> > +	 * attached to the MAC.  If there is a time stamping device
> > +	 * on the bus, then connect it to the network device.
> > +	 */
> > +	bus = phydev->mdio.bus;
> > +
> > +	for (i = 0; i < PHY_MAX_ADDR; i++) {
> > +		mdev = bus->mdio_map[i];
> > +		if (!mdev)
> > +			continue;
> > +		if (mdiodev_supports_timestamping(mdev)) {
> > +			netdev->mdiots = mdev;
> > +			return NOTIFY_OK;
> 
> What guarantees that netdev->mdiots gets cleared?

Why would it need to be cleared?

> Also, why is this done
> with a notifier instead of through phy_{connect,attach,disconnect}?

We have no guarantee the mdio device has been probed yet.

> It
> looks like we still have this requirement of the mdio TS device being a
> phy_device somehow, I am confused here...

We only need the phydev to get from the netdev to the mii bus.
 
> > +		}
> > +	}
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> >  #ifdef CONFIG_PM
> >  static int mdio_bus_suspend(struct device *dev)
> >  {
> 
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index 5fbb9f1da7fd..223d691aa0b0 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -1943,6 +1943,7 @@ struct net_device {
> >  	struct netprio_map __rcu *priomap;
> >  #endif
> >  	struct phy_device	*phydev;
> > +	struct mdio_device	*mdiots;
> 
> phy_device embedds a mdio_device, can you find a way to rework the PHY
> PTP code to utilize the phy_device's mdio instance so do not introduce
> yet another pointer in that big structure that net_device already is?

It would be strange and wrong to "steal" the phy's mdio struct, IMHO.
After all, we just got support for non-PHY mdio devices.  The natural
solution is to use it.

Thanks,
Richard
