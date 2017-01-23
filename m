From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/3] watchdog: add DT bindings for Cortina Gemini
Date: Sun, 22 Jan 2017 22:51:16 -0800
Message-ID: <41414806-3f44-6073-6421-b0aaabba4312@roeck-us.net>
References: <20170122223826.29178-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122223826.29178-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/22/2017 02:38 PM, Linus Walleij wrote:
> This adds DT bindings for the Cortina systems Gemini SoC
> watchdog timer.
>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/watchdog/cortina,gemin-watchdog.txt        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/cortina,gemin-watchdog.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/cortina,gemin-watchdog.txt b/Documentation/devicetree/bindings/watchdog/cortina,gemin-watchdog.txt
> new file mode 100644
> index 000000000000..d8dfb9cc41cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/cortina,gemin-watchdog.txt
> @@ -0,0 +1,17 @@
> +Cortina Systems Gemini SoC Watchdog
> +
> +Required properties :
> +- compatible : must be "cortina,gemini-watchdog"
> +- reg : shall contain base register location and length
> +- interrupts : shall contain the interrupt for the watchdog
> +
> +- timeout-sec : shall contain the default watchdog timeout in seconds,
> +                if unset, the default timeout is 13 seconds
> +

The default is a linux driver detail, not a HW detail, and thus probably should not be mentioned here.

> +Example:
> +
> +watchdog@41000000 {
> +	compatible = "cortina,gemini-watchdog";
> +	reg = <0x41000000 0x1000>;
> +	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +};
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
