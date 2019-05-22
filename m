From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V3 net-next 6/6] ptp: Add a driver for InES time stamping
 IP core.
Date: Wed, 22 May 2019 03:42:20 +0200
Message-ID: <20190522014220.GB734@lunn.ch>
References: <20190521224723.6116-7-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521224723.6116-7-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> +static bool ines_match(struct sk_buff *skb, unsigned int ptp_class,
> +		       struct ines_timestamp *ts);
> +static int ines_rxfifo_read(struct ines_port *port);
> +static u64 ines_rxts64(struct ines_port *port, unsigned int words);
> +static bool ines_timestamp_expired(struct ines_timestamp *ts);
> +static u64 ines_txts64(struct ines_port *port, unsigned int words);
> +static void ines_txtstamp_work(struct work_struct *work);
> +static bool is_sync_pdelay_resp(struct sk_buff *skb, int type);
> +static u8 tag_to_msgtype(u8 tag);

Hi Richard

I don't know about the PTP subsystem, but in general, forward
declarations are frowned upon, and it is generally requested to
reorder the functions to remove them.

> +static struct platform_driver ines_ptp_ctrl_driver = {
> +	.probe  = ines_ptp_ctrl_probe,
> +	.remove = ines_ptp_ctrl_remove,
> +	.driver = {
> +		.name = "ines_ptp_ctrl",
> +		.of_match_table = of_match_ptr(ines_ptp_ctrl_of_match),
> +	},
> +};
> +
> +static int __init ines_ptp_init(void)
> +{
> +	return platform_driver_register(&ines_ptp_ctrl_driver);
> +}
> +
> +static void __exit ines_ptp_cleanup(void)
> +{
> +	platform_driver_unregister(&ines_ptp_ctrl_driver);
> +}

include/linux/platform_device.h:

/* module_platform_driver() - Helper macro for drivers that don't do
 * anything special in module init/exit.  This eliminates a lot of
 * boilerplate.  Each module may only use this macro once, and
 * calling it replaces module_init() and module_exit()
 */
#define module_platform_driver(__platform_driver) \
        module_driver(__platform_driver, platform_driver_register, \
                        platform_driver_unregister)

	Andrew
