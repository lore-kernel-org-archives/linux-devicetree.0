From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk/axs10x: introduce AXS10X pll driver
Date: Wed, 15 Feb 2017 17:33:28 -0600
Message-ID: <20170215233328.a43zg64rqrb6suns@rob-hp-laptop>
References: <1486645356-10449-1-git-send-email-vzakhar@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486645356-10449-1-git-send-email-vzakhar-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vlad Zakharov <Vladislav.Zakharov-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 04:02:36PM +0300, Vlad Zakharov wrote:
> AXS10X boards manages it's clocks using various PLLs. These PLL has same
> dividers and corresponding control registers mapped to different addresses.
> So we add one common driver for such PLLs.
> 
> Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> ODIV. Output clock value is managed using these dividers.
> 
> We add pre-defined tables with supported rate values and appropriate
> configurations of IDIV, FBDIV and ODIV for each value.
> 
> As of today we add support for PLLs that generate clock for the
> following devices:
>  * ARC core on AXC CPU tiles.
>  * ARC PGU on ARC SDP Mainboard.
> and more to come later.
> 
> Signed-off-by: Vlad Zakharov <vzakhar-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/snps,pll-clock.txt   |  28 ++
>  MAINTAINERS                                        |   6 +
>  drivers/clk/axs10x/Makefile                        |   1 +
>  drivers/clk/axs10x/pll_clock.c                     | 384 +++++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/snps,pll-clock.txt
>  create mode 100644 drivers/clk/axs10x/pll_clock.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/snps,pll-clock.txt b/Documentation/devicetree/bindings/clock/snps,pll-clock.txt
> new file mode 100644
> index 0000000..770b8e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/snps,pll-clock.txt
> @@ -0,0 +1,28 @@
> +Binding for the AXS10X Generic PLL clock
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: should be "snps,axs10x-<name>-pll-clock"
> +  "snps,axs10x-arc-pll-clock"
> +  "snps,axs10x-pgu-pll-clock"
> +- reg: should always contain 2 pairs address - length: first for PLL config
> +registers and second for corresponding LOCK CGU register.
> +- clocks: shall be the input parent clock phandle for the PLL.
> +- #clock-cells: from common clock binding; Should always be set to 0.
> +
> +Example:
> +	input_clk: input_clk {

Don't use '_' in node names. So 'input-clk' instead.
> +		clock-frequency = <33333333>;
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +
> +	core_clk: core_clk@80 {

Ditto.

With that, for the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +		compatible = "snps,axs10x-arc-pll-clock";
> +		reg = <0x80 0x10 0x100 0x10>;
> +		#clock-cells = <0>;
> +		clocks = <&input_clk>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
