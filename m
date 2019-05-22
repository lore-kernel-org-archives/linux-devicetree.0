From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V3 net-next 5/6] net: mdio: of: Register discovered MII
 time stampers.
Date: Wed, 22 May 2019 03:22:27 +0200
Message-ID: <20190522012227.GA734@lunn.ch>
References: <20190521224723.6116-6-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521224723.6116-6-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> +struct mii_timestamper *of_find_mii_timestamper(struct device_node *node)
> +{
> +	struct of_phandle_args arg;
> +	int err;
> +
> +	err = of_parse_phandle_with_fixed_args(node, "timestamper", 1, 0, &arg);
> +
> +	if (err == -ENOENT)
> +		return NULL;
> +	else if (err)
> +		return ERR_PTR(err);
> +
> +	if (arg.args_count != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	return register_mii_timestamper(arg.np, arg.args[0]);
> +}
> +
>  static int of_mdiobus_register_phy(struct mii_bus *mdio,
>  				    struct device_node *child, u32 addr)
>  {
> +	struct mii_timestamper *mii_ts;
>  	struct phy_device *phy;
>  	bool is_c45;
>  	int rc;
>  	u32 phy_id;
>  
> +	mii_ts = of_find_mii_timestamper(child);
> +	if (IS_ERR(mii_ts))
> +		return PTR_ERR(mii_ts);
> +
>  	is_c45 = of_device_is_compatible(child,
>  					 "ethernet-phy-ieee802.3-c45");
>  

Hi Richard

There can be errors after this, e.g. of_irq_get() returns
-EPROBE_DEFER, or from phy_device_register().

Shouldn't unregister_mii_timestamper() be called on error?

	  Andrew
