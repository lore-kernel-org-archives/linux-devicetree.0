From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] documentation/devicetree: Update GIC compat strings
Date: Wed, 21 May 2014 11:24:39 +0100
Message-ID: <20140521102439.GE17827@leverpostej>
References: <1400664501-4208-1-git-send-email-Nikolay.Borisov@arm.com>
 <1400664501-4208-3-git-send-email-Nikolay.Borisov@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400664501-4208-3-git-send-email-Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Adding devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]

On Wed, May 21, 2014 at 10:28:21AM +0100, Nikolay Borisov wrote:
> Document the addition of 2 new, implementation-agnostic compatible
> strings. This allows for more flexibility such that new implementation 
> can either state whether they are an extension of an existing implementation,
> a brand new implementation or just that they conform to a standard revision
> of the GIC spec.

>From my POV it makes sense to have these to make it possible to write
DTs with new GIC variants which are implementations of the standard
rather than extensions of existing implementations.

However, DTs using these should also state exactly what variant they
are, and those strings should be documented (even if not supported
directly by the driver). It would be nice to have that mentioned in the
commit message.

Otherwise:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Cheers,
Mark.

> 
> Signed-off-by: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/gic.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
> index 5573c08..223b4cc 100644
> --- a/Documentation/devicetree/bindings/arm/gic.txt
> +++ b/Documentation/devicetree/bindings/arm/gic.txt
> @@ -12,6 +12,8 @@ Main node required properties:
>  
>  - compatible : should be one of:
>  	"arm,gic-400"
> +	"arm,gic-v1"
> +	"arm,gic-v2"
>  	"arm,cortex-a15-gic"
>  	"arm,cortex-a9-gic"
>  	"arm,cortex-a7-gic"
> -- 
> 1.8.1.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
