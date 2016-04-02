From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armv7-m: add address to unit name
Date: Sat, 2 Apr 2016 19:12:30 +0300
Message-ID: <56FFEF6E.2000002@cogentembedded.com>
References: <1459577299-2818-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459577299-2818-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 4/2/2016 9:08 AM, Stefan Agner wrote:

> Add address to unit name to remove the following warning:
>   Warning (unit_address_vs_reg): Node /nv-interrupt-controller has a
>   reg or ranges property, but no unit name
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Hi Arnd,
>
> Not sure through which tree this should go but an earlier patch
> seemd to be applied directly by you...
>
> --
> Stefan
>
>   arch/arm/boot/dts/armv7-m.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
> index b1ad7cf..8126bec 100644
> --- a/arch/arm/boot/dts/armv7-m.dtsi
> +++ b/arch/arm/boot/dts/armv7-m.dtsi
> @@ -1,7 +1,7 @@
>   #include "skeleton.dtsi"
>
>   / {
> -	nvic: nv-interrupt-controller  {
> +	nvic: nv-interrupt-controller@0xe000e100 {

    Drop "0x" from <unit address> please. And the name should be just 
"interrupt-controller@..."

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
