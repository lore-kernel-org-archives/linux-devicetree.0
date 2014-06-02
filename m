From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: clps711x: Add DT bindings documentation
Date: Mon, 2 Jun 2014 09:56:51 +0100
Message-ID: <20140602085651.GA12397@leverpostej>
References: <1401616522-13505-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401616522-13505-1-git-send-email-shc_work-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 01, 2014 at 10:55:22AM +0100, Alexander Shiyan wrote:
> This patch adds DT binding documentation for the Cirrus Logic
> CLPS711X-based CPUs clock subsystem.
> 
> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/clps711x-clock.txt      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clps711x-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/clps711x-clock.txt b/Documentation/devicetree/bindings/clock/clps711x-clock.txt
> new file mode 100644
> index 0000000..0fdf3c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clps711x-clock.txt
> @@ -0,0 +1,19 @@
> +* Clock bindings for the Cirrus Logic CLPS711X CPUs
> +
> +Required properties:
> +- compatible  : Shall contain "cirrus,clps711x-clk".
> +- reg         : Address of the internal register set.
> +- cpufreq     : Factory set default frequency in HZ.

Huh? Why is this called "cpufreq" what is this the frequency of,
exactly?

Is this an input or an output?

Cheers,
Mark.

> +- #clock-cells: Should be <1>.
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell. See include/dt-bindings/clock/clps711x-clock.h
> +for the full list of CLPS711X clock IDs.
> +
> +Example:
> +	clks: clks@80000000 {
> +		#clock-cells = <1>;
> +		compatible = "cirrus,ep7312-clk", "cirrus,clps711x-clk";
> +		reg = <0x80000000 0xc000>;
> +		cpufreq = <73728000>;
> +	};
> -- 
> 1.8.5.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
