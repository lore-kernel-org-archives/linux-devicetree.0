From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2] watchdog: bcm7038: add device tree binding documentation
Date: Sun, 23 Aug 2015 20:32:21 -0700
Message-ID: <55DA9045.2060107@roeck-us.net>
References: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com> <1440092486-16905-2-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440092486-16905-2-git-send-email-justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Justin,

On 08/20/2015 10:41 AM, Justin Chen wrote:
> Add device tree binding docmentation for the watchdog hardware block
> on bcm7038 and newer SoCs.
>
> Signed-off-by: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
> new file mode 100644
> index 0000000..adb8260
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
> +- clocks: the clock running the watchdog
> +- clock-frequency: the rate of the clock

Is 'clock-frequency' really needed (and useful), or would it make more sense
to expect the user to configure a fixed clock if nothing else is available ?
How do other drivers handle this ?

Thanks,
Guenter

> +
> +Example:
> +
> +watchdog {
> +	compatible = "brcm,bcm7038-wdt";
> +	clocks = <&upg_fixed>;
> +	reg = <0xf040a7e8 0x16>;
> +};
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
