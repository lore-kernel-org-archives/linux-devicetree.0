From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: DT: Add entry for ARM SP805-WDT
Date: Sun, 13 Dec 2015 19:06:19 -0600
Message-ID: <20151214010619.GA848@rob-hp-laptop>
References: <1449834467-30283-1-git-send-email-bhupesh.sharma@freescale.com>
 <1449834467-30283-2-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449834467-30283-2-git-send-email-bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 05:17:46PM +0530, Bhupesh Sharma wrote:
> This patch adds a devicetree binding documentation for ARM's
> SP805 WatchDog Timer.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/sp805-wdt.txt     |   29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt b/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> new file mode 100644
> index 0000000..45b5afc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/sp805-wdt.txt
> @@ -0,0 +1,29 @@
> +* ARM SP805 Watchdog Timer (WDT) Controller
> +
> +SP805 WDT is a ARM Primecell Peripheral and has a standard-id register that
> +can be used to identify the peripheral type, vendor, and revision.
> +This value can be used for driver matching.
> +
> +As SP805 WDT is a primecell IP, it follows the base bindings specified in
> +'arm/primecell.txt'
> +
> +Required properties:
> +- compatible : Should be "arm,sp805-wdt", "arm,primecell"
> +- reg : Base address and size of the watchdog timer registers.
> +- clocks : From common clock binding.
> +           First clock is PCLK and the second is WDOGCLK.
> +           WDOGCLK can be equal to or be a sub-multiple of the PCLK frequency.
> +- clock-names : From common clock binding. Shall be "apb_pclk" for first clock.

And for the 2nd clock?

> +
> +Optional properties:
> +- interrupts : Should specify WDT interrupt number.
> +
> +Examples:
> +
> +		cluster1_core0_watchdog: wdt@c000000 {
> +			compatible = "arm,sp805-wdt", "arm,primecell";
> +			reg = <0x0 0xc000000 0x0 0x1000>;
> +			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +			clock-names = "apb_pclk", "wdog_clk";
> +		};
> +
> -- 
> 1.7.9.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
