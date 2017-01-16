From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dt: bindings: add documentation for zx2967 family
 watchdog controller
Date: Mon, 16 Jan 2017 17:04:39 +0800
Message-ID: <20170116090438.GC11600@x250>
References: <1484540395-3335-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484540395-3335-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 12:19:53PM +0800, Baoyou Xie wrote:
> This patch adds dt-binding documentation for zx2967 family
> watchdog controller.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/watchdog/zte,zx2967-wdt.txt           | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> new file mode 100644
> index 0000000..0fe0d40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> @@ -0,0 +1,29 @@
> +ZTE zx2967 Watchdog timer
> +
> +Required properties:
> +
> +- compatible : should be one of the following.
> +       * zte,zx296718-wdt
> +- reg : Specifies base physical address and size of the registers.
> +- clocks : Pairs of phandle and specifier referencing the controller's clocks.
> +- clock-names: "wdtclk" for the watchdog clock.

clock-names only makes sense when there are multiple clock phandles in
'clocks' property.  When clock-names is not present, the driver code
calls devm_clk_get() with the second parameter being NULL.

> +- resets : Reference to the reset controller controlling the watchdog
> +           controller.
> +- reset-names : Must include the following entries:
> +       * wdtrst

Same as clock-names.

> +
> +Optional properties:
> +
> +- reset-mask-config : Mask and configuare value that be wrote to aon-sysctrl.

First of all, for vendor specific properties, we should have a vendor
prefix, something like "zte,reset-mask-config".

Secondly, we should really have more comments to explain why this
property is optional, i.e. in which cases it should be present, and in
which cases it can be missing.  Also, the relationship between this
reset and 'resets = <&toprst 35>' should be explained a bit as well.

Shawn

> +
> +Example:
> +
> +wdt_ares: watchdog@1465000 {
> +	compatible = "zte,zx296718-wdt";
> +	reg = <0x1465000 0x1000>;
> +	clocks = <&topcrm WDT_WCLK>;
> +	clock-names = "wdtclk";
> +	resets = <&toprst 35>;
> +	reset-names = "wdtrst";
> +	reset-mask-config = <1 0x115>;
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
