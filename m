From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm63138: change "interupts" to "interrupts"
Date: Mon, 10 Nov 2014 09:46:23 -0800
Message-ID: <5460F9EF.5010605@gmail.com>
References: <1415637358-24378-1-git-send-email-radek.dostal@streamunlimited.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415637358-24378-1-git-send-email-radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Radek Dostal <radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/10/2014 08:35 AM, Radek Dostal wrote:
> all other nodes in bcm63138.dtsi use "interrupts", this had to be just a typo
> which never got noticed, even it may have quite some consequences.
> 
> Signed-off-by: Radek Dostal <radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
>  Hi all,
> 
>  when running git grep with typo, I spotted this typo inDT binding, which 
>  looks obviously wrong to me. Sorry I do not have the board to test it, but 
>  I am pretty sure the patch is correct.
> 
>  I hope I included, right people get_maintainer.pl showed bit too many.
> 
>  Thanks,
>  Radek
> 
>  arch/arm/boot/dts/bcm63138.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
> index f3bb2dd..d2d8e94 100644
> --- a/arch/arm/boot/dts/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/bcm63138.dtsi
> @@ -102,7 +102,7 @@
>  		twd_watchdog: watchdog@1e620 {
>  			compatible = "arm,cortex-a9-twd-wdt";
>  			reg = <0x1e620 0x20>;
> -			interupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  	};
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
