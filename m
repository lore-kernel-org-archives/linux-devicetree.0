From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/6] watchdog: ts4800: add driver for TS-4800 watchdog
Date: Wed, 25 Nov 2015 14:29:56 -0600
Message-ID: <20151125202956.GA10228@rob-hp-laptop>
References: <1448479507-1951-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1448479507-1951-4-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448479507-1951-4-git-send-email-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 02:25:04PM -0500, Damien Riegel wrote:
> This watchdog is instantiated in a FPGA that is memory mapped. It is
> made of only one register, called the feed register. Writing to this
> register will re-arm the watchdog for a given time (and enable it if it
> was disable). It can be disabled by writing a special value into it.
> 
> It is part of a syscon block, and the watchdog register offset in this
> block varies from board to board. This offset is passed in the syscon
> property after the phandle to the syscon node.
> 
> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/ts4800-wdt.txt    |  25 +++
>  drivers/watchdog/Kconfig                           |  10 +
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/ts4800_wdt.c                      | 215 +++++++++++++++++++++
>  4 files changed, 251 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
>  create mode 100644 drivers/watchdog/ts4800_wdt.c
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> new file mode 100644
> index 0000000..388c60f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> @@ -0,0 +1,25 @@
> +Technologic Systems Watchdog
> +
> +Required properties:
> +- compatible: must be "technologic,ts4800-wdt"
> +- syscon: phandle / integer array that points to the syscon node which
> +          describes the FPGA's syscon registers.
> +          - phandle to FPGA's syscon
> +          - offset to the watchdog register
> +
> +Optional property:
> +- timeout-sec: contains the watchdog timeout in seconds.
> +
> +Example:
> +
> +syscon: syscon@b0010000 {
> +	compatible = "syscon", "simple-mfd";
> +	reg = <0xb0010000 0x3d>;
> +	bus-width = <16>;
> +
> +	wdt@e {
> +		compatible = "technologic,ts4800-wdt";
> +		syscon = <&syscon 0xe>;

If this is single register only for the watchdog, why do you need 
syscon? You can just use reg.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
