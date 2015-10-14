From: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: adc: mcp320x: Deprecated compatible strings
 with no vendor prefix
Date: Wed, 14 Oct 2015 10:27:26 -0500
Message-ID: <20151014152726.GA29846@deathstar>
References: <1444827279-23163-1-git-send-email-javier@osg.samsung.com>
 <1444827279-23163-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444827279-23163-2-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?S=F8ren?= Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 02:54:38PM +0200, Javier Martinez Canillas wrote:
> The Microchip Analog to Digital Converter (ADC) Device Tree binding
> documents compatible strings with no vendor prefix. Since it should
> compatible strings with also a vendor, add these to the binding doc
> and mark the old ones as deprecated.
> 
> The driver says that the device is from Microchip Technology which
> is listed in Documentation/devicetree/bindings/vendor-prefixes.txt
> so use the documented prefix.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
>  .../devicetree/bindings/iio/adc/mcp320x.txt        | 30 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
> index 2a1f3af30155..bcd3ac8e6e0c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
> @@ -10,16 +10,28 @@ must be specified.
>  Required properties:
>  	- compatible:  	Must be one of the following, depending on the
>  			model:
> -				"mcp3001"
> -				"mcp3002"
> -				"mcp3004"
> -				"mcp3008"
> -				"mcp3201"
> -				"mcp3202"
> -				"mcp3204"
> -				"mcp3208"
> -				"mcp3301"
> +				"mcp3001" (DEPRECATED)
> +				"mcp3002" (DEPRECATED)
> +				"mcp3004" (DEPRECATED)
> +				"mcp3008" (DEPRECATED)
> +				"mcp3201" (DEPRECATED)
> +				"mcp3202" (DEPRECATED)
> +				"mcp3204" (DEPRECATED)
> +				"mcp3208" (DEPRECATED)
> +				"mcp3301" (DEPRECATED)
>  
> +				"microchip,mcp3001"
> +				"microchip,mcp3002"
> +				"microchip,mcp3004"
> +				"microchip,mcp3008"
> +				"microchip,mcp3201"
> +				"microchip,mcp3202"
> +				"microchip,mcp3204"
> +				"microchip,mcp3208"
> +				"microchip,mcp3301"
> +
> +			NOTE: The use of the compatibles with no vendor prefix
> +			is deprecated and only listed because old DT use them.
>

Acked-by: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
  
>  Examples:
>  spi_controller {
> -- 
> 2.4.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
