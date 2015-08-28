From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] watchdog: bcm7038: add device tree binding
 documentation
Date: Thu, 27 Aug 2015 18:02:07 -0700
Message-ID: <20150828010207.GB5597@roeck-us.net>
References: <1440716004-27022-1-git-send-email-justinpopo6@gmail.com>
 <1440716004-27022-2-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440716004-27022-2-git-send-email-justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 03:53:23PM -0700, Justin Chen wrote:
> Add device tree binding documentation for the watchdog hardware block
> on bcm7038 and newer SoCs.
> 
> Signed-off-by: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> new file mode 100644
> index 0000000..39e5cf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> @@ -0,0 +1,19 @@
> +BCM7038 Watchdog timer
> +
> +Required properties:
> +
> +- compatible : should be "brcm,bcm7038-wdt"
> +- reg : Specifies base physical address and size of the registers.
> +
> +Optional properties:
> +
> +- clocks: The clock running the watchdog. If no clock is found the
> +	  driver will default to 27000000 HZ.
> +
> +Example:
> +
> +watchdog {
> +	compatible = "brcm,bcm7038-wdt";
> +	clocks = <&upg_fixed>;
> +	reg = <0xf040a7e8 0x16>;
> +};
> -- 
> 2.1.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
