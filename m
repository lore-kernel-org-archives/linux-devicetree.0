From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: Add Meson GXBB Watchdog
 bindings
Date: Sun, 10 Jul 2016 09:02:38 -0700
Message-ID: <5782719E.7020002@roeck-us.net>
References: <1468141867-4172-1-git-send-email-narmstrong@baylibre.com>
 <1468141867-4172-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468141867-4172-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/10/2016 02:11 AM, Neil Armstrong wrote:
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   .../devicetree/bindings/watchdog/meson-gxbb-wdt.txt      | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> new file mode 100644
> index 0000000..c7fe36f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> @@ -0,0 +1,16 @@
> +Meson GXBB SoCs Watchdog timer
> +
> +Required properties:
> +
> +- compatible : should be "amlogic,meson-gxbb-wdt"
> +- reg : Specifies base physical address and size of the registers.
> +- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
> +	   is the default clock source.
> +
> +Example:
> +
> +wdt: watchdog@98d0 {
> +	compatible = "amlogic,meson-gxbb-wdt";
> +	reg = <0 0x98d0 0x0 0x10>;
> +	clocks = <&xtal>;
> +};
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
