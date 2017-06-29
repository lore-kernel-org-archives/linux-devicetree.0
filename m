From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Date: Wed, 28 Jun 2017 20:33:37 -0700
Message-ID: <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170629002811.87199-2-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/28/2017 05:28 PM, Christopher Bostic wrote:
> Describe device tree optional properties:
> 
>    * aspeed,arm-reet - ARM CPU reset on signal
>    * aspeed,no-soc-reset - SOC reset on signal
>    * aspeed,no-sys-reset - System reset on signal
>    * aspeed,interrupt - Interrupt CPU on signal
>    * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>    * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>       compatibility.  SOC and SYS reset will be set by default
>       without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>     - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>   .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5e74d7..6f18005 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,9 +8,33 @@ Required properties:
>    - reg: physical base address of the controller and length of memory mapped
>      region
>   
> +Optional properties:
> +   Signal behavior - Whenever a timeout occurs the watchdog can be programmed
> +   to generate/not generate 6 types of signals:
> +
> + - aspeed,arm-reset:	If property is present then reset ARM CPU only.
> +			If not specified no ARM CPU reset is done.
> +
> + - aspeed,no-soc-reset: If property is present then do not reset SOC.
> +			If not specified then SOC reset is done.
> +
> + - aspeed,no-sys-reset: If property is present then do not reset system.
> +			Typcally used in tandem with 'aspeed-external-signal'

Is this correct ? As I understand the datasheet, it could also used in tandem with
aspeed,interrupt.

> +			If not specified then system reset is done.
> +

I'll leave it up to Rob to decide, but for my part I don't understand no-soc-reset.
I would instead use four properties.

	aspeed,arm-reset
	aspeed,soc-reset
	aspeed,sys-reset (which is the default)
	aspeed,no-reset

There should also be a note explaining that the above are mutually exclusive.

> + - aspeed,interrupt:	If property is present then interrupt CPU.
> +			If not specified then don't interrupt CPU.
> +
> + - aspeed,external-signal: If property is present then signal is sent to
> +			external reset counter (only WDT1 and WDT2). If not
> +			specified no external signal is sent.

For consistency, either add an empty line here or remove the empty lines above

> + - aspeed,alt-boot:    If property is present then boot from alternate block.
> +
>   Example:
>   
>   	wdt1: watchdog@1e785000 {
>   		compatible = "aspeed,ast2400-wdt";
>   		reg = <0x1e785000 0x1c>;
> +		aspeed,no-sys-reset;
> +		aspeed,external-signal;
>   	};
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
