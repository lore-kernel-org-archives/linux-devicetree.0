From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 1/3] coresight: binding for coresight debug driver
Date: Wed, 15 Feb 2017 11:13:44 +0000
Message-ID: <20170215111343.GD31733@leverpostej>
References: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
 <1486966298-16767-2-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486966298-16767-2-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 02:11:36PM +0800, Leo Yan wrote:
> Adding compatible string for new coresight debug driver.

Please give a more thorough description of the hardware this binding
this is intended to describe.

It's not entirely clear which component this binding is intended to
describe.

Thanks,
Mark.

> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index fcbae6a..3ff15fd 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -40,6 +40,9 @@ its hardware characteristcs.
>  		- System Trace Macrocell:
>  			"arm,coresight-stm", "arm,primecell"; [1]
>  
> +		- Debug Unit:
> +			"arm,coresight-debug", "arm,primecell";
> +
>  	* reg: physical base address and length of the register
>  	  set(s) of the component.
>  
> @@ -78,8 +81,10 @@ its hardware characteristcs.
>  	* arm,cp14: must be present if the system accesses ETM/PTM management
>  	  registers via co-processor 14.
>  
> -	* cpu: the cpu phandle this ETM/PTM is affined to. When omitted the
> -	  source is considered to belong to CPU0.
> +* Optional properties for ETM/PTM/Debugs:
> +
> +	* cpu: the cpu phandle this ETM/PTM/Debug is affined to. When omitted
> +	  the source is considered to belong to CPU0.
>  
>  * Optional property for TMC:
>  
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
