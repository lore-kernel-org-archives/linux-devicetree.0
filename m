From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: realtek: Add watchdog node for RTD1295
Date: Sun, 10 Sep 2017 08:18:20 -0700
Message-ID: <bf49f284-de9a-4990-a551-45aef2b4d0f2@roeck-us.net>
References: <20170904231602.29787-1-afaerber@suse.de>
 <20170904231602.29787-4-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170904231602.29787-4-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/04/2017 04:16 PM, Andreas Färber wrote:
> Add the watchdog node to the RTD1295 Device Tree.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   Depends on the pending clock nodes patch.
>   
>   v1 -> v2: Unchanged
>   
>   arch/arm64/boot/dts/realtek/rtd1295.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/realtek/rtd1295.dtsi b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
> index fbbd6456079e..f39ab63f879d 100644
> --- a/arch/arm64/boot/dts/realtek/rtd1295.dtsi
> +++ b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
> @@ -123,6 +123,12 @@
>   			#interrupt-cells = <1>;
>   		};
>   
> +		watchdog@98007680 {
> +			compatible = "realtek,rtd1295-watchdog";
> +			reg = <0x98007680 0x100>;
> +			clocks = <&osc27M>;
> +		};
> +
>   		uart0: serial@98007800 {
>   			compatible = "snps,dw-apb-uart";
>   			reg = <0x98007800 0x400>;
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
