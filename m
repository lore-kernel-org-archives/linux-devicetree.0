From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Documentation: devicetree: spi: fix wrong spi-bus
 documentation
Date: Wed, 3 Aug 2016 15:23:43 +0100
Message-ID: <20160803142343.GA20929@leverpostej>
References: <20160803141154.3811-1-info@gunibert.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160803141154.3811-1-info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenther Wutz <info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 04:11:54PM +0200, Guenther Wutz wrote:
> This patch adds missing commas to the spi-bus documentation of the
> cs-gpio lines.
> 
> The device tree compiler fails if chip select lines are not
> comma-separated. Fix the erroneous documentation by adding missing
> commas.
> 
> Signed-off-by: Guenther Wutz <info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>

I checked the surrounding context, and this looks correct to me:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

I assume Rob will pick this up.

Mark.

> ---
>  Documentation/devicetree/bindings/spi/spi-bus.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
> index 42d5954..3f636f9 100644
> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
> @@ -31,7 +31,7 @@ with max(cs-gpios > hw cs)
>  So if for example the controller has 2 CS lines, and the cs-gpios
>  property looks like this:
>  
> -cs-gpios = <&gpio1 0 0> <0> <&gpio1 1 0> <&gpio1 2 0>;
> +cs-gpios = <&gpio1 0 0>, <0>, <&gpio1 1 0>, <&gpio1 2 0>;
>  
>  Then it should be configured so that num_chipselect = 4 with the
>  following mapping:
> -- 
> 2.9.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
