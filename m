From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v5 2/6] ARM: smp_scu: add a helper for powering on a
 specific CPU
Date: Mon, 14 Aug 2017 11:52:18 +0100
Message-ID: <20170814105218.GG20805@n2100.armlinux.org.uk>
References: <20170728212138.12217-1-martin.blumenstingl@googlemail.com>
 <20170728212138.12217-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170728212138.12217-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 28, 2017 at 11:21:34PM +0200, Martin Blumenstingl wrote:
> +/*
> + * Set the executing CPUs power mode to SCU_PM_NORMAL.
> + *
> + * This function must be called with preemption disabled, and as it
> + * has the side effect of disabling coherency, caches must have been
> + * flushed. Interrupts must also have been disabled.

This comment looks rather misleading for several reasons:

1. we're bringing another CPU to normal power mode, which means it's
   coming _into_ coherency, not leaving coherency, so "side effect of
   disabling coherency" is wrong.

2. what has the state of the _local_ CPUs caches got to do with the
   remote CPU when it isn't even powered up?

Could you please reword this comment to be more accurate please - I
think the paragraph can be removed.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
