From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V3 net-next 2/6] net: Introduce a new MII time stamping
 interface.
Date: Wed, 22 May 2019 02:58:23 +0200
Message-ID: <20190522005823.GD6577@lunn.ch>
References: <20190521224723.6116-3-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521224723.6116-3-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> -static int dp83640_hwtstamp(struct phy_device *phydev, struct ifreq *ifr)
> +static int dp83640_hwtstamp(struct mii_timestamper *mii_ts, struct ifreq *ifr)
>  {
> -	struct dp83640_private *dp83640 = phydev->priv;
> +	struct dp83640_private *dp83640 =
> +		container_of(mii_ts, struct dp83640_private, mii_ts);
>  	struct hwtstamp_config cfg;
>  	u16 txcfg0, rxcfg0;

Hi Richard

David might complain about reverse christmas tree. Maybe define a
macro, to_dp83640() which takes mii_ts?

> +/**
> + * struct mii_timestamper - Callback interface to MII time stamping devices.
> + *
> + * @rxtstamp:	Requests a Rx timestamp for 'skb'.  If the skb is accepted,
> + *		the MII time stamping device promises to deliver it using
> + *		netif_rx() as soon as a timestamp becomes available. One of
> + *		the PTP_CLASS_ values is passed in 'type'.  The function
> + *		must return true if the skb is accepted for delivery.
> + *
> + * @txtstamp:	Requests a Tx timestamp for 'skb'.  The MII time stamping
> + *		device promises to deliver it using skb_complete_tx_timestamp()
> + *		as soon as a timestamp becomes available. One of the PTP_CLASS_
> + *		values is passed in 'type'.
> + *
> + * @hwtstamp:	Handles SIOCSHWTSTAMP ioctl for hardware time stamping.
> + * @link_state:	Allows the device to respond to changes in the link state.
> + * @ts_info:	Handles ethtool queries for hardware time stamping.
> + *
> + * Drivers for PHY time stamping devices should embed their
> + * mii_timestamper within a private structure, obtaining a reference
> + * to it using container_of().
> + */

I wonder if it is worth mentioning that link_state() is called with
the phy lock held, but none of the others are?

Otherwise this looks good.

	  Andrew
