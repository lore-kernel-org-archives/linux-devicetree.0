From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-utgard: Add Rockchip Utgard
 Malis
Date: Tue, 12 Sep 2017 17:02:30 -0500
Message-ID: <20170912220230.kegayoedm4olybat@rob-hp-laptop>
References: <20170905105739.8330-1-heiko@sntech.de>
 <20170905105739.8330-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170905105739.8330-2-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 05, 2017 at 12:57:33PM +0200, Heiko Stuebner wrote:
> Some (older or lower power) Rockchip socs use Utgard-based Mali-GPUs.
> So add the necessary compatibles for them. As the setup is the same for
> all of them (needing only the additional reset line), they get added in
> a somewhat condensed form, to not inflate the document unnecessary.
> 
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> index 2b6243e730f6..3b7f6f72f032 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> @@ -58,6 +58,13 @@ to specify one more vendor-specific compatible, among:
>      Required properties:
>        * resets: phandle to the reset line for the GPU
>  
> +  - rockchip,rk3036-mali
> +  - rockchip,rk3066-mali
> +  - rockchip,rk3188-mali
> +  - rockchip,rk3228-mali

Need to list the compatibles in the compatible property section. You can 
say "Rockchip variants" or something here.

> +    Required properties:
> +      * resets: phandle to the reset line for the GPU
> +
>    - stericsson,db8500-mali
>      Required properties:
>        * interrupt-names and interrupts:
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
