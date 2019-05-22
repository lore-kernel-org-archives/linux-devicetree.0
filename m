From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V3 net-next 3/6] net: Add a layer for non-PHY MII time
 stamping drivers.
Date: Wed, 22 May 2019 03:08:52 +0200
Message-ID: <20190522010852.GE6577@lunn.ch>
References: <20190521224723.6116-4-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521224723.6116-4-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> +struct mii_timestamper *register_mii_timestamper(struct device_node *node,
> +						 unsigned int port)
> +{
> +	struct mii_timestamper *mii_ts = NULL;
> +	struct mii_timestamping_desc *desc;
> +	struct list_head *this;
> +
> +	mutex_lock(&tstamping_devices_lock);
> +	list_for_each(this, &mii_timestamping_devices) {
> +		desc = list_entry(this, struct mii_timestamping_desc, list);
> +		if (desc->device->of_node == node) {
> +			mii_ts = desc->ctrl->probe_channel(desc->device, port);
> +			if (mii_ts) {
> +				mii_ts->device = desc->device;
> +				get_device(desc->device);

> + * @probe_channel:	Callback into the controller driver announcing the
> + *			presence of the 'port' channel.  The 'device' field
> + *			had been passed to register_mii_tstamp_controller().
> + *			The driver must return either a pointer to a valid
> + *			MII timestamper instance or PTR_ERR.

Hi Richard

probe_channel returns an PTR_ERR. So if (mii_ts) should probably be
if (IS_ERR(mii_ts))

   Andrew
