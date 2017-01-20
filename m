From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt: bindings: add documentation for zx2967 family
 watchdog controller
Date: Fri, 20 Jan 2017 09:53:39 +0800
Message-ID: <20170120015337.GA17299@dragon>
References: <1484791192-31674-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484791192-31674-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 09:59:50AM +0800, Baoyou Xie wrote:
> This patch adds dt-binding documentation for zx2967 family
> watchdog controller.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

It seems that the comments I put on v1 remains unresolved.

> ---
>  .../bindings/watchdog/zte,zx2967-wdt.txt           | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> new file mode 100644
> index 0000000..6e35ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
> @@ -0,0 +1,32 @@
> +ZTE zx2967 Watchdog timer
> +
> +Required properties:
> +
> +- compatible : should be one of the following.
> +       * zte,zx296718-wdt
> +- reg : Specifies base physical address and size of the registers.
> +- clocks : Pairs of phandle and specifier referencing the controller's clocks.
> +- clock-names: "wdtclk" for the watchdog clock.
> +- resets : Reference to the reset controller controlling the watchdog
> +           controller.
> +- reset-names : Must include the following entries:
> +       * wdtrst

I do not think clock-names and reset-names are really necessary, since
there is only one clock and reset signal.

> +
> +Optional properties:
> +
> +- wdt-reset-sysctrl : should include following fields.

We need a vendor prefix for vendor specific property.

> +	* phandle of aon-sysctrl.
> +	* configuare value that be wrote to aon-sysctrl.

s/configuare/configure, s/wrote/written

> +	* bit mask, corresponding bits will be affected.

I think we need some comments for bindings users to understand the
different role between "resets" and "wdt-reset-sysctrl".  Also, why is
wdt-reset-sysctrl is optional?  Does it still work well without this
property.

FYI. I have a similar bindings for TVENC below, which you may find
useful.

http://www.spinics.net/lists/devicetree/msg159668.html

> +
> +Example:
> +
> +wdt_ares: watchdog@1465000 {

What does the suffix "ares" mean?  I guess "wdt" is good enough as the
label name.

Shawn

> +	compatible = "zte,zx296718-wdt";
> +	reg = <0x1465000 0x1000>;
> +	clocks = <&topcrm WDT_WCLK>;
> +	clock-names = "wdtclk";
> +	resets = <&toprst 35>;
> +	reset-names = "wdtrst";
> +	wdt-reset-sysctrl = <&aon_sysctrl 1 0x115>;
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
