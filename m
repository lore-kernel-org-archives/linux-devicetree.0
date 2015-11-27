From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: Update mcp342x binding for
 the mcp3421
Date: Fri, 27 Nov 2015 14:15:26 -0600
Message-ID: <20151127201526.GA31568@rob-hp-laptop>
References: <1448632372-5315-1-git-send-email-s.hauer@pengutronix.de>
 <1448632372-5315-3-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448632372-5315-3-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 27, 2015 at 02:52:52PM +0100, Sascha Hauer wrote:
> The mcp3421 is the single channel variant of the mcp342x family and
> can be supported by the mcp342x driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/iio/adc/mcp3422.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mcp3422.txt b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> index 333139c..dcae4cc 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
> @@ -1,7 +1,8 @@
> -* Microchip mcp3422/3/4/6/7/8 chip family (ADC)
> +* Microchip mcp3421/2/3/4/6/7/8 chip family (ADC)
>  
>  Required properties:
>   - compatible: Should be
> +	"microchip,mcp3421" or
>  	"microchip,mcp3422" or
>  	"microchip,mcp3423" or
>  	"microchip,mcp3424" or
> -- 
> 2.6.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
