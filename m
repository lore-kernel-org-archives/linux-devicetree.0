From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: dts: Foundation model: increate GICC region
 to allow EOImode=1
Date: Tue, 13 Oct 2015 11:42:19 +0100
Message-ID: <561CE00B.3070105@arm.com>
References: <1444729069-27922-1-git-send-email-andre.przywara@arm.com> <1444729069-27922-3-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444729069-27922-3-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andre,

s/increate/increase size of/ in the subject line

On 13/10/15 10:37, Andre Przywara wrote:
> Recent commits made the GIC driver use EOImode=1 for all GICs
> that advertise the proper GICC region size.

Well, it is not so much that the kernel uses EOImode=1, but the fact
that the model has a GICv2 implementation, hence a 8kB GICC region.

> To let the model benefit from the blessings of that mode, increase
> the GICC region to its actual size of 8K.
> 
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/foundation-v8.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
> index 3c5595d..57ad9fe 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> @@ -78,7 +78,7 @@
>  		#address-cells = <2>;
>  		interrupt-controller;
>  		reg = <0x0 0x2c001000 0 0x1000>,
> -		      <0x0 0x2c002000 0 0x1000>,
> +		      <0x0 0x2c002000 0 0x2000>,
>  		      <0x0 0x2c004000 0 0x2000>,
>  		      <0x0 0x2c006000 0 0x2000>;
>  		interrupts = <1 9 0xf04>;
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
