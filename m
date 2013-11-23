From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] of/platform: Fix no irq domain found errors when
	populating interrupts
Date: Sat, 23 Nov 2013 00:55:09 +0000
Message-ID: <20131123005509.GJ16735@n2100.arm.linux.org.uk>
References: <20131123004334.GJ10023@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131123004334.GJ10023-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 04:43:35PM -0800, Tony Lindgren wrote:
> +		/* See of_device_resource_notify for populating interrupts */
> +		for (i = 0; i < num_irq; i++, res++) {
> +			res->flags = IORESOURCE_IRQ;
> +			res->start = -EPROBE_DEFER;
> +			res->end = -EPROBE_DEFER;

NAK.  Definitely a bad idea to start introducing magic values other into
resources.  Please don't do this.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
