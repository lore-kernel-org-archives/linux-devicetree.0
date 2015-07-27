From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] doc: dt: add documentation for nxp,lpc1788-rtc
Date: Mon, 27 Jul 2015 09:37:20 -0400
Message-ID: <20150727133720.GA15004@beef>
References: <1436635730-15617-1-git-send-email-manabian@gmail.com>
 <1436635730-15617-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436635730-15617-3-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 11, 2015 at 07:28:50PM +0200, Joachim Eastwood wrote:
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/nxp,lpc1788-rtc.txt     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.txt b/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.txt
> new file mode 100644
> index 000000000000..ad41a040432c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.txt
> @@ -0,0 +1,21 @@
> +NXP LPC1788 real-time clock
> +
> +The LPC1788 RTC provides calendar and clock functionality
> +together with periodic tick and alarm interrupt support.
> +
> +Required properties:
> +- compatible	: must contain "nxp,lpc1788-rtc"
> +- reg		: Specifies base physical address and size of the registers.
> +- interrupts	: A single interrupt specifier.
> +- clocks	: Must contain entries for rtc and register clock

"Must contain clock specifiers for rtc and register clock" ?

-Matt

> +- clock-names	: Must contain "rtc" and "reg"
> +  See ../clocks/clock-bindings.txt for details.
> +
> +Example:
> +rtc: rtc@40046000 {
> +	compatible = "nxp,lpc1788-rtc";
> +	reg = <0x40046000 0x1000>;
> +	interrupts = <47>;
> +	clocks = <&creg_clk 0>, <&ccu1 CLK_CPU_BUS>;
> +	clock-names = "rtc", "reg";
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
