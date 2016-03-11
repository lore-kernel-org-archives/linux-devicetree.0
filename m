From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ARC: [dts] Introduce Timer bindings
Date: Fri, 11 Mar 2016 04:19:23 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8F330@us01wembx1.internal.synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
 <1457439972-20285-3-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Noam Camus <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 08 March 2016 05:56 PM, Vineet Gupta wrote:
> ARC Timers have historically been probed directly.
> As precursor to start probing Timers thru DT introduce these bindings
> Note that to keep series bisectable, these bindings are not yet used in
> code.
>
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
> Changes v1 -> v2
>  - snps,arc-timer[0-1] folded into single snps-arc-timer	[Rob]
>  - Node name in DT example fixed:				[Rob]
>      "timer1: timer_clksrc {" -> timer@1 {
>  - Introduced 64bit RTC in skeleton_hs.dtsi			[Vineet]
>
> v1:
>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000447.html
>
> Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Rob, sorry for pinging you sooner than I should. This must be busy time ahead of
merge window. However if you can take a quick look at the DT bindings, we might be
able to squeeze this into 4.6
This code seems to be functionally working well and stable !

> ---
>  .../devicetree/bindings/timer/snps,arc-timer.txt   | 26 ++++++++++++++++++++++
>  .../devicetree/bindings/timer/snps,archs-gfrc.txt  | 14 ++++++++++++
>  .../devicetree/bindings/timer/snps,archs-rtc.txt   | 14 ++++++++++++
>  arch/arc/boot/dts/abilis_tb10x.dtsi                | 14 ++++++++++++
>  arch/arc/boot/dts/skeleton.dtsi                    | 14 ++++++++++++
>  arch/arc/boot/dts/skeleton_hs.dtsi                 | 20 +++++++++++++++++
>  arch/arc/boot/dts/skeleton_hs_idu.dtsi             | 14 ++++++++++++
>  7 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer.txt
> new file mode 100644
> index 000000000000..9e02be24e805
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer.txt
> @@ -0,0 +1,26 @@
> +Synopsys ARC Local Timer with Interrupt Capabilities
> +- Found on all ARC CPUs (ARC700/ARCHS)
> +- Can be optionally programmed to interrupt on Limit
> +- Two idential copies TIMER0 and TIMER1 exist in ARC cores and historically
> +  TIMER0 used as clockevent provider (true for all ARC cores)
> +  TIMER1 used for clocksource (mandatory for ARC700, optional for ARC HS)
> +
> +Required properties:
> +
> +- compatible : should be "snps,arc-timer"
> +- interrupts : single Interrupt going into parent intc
> +	       (16 for ARCHS cores, 3 for ARC700 cores)
> +- clocks     : phandle to the source clock
> +
> +Optional properties:
> +
> +- interrupt-parent : phandle to parent intc
> +
> +Example:
> +
> +	timer@0 {
> +		compatible = "snps,arc-timer0";
> +		interrupts = <3>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&core_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> new file mode 100644
> index 000000000000..aaab100f54e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
> +- clocksource provider for SMP SoC
> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-gfrc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer@1 {
> +		compatible = "snps,archs-gfrc";
> +		clocks = <&core_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> new file mode 100644
> index 000000000000..13f756fa1d6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
> +- clocksource provider for UP SoC
> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-rtc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer@1 {
> +		compatible = "snps,arc-rtc";
> +		clocks = <&core_clk>;
> +	};
> diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
> index cfb5052239a1..eadbe71dfa22 100644
> --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
> +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
> @@ -35,6 +35,20 @@
>  		};
>  	};
>  
> +	/* TIMER0 with interrupt for clockevent */
> +	timer@0 {
> +		compatible = "snps,arc-timer";
> +		interrupts = <3>;
> +		interrupt-parent = <&intc>;
> +		clocks = <&cpu_clk>;
> +	};
> +
> +	/* TIMER1 for free running clocksource */
> +	timer@1 {
> +		compatible = "snps,arc-timer";
> +		clocks = <&cpu_clk>;
> +	};
> +
>  	soc100 {
>  		#address-cells	= <1>;
>  		#size-cells	= <1>;
> diff --git a/arch/arc/boot/dts/skeleton.dtsi b/arch/arc/boot/dts/skeleton.dtsi
> index 296d371a335c..f6109c2feba7 100644
> --- a/arch/arc/boot/dts/skeleton.dtsi
> +++ b/arch/arc/boot/dts/skeleton.dtsi
> @@ -30,6 +30,20 @@
>  		};
>  	};
>  
> +	/* TIMER0 with interrupt for clockevent */
> +	timer@0 {
> +		compatible = "snps,arc-timer";
> +		interrupts = <3>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&core_clk>;
> +	};
> +
> +	/* TIMER1 for free running clocksource */
> +	timer@1 {
> +		compatible = "snps,arc-timer";
> +		clocks = <&core_clk>;
> +	};
> +
>  	memory {
>  		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;	/* 256M */
> diff --git a/arch/arc/boot/dts/skeleton_hs.dtsi b/arch/arc/boot/dts/skeleton_hs.dtsi
> index a53876669030..49caeabca37a 100644
> --- a/arch/arc/boot/dts/skeleton_hs.dtsi
> +++ b/arch/arc/boot/dts/skeleton_hs.dtsi
> @@ -25,6 +25,26 @@
>  		};
>  	};
>  
> +	/* TIMER0 with interrupt for clockevent */
> +	timer@0 {
> +		compatible = "snps,arc-timer";
> +		interrupts = <16>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&core_clk>;
> +	};
> +
> +	/* 64-bit Local RTC: preferred clocksource for UP */
> +	timer@1 {
> +		compatible = "snps,archs-timer-rtc";
> +		clocks = <&core_clk>;
> +	};
> +
> +	/* TIMER1 for free running clocksource: Fallback if rtc not found */
> +	timer@2 {
> +		compatible = "snps,arc-timer";
> +		clocks = <&core_clk>;
> +	};
> +
>  	memory {
>  		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;	/* 256M */
> diff --git a/arch/arc/boot/dts/skeleton_hs_idu.dtsi b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
> index 74898d017f7a..7e301ff16200 100644
> --- a/arch/arc/boot/dts/skeleton_hs_idu.dtsi
> +++ b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
> @@ -25,6 +25,20 @@
>  		};
>  	};
>  
> +	/* TIMER0 with interrupt for clockevent */
> +	timer@0 {
> +		compatible = "snps,arc-timer";
> +		interrupts = <16>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&core_clk>;
> +	};
> +
> +	/* 64-bit Global Free Running Counter */
> +	timer@1 {
> +		compatible = "snps,archs-timer-gfrc";
> +		clocks = <&core_clk>;
> +	};
> +
>  	memory {
>  		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;	/* 256M */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
