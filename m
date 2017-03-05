From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v6 2/3] watchdog: renesas-wdt: add support for rza
Date: Sun, 5 Mar 2017 08:04:33 -0800
Message-ID: <03a34493-f3e4-a48b-3305-09f6f386eb11@roeck-us.net>
References: <20170304223737.20419-1-chris.brandt@renesas.com>
 <20170304223737.20419-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304223737.20419-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/04/2017 02:37 PM, Chris Brandt wrote:
> Describe the WDT hardware in the RZ/A series.
>
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
> v3:
> * Add Acked-by, Reviewed-by.
> v2:
> * added to renesas-wdt.txt instead of creating a new file
> * changed commit title
> * added "renesas,rza-wdt" as a fallback
> * added interrupts property
> ---
>  Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> index da24e31..9e306af 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> @@ -2,10 +2,11 @@ Renesas Watchdog Timer (WDT) Controller
>
>  Required properties:
>  - compatible : Should be "renesas,<soctype>-wdt", and
> -	       "renesas,rcar-gen3-wdt" as fallback.
> +	       "renesas,rcar-gen3-wdt" or "renesas,rza-wdt" as fallback.
>  	       Examples with soctypes are:
>  	         - "renesas,r8a7795-wdt" (R-Car H3)
>  	         - "renesas,r8a7796-wdt" (R-Car M3-W)
> +	         - "renesas,r7s72100-wdt" (RZ/A1)
>
>    When compatible with the generic version, nodes must list the SoC-specific
>    version corresponding to the platform first, followed by the generic
> @@ -17,6 +18,7 @@ Required properties:
>  Optional properties:
>  - timeout-sec : Contains the watchdog timeout in seconds
>  - power-domains : the power domain the WDT belongs to
> +- interrupts: Some WDTs have an interrupt when used in interval timer mode
>
>  Examples:
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
