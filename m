From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Thu, 16 Feb 2017 16:44:24 +0000
Message-ID: <20170216164424.GR27312@n2100.armlinux.org.uk>
References: <20170216161742.29320-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170216161742.29320-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 11:17:39AM -0500, Chris Brandt wrote:
> The PL310 in the Renesas RZ/A1 SoC (R7S72100) does not have the sideband
> signals connected between the CPU and L2C. According the PL310 TRM,
> sideband signals are optional.
> 
> If a PL310 is added to a system, but the sideband signals are not
> connected, some Cortex A9 optimizations cannot be used. In particular,
> enabling Full Line Zeros in the CA9 without sidebands connected will
> crash the system since the CA9 will expect the L2C to perform operations,
> yet the L2C never gets the commands.
> 
> This series adds the option to not enable anything in the PL310 that
> uses sidebands, and then adds L2C support to the RZ/A1 DT.
> 
> v4:
> * changed l2x0_bresp_dis to l2x0_bresp_disable
> * changed l2x0_flz_dis to l2x0_flz_disable

Looks good, thanks.

I'll want to merge patch 1, but I suspect the other two patches need
to go through arm-soc, which will cause a problem due to being merged
independently...  Arnd?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
