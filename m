From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [V3 3/3] dt-bindings: Add a support cpu type for cortex-a73
Date: Tue, 24 Jan 2017 11:03:48 +0000
Message-ID: <20170124110347.GC6277@leverpostej>
References: <1485248249-117383-1-git-send-email-puck.chen@hisilicon.com>
 <1485248249-117383-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485248249-117383-3-git-send-email-puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lulu.luxiaobo-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, frong.fan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, oliver.fu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 04:57:29PM +0800, Chen Feng wrote:
> Add arm cpu type cortex-a73
> 
> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index a1bcfee..d748774 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -158,6 +158,7 @@ nodes to be present and contain the properties described below.
>  			    "arm,cortex-a53"
>  			    "arm,cortex-a57"
>  			    "arm,cortex-a72"
> +			    "arm,cortex-a73"
>  			    "arm,cortex-m0"
>  			    "arm,cortex-m0+"
>  			    "arm,cortex-m1"
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
