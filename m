From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/7] Documentation: arm64: pmu: Add Broadcom Vulcan
 PMU binding
Date: Wed, 20 Apr 2016 12:15:48 +0100
Message-ID: <20160420111547.GG11453@leverpostej>
References: <1461092062-7484-1-git-send-email-ashoks@broadcom.com>
 <1461092062-7484-2-git-send-email-ashoks@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461092062-7484-2-git-send-email-ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2016 at 11:54:16AM -0700, Ashok Kumar wrote:
> Document the compatible string for Broadcom Vulcan PMU.
> Also arranged the list in alphabetical order.
> 
> Signed-off-by: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

FWIW:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
>  Documentation/devicetree/bindings/arm/pmu.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
> index 6eb73be..74d5417 100644
> --- a/Documentation/devicetree/bindings/arm/pmu.txt
> +++ b/Documentation/devicetree/bindings/arm/pmu.txt
> @@ -22,10 +22,11 @@ Required properties:
>  	"arm,arm11mpcore-pmu"
>  	"arm,arm1176-pmu"
>  	"arm,arm1136-pmu"
> +	"brcm,vulcan-pmu"
> +	"cavium,thunder-pmu"
>  	"qcom,scorpion-pmu"
>  	"qcom,scorpion-mp-pmu"
>  	"qcom,krait-pmu"
> -	"cavium,thunder-pmu"
>  - interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
>                 interrupt (PPI) then 1 interrupt should be specified.
>  
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
