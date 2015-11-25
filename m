From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Add binding documentation for Zodiac Watchdog
 Timer
Date: Wed, 25 Nov 2015 14:06:30 -0600
Message-ID: <20151125200630.GH30473@rob-hp-laptop>
References: <1448453015-16126-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448453015-16126-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 12:03:34PM +0000, Martyn Welch wrote:
> This patchs adds documentation for the binding of the Zodiac RAVE
> Switch Watchdog Processor. This is an i2c based watchdog.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
> 
> v2: Addition of optional properties.
> v3: Correct naming of reset-duration-msec -> reset-duration-ms

I acked v2, so please add it.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
>  .../devicetree/bindings/watchdog/ziirave-wdt.txt      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt b/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> new file mode 100644
> index 0000000..3d87818
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> @@ -0,0 +1,19 @@
> +Zodiac RAVE Watchdog Timer
> +
> +Required properties:
> +- compatible: must be "zii,rave-wdt"
> +- reg: i2c slave address of device, usually 0x38
> +
> +Optional Properties:
> +- timeout-sec: Watchdog timeout value in seconds.
> +- reset-duration-ms: Duration of the pulse generated when the watchdog times
> +  out. Value in milliseconds.
> +
> +Example:
> +
> +	watchdog@38 {
> +		compatible = "zii,rave-wdt";
> +		reg = <0x38>;
> +		timeout-sec = <30>;
> +		reset-duration-ms = <30>;
> +	};
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
