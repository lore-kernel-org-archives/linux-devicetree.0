From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: imx6q: provide documentation for new
 fsl,pmic_stby_poweroff property
Date: Wed, 31 May 2017 15:52:56 +0100
Message-ID: <20170531145255.GC10351@leverpostej>
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
 <20170531061457.23744-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531061457.23744-2-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 08:14:52AM +0200, Oleksij Rempel wrote:
> Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/clock/imx6q-clock.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> index 9252912a5b0e..214cb5f461c7 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> @@ -6,6 +6,10 @@ Required properties:
>  - interrupts: Should contain CCM interrupt
>  - #clock-cells: Should be <1>
>  
> +Optional properties:
> +- fsl,pmic_stby_poweroff: Configure CCM to assert PMIC_STBY_REQ signal
> +  on power off.

s/_/-/ in property names, please.

When/why is this needed?

Why should a DT author (not) set this?

Thanks,
Mark.

> +
>  The clock consumer should specify the desired clock by having the clock
>  ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6qdl-clock.h
>  for the full list of i.MX6 Quad and DualLite clock IDs.
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
