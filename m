From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: panel: Fix compatible string for
 Toshiba LT089AC29000
Date: Mon, 18 Dec 2017 12:53:43 +0100
Message-ID: <1513598023.2890.0.camel@pengutronix.de>
References: <20171217023433.11542-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171217023433.11542-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, den 17.12.2017, 03:34 +0100 schrieb Jonathan Neuschäfer:
> The compatible string for this panel was specified as
> toshiba,lt089ac29000.txt. I believe this is a mistake.
> 
> Fixes: 06e733e41f87 ("drm/panel: simple: add Toshiba LT089AC19000")
> > Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>

Yes, this is an obvious copy-and-paste issue. 

Acked-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
>  .../devicetree/bindings/display/panel/toshiba,lt089ac29000.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> index 4c0caaf246c9..89826116628c 100644
> --- a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> +++ b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> @@ -1,7 +1,7 @@
>  Toshiba 8.9" WXGA (1280x768) TFT LCD panel
>  
>  Required properties:
> -- compatible: should be "toshiba,lt089ac29000.txt"
> +- compatible: should be "toshiba,lt089ac29000"
>  - power-supply: as specified in the base binding
>  
>  This binding is compatible with the simple-panel binding, which is specified
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
