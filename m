From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 2/7] arm64: dts: Add Broadcom Vulcan PMU in dts
Date: Wed, 20 Apr 2016 12:16:58 +0100
Message-ID: <20160420111658.GH11453@leverpostej>
References: <1461092062-7484-1-git-send-email-ashoks@broadcom.com>
 <1461092062-7484-3-git-send-email-ashoks@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461092062-7484-3-git-send-email-ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2016 at 11:54:17AM -0700, Ashok Kumar wrote:
> Add "brcm,vulcan-pmu" compatible string for Broadcom Vulcan PMU.
> 
> Signed-off-by: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
>  arch/arm64/boot/dts/broadcom/vulcan.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/vulcan.dtsi b/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> index 85820e2..34e11a9 100644
> --- a/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/vulcan.dtsi
> @@ -86,7 +86,7 @@
>  	};
>  
>  	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +		compatible = "brcm,vulcan-pmu", "arm,armv8-pmuv3";
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>; /* PMU overflow */
>  	};
>  
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
