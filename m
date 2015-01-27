From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: watchdog: Add DT binding documentation for
 jz47xx watchdog timer
Date: Tue, 27 Jan 2015 08:30:08 -0800
Message-ID: <20150127163008.GA21459@roeck-us.net>
References: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1422371490-44402-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422371490-44402-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 03:11:29PM +0000, Zubair Lutfullah Kakakhel wrote:
> Add binding for jz47xx watchdog timer. It is a simple watchdog timer.
> Needs rtc clock and register addresses
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> 
> ---
> The jz4740 is platform only at the moment.
> 
> But DT support is being added
> 
> See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/
> 
> jz47xx is used because jz4780 will also use this driver

Not a valid argument. Please use jz4740, per convention.

xx implies anything from 00 to 99, which is not necessarily correct.
If support for other chips is added, that information can be mentioned
in the file itself, as it is done for many other drivers.

> ---
>  .../devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt
> new file mode 100644
> index 0000000..bf4c404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt
> @@ -0,0 +1,17 @@
> +Ingenic Watchdog Timer (WDT) Controller for JZ47XX
> +
> +Required properties:
> +compatible: "ingenic,jz4740-watchdog"
> +reg: Register address and length for watchdog registers
> +clocks: phandle to rtcclk
> +clock-names: must be "rtc"
> +
> +Example:
> +
> +watchdog: jz47xx-watchdog@0x10002000 {
> +	compatible = "ingenic,jz4780-watchdog";

"ingenic,jz4780-watchdog" is not listed as possible value above,
nor is it listed in the patch itself, so you can not use it here.

> +	reg = <0x10002000 0x100>;
> +
> +	clocks = <&rtclk>;
> +	clock-names = "rtc";
> +};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
