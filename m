From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend] arm: dts: ls1021a: Specify interrupt-affinity for
 pmu node
Date: Thu, 21 Dec 2017 16:06:51 +0800
Message-ID: <20171221080650.GJ23230@dragon>
References: <1510672189-13306-1-git-send-email-rasmus.villemoes@prevas.dk>
 <1512462145-12664-1-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512462145-12664-1-git-send-email-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Esben Haabendal <eha-/iRVSOupHO4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 09:22:25AM +0100, Rasmus Villemoes wrote:
> From: Esben Haabendal <eha-/iRVSOupHO4@public.gmane.org>
> 
> From: Esben Haabendal <eha-/iRVSOupHO4@public.gmane.org>

Dropped the extra From line, fixed prefix and applied patch.

Shawn

> 
> This avoids the warning
> 
>   hw perfevents: no interrupt-affinity property for /pmu, guessing.
> 
> Signed-off-by: Esben Haabendal <eha-/iRVSOupHO4@public.gmane.org>
> [RV: adapt commit log to the warning emitted in current mainline]
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 02a266faec9b..96dc1a29fc64 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -106,6 +106,7 @@
>  		compatible = "arm,cortex-a7-pmu";
>  		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>;
>  	};
>  
>  	reboot {
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
