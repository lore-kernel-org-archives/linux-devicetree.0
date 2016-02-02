From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 16:03:53 -0600
Message-ID: <20160202220353.GA10273@rob-hp-laptop>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454410739-24444-3-git-send-email-vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Noam Camus <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 04:28:52PM +0530, Vineet Gupta wrote:
> ARC Timers have historically been probed directly.
> As precursor to start probing Timers thru DT introduce these bindings
> 
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/timer/snps,arc-timer0.txt  | 23 ++++++++++++++++++++++
>  .../devicetree/bindings/timer/snps,arc-timer1.txt  | 17 ++++++++++++++++
>  .../devicetree/bindings/timer/snps,archs-gfrc.txt  | 14 +++++++++++++
>  .../devicetree/bindings/timer/snps,archs-rtc.txt   | 14 +++++++++++++
>  arch/arc/boot/dts/abilis_tb10x.dtsi                | 12 +++++++++++
>  arch/arc/boot/dts/skeleton.dtsi                    | 12 +++++++++++
>  arch/arc/boot/dts/skeleton_hs.dtsi                 | 12 +++++++++++
>  arch/arc/boot/dts/skeleton_hs_idu.dtsi             | 12 +++++++++++
>  8 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
> new file mode 100644
> index 000000000000..ceb80c72a90b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
> @@ -0,0 +1,23 @@
> +Synopsys ARC Local Timer with Interrupt Capabilities
> +- Found on all ARC CPUs (ARC700/ARCHS)
> +- Mandatory clockevent provider
> +
> +Required properties:
> +
> +- compatible : should be "snps,arc-timer0"

timer0 and timer1 are different h/w blocks, not just different 
instances?

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
> +	timer0: timer_clkevt {

just "timer" for node name. clkevt is a Linuxism.

> +		compatible = "snps,arc-timer0";
> +		interrupts = <3>;
> +		interrupt-parent = <&core_intc>;
> +		clocks = <&timer0_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
> new file mode 100644
> index 000000000000..4886192ce2f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
> @@ -0,0 +1,17 @@
> +Synopsys ARC Free Running Local 32-bit Timer
> +- Found on all ARC CPUs (ARC700/ARCHS)
> +- Mandatory clocksource provider on ARC700
> +- Optional clocksource provider on UP ARC HS CPUs
> +  (and if better timer archs-rtc not available in SoC)
> +
> +Required properties:
> +
> +- compatible : should be "snps,arc-timer1"
> +- clocks     : phandle to the source clock

No interrupt because it doesn't have one or you use this as a 
clocksource and don't need it?

> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,arc-timer1";
> +		clocks = <&timer0_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> new file mode 100644
> index 000000000000..cce60e16aa0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
> +- clocksourc provider for SMP SoC
> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-gfrc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,archs-gfrc";
> +		clocks = <&timer0_clk>;
> +	};
> diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> new file mode 100644
> index 000000000000..f3b49938812b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> @@ -0,0 +1,14 @@
> +Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
> +- clocksourc provider for UP SoC

local timer on a UP processor?

> +
> +Required properties:
> +
> +- compatible : should be "snps,archs-rtc"
> +- clocks     : phandle to the source clock
> +
> +Example:
> +
> +	timer1: timer_clksrc {
> +		compatible = "snps,arc-rtc";
> +		clocks = <&timer0_clk>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
