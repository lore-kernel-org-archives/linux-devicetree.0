From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 4/7] ARM: dts: add support for Vybrid running on Cortex-M4
Date: Mon, 13 Oct 2014 11:32:20 +0100
Message-ID: <20141013103219.GE14739@leverpostej>
References: <cover.1413136383.git.stefan@agner.ch>
 <b3dd902655e9cc4496170a05a907fcce5a687427.1413136383.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b3dd902655e9cc4496170a05a907fcce5a687427.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org" <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 12, 2014 at 07:13:58PM +0100, Stefan Agner wrote:
> This adds an initial device tree to run Linux on the Cortex-M4 on
> Vybrid.
> 
> HACK: Because we include armv7-m.dtsi, the soc node happens to
> be before the clock node. This is a problem for vf610-clk.c, which
> tries to optain the fixed clocks defined in the clock nodes. But
> because clock drivers are initialized sequencially, and we do not
> have support for deferred probing, the clock initialization fails
> horrible.
> Move the armv7-m.dtsi include to the bottom to temporarily work
> work around this...
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Maybe a dummy soc entry in armv7-m.dtsi also helps here. But a
> hack as well. Is it common acceptable that the kernel depends
> on DTS order?

The kernel should not depend on DTS ordering. We should sort out
deferred probing if there is an issue with it.

[...]

> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sxosc {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +
> +		fxosc {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <24000000>;
> +		};
> +	};

Please get rid of the clocks node and put these under the root node.
There is nothing special about clocks, and the kernel in no way handles
a clocks node specially.

> +
> +	soc {
> +		aips0: aips-bus@40000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x40000000 0x70000>;

Out of curiosity, given that this can be driven as a simple-bus, what do
the aips bus registers allow to be configured?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
