From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v4, 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Date: Sat, 8 Jul 2017 07:59:07 -0700
Message-ID: <20170708145907.GA19078@roeck-us.net>
References: <20170707004901.26780-2-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170707004901.26780-2-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 06, 2017 at 07:48:59PM -0500, Christopher Bostic wrote:
> Describe device tree optional properties:
> 
>   * aspeed,reset-type = "cpu|soc|system|none"
>      One of three different, mutually exclusive, values
> 
> 	"cpu" : ARM CPU reset on signal
> 	"soc" : 'System on chip' reset
> 	"system" : Full system reset
> 
>      The value can also be set to "none" which indicates that no
>      reset of any kind is to be done via this watchdog.  This assumes
>      another watchdog on the chip is to take care of resets.
> 
>   * aspeed,interrupt - Interrupt CPU on signal

After thinking about that, I wonder if this is necessary. It could be
implied by providing an interrupt to the driver. The driver could then
set the interrupt configuration bit automatically.

[ And the bit by itself doesn't really make sense if the driver doesn't
  also register an interrupt handler ]

>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>   * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
> v4 - Add aspeed-reset-type and assign one of four values,
>      cpu, soc, system, none.
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>      compatibility.  SOC and SYS reset will be set by default
>      without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5e74d7..f526b00 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,9 +8,44 @@ Required properties:
>   - reg: physical base address of the controller and length of memory mapped
>     region
>  
> +Optional properties:
> +
> + - aspeed,reset-type = "cpu|soc|system|none"
> +
> +   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
> +   to generate one of three different, mutually exclusive, types of resets.
> +
> +   Type "none" can be specified to indicate that no resets are to be done.
> +   This is useful in situations where another watchdog engine on chip is
> +   to perform the reset.
> +
> +   If 'aspeed,reset-type=' is not specfied the default is to enable system
> +   reset.
> +
> +   Reset types:
> +
> +        - cpu: Reset CPU on watchdog timeout
> +
> +        - soc: Reset 'System on Chip' on watchdog timeout
> +
> +        - system: Reset system on watchdog timeout
> +
> +        - none: No reset is performed on timeout. Assumes another watchdog
> +                engine is responsible for this.
> +
> + - aspeed,interrupt:	If property is present then interrupt CPU.
> +			If not specified then don't interrupt CPU.
> +
> + - aspeed,external-signal: If property is present then signal is sent to
> +			external reset counter (only WDT1 and WDT2). If not
> +			specified no external signal is sent.
> + - aspeed,alt-boot:    If property is present then boot from alternate block.
> +
>  Example:
>  
>  	wdt1: watchdog@1e785000 {
>  		compatible = "aspeed,ast2400-wdt";
>  		reg = <0x1e785000 0x1c>;
> +		aspeed,reset-type = "system";
> +		aspeed,external-signal;
>  	};
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
