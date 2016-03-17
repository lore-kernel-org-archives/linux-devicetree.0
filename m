From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ARC: [dts] Introduce Timer bindings
Date: Thu, 17 Mar 2016 11:24:21 -0500
Message-ID: <20160317162421.GA21947@rob-hp-laptop>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
 <1457439972-20285-3-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457439972-20285-3-git-send-email-vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Noam Camus <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2016 at 05:56:05PM +0530, Vineet Gupta wrote:
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

Use of unit addresses without reg property is going to start generating 
warnings. I would just use "timer0" in this case.

> +		compatible = "snps,arc-timer0";

s/timer0/timer/

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

rtc {

And then similar updates in the dts files.

> +		compatible = "snps,arc-rtc";
> +		clocks = <&core_clk>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
