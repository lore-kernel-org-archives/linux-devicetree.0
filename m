From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/15] serial: 8250_ingenic: Add support for the JZ4770
 SoC
Date: Fri, 9 Jun 2017 09:22:43 -0500
Message-ID: <20170609142243.wbt6gngfl3pmdnzr@rob-hp-laptop>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170607200439.24450-6-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 07, 2017 at 10:04:29PM +0200, Paul Cercueil wrote:
> The JZ4770 SoC's UART is no different from the other JZ SoCs, so this
> commit simply adds the ingenic,jz4770-uart compatible string.
> 
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/serial/ingenic,uart.txt | 3 ++-
>  drivers/tty/serial/8250/8250_ingenic.c                    | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> index 02cb7fe59cb7..75fd8b314af9 100644
> --- a/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> +++ b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> @@ -2,7 +2,8 @@
>  
>  Required properties:
>  - compatible : "ingenic,jz4740-uart", "ingenic,jz4760-uart",
> -	"ingenic,jz4775-uart" or "ingenic,jz4780-uart"
> +	"ingenic,jz4770-uart", "ingenic,jz4775-uart" or
> +	"ingenic,jz4780-uart"

If you respin, please reformat to 1 per line.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
