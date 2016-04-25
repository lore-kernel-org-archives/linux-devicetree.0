From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 13/41] Documentation: dt: interrupt-controller: fix
 spelling mistakes
Date: Mon, 25 Apr 2016 08:50:00 -0500
Message-ID: <20160425135000.GA8491@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-14-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-14-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:10AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>

Applied, thanks.

Rob

> ---
>  .../devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
> index 43effa0..18d4f40 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
> @@ -4,7 +4,7 @@ All TI OMAP4/5 (and their derivatives) an interrupt controller that
>  routes interrupts to the GIC, and also serves as a wakeup source. It
>  is also referred to as "WUGEN-MPU", hence the name of the binding.
>  
> -Reguired properties:
> +Required properties:
>  
>  - compatible : should contain at least "ti,omap4-wugen-mpu" or
>    "ti,omap5-wugen-mpu"
> @@ -20,7 +20,7 @@ Notes:
>  - Because this HW ultimately routes interrupts to the GIC, the
>    interrupt specifier must be that of the GIC.
>  - Only SPIs can use the WUGEN as an interrupt parent. SGIs and PPIs
> -  are explicitly forbiden.
> +  are explicitly forbidden.
>  
>  Example:
>  
> -- 
> 2.8.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
