Return-Path: <SRS0=MhuY=GL=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH net-next RFC V1 3/5] net: Introduce field for the MII time
 stamper.
References: <cover.1521656774.git.richardcochran@gmail.com>
 <338f19a006839f1d00e3cfd3521bdd5fd0afc5fe.1521656774.git.richardcochran@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cbab700a-8a4f-8c4a-b959-e356de006f6e@gmail.com>
Date: Wed, 21 Mar 2018 12:12:00 -0700
MIME-Version: 1.0
In-Reply-To: <338f19a006839f1d00e3cfd3521bdd5fd0afc5fe.1521656774.git.richardcochran@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On 03/21/2018 11:58 AM, Richard Cochran wrote:
> This patch adds a new field to the network device structure to reference
> a time stamping device on the MII bus.  By decoupling the time stamping
> function from the PHY device, we pave the way to allowing a non-PHY
> device to take this role.
> 
> Signed-off-by: Richard Cochran <richardcochran@gmail.com>
> ---
>  drivers/net/phy/mdio_bus.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/netdevice.h  |  1 +
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
> index 24b5511222c8..fdac8c8ac272 100644
> --- a/drivers/net/phy/mdio_bus.c
> +++ b/drivers/net/phy/mdio_bus.c
> @@ -717,6 +717,47 @@ static int mdio_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	return 0;
>  }
>  
> +static bool mdiodev_supports_timestamping(struct mdio_device *mdiodev)
> +{
> +	if (mdiodev->ts_info  && mdiodev->hwtstamp &&
> +	    mdiodev->rxtstamp && mdiodev->txtstamp)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static int mdiobus_netdev_notification(struct notifier_block *nb,
> +				       unsigned long msg, void *ptr)
> +{
> +	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
> +	struct phy_device *phydev = netdev->phydev;
> +	struct mdio_device *mdev;
> +	struct mii_bus *bus;
> +	int i;
> +
> +	if (netdev->mdiots || msg != NETDEV_UP || !phydev)
> +		return NOTIFY_DONE;

You are still assuming that we have a phy_device somehow, whereas you
parch series wants to solve that for generic MDIO devices, that is a bit
confusing.

> +
> +	/*
> +	 * Examine the MII bus associated with the PHY that is
> +	 * attached to the MAC.  If there is a time stamping device
> +	 * on the bus, then connect it to the network device.
> +	 */
> +	bus = phydev->mdio.bus;
> +
> +	for (i = 0; i < PHY_MAX_ADDR; i++) {
> +		mdev = bus->mdio_map[i];
> +		if (!mdev)
> +			continue;
> +		if (mdiodev_supports_timestamping(mdev)) {
> +			netdev->mdiots = mdev;
> +			return NOTIFY_OK;

What guarantees that netdev->mdiots gets cleared? Also, why is this done
with a notifier instead of through phy_{connect,attach,disconnect}? It
looks like we still have this requirement of the mdio TS device being a
phy_device somehow, I am confused here...

> +		}
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  #ifdef CONFIG_PM
>  static int mdio_bus_suspend(struct device *dev)
>  {

> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 5fbb9f1da7fd..223d691aa0b0 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -1943,6 +1943,7 @@ struct net_device {
>  	struct netprio_map __rcu *priomap;
>  #endif
>  	struct phy_device	*phydev;
> +	struct mdio_device	*mdiots;

phy_device embedds a mdio_device, can you find a way to rework the PHY
PTP code to utilize the phy_device's mdio instance so do not introduce
yet another pointer in that big structure that net_device already is?

>  	struct lock_class_key	*qdisc_tx_busylock;
>  	struct lock_class_key	*qdisc_running_key;
>  	bool			proto_down;
> 


-- 
Florian
