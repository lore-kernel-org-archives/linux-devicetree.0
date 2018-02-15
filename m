From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 3/8] dt-bindings: display: renesas,lvds: Add LVDS binding for D3
Date: Thu, 15 Feb 2018 16:02:49 +0200
Message-ID: <2442341.aT5bf8aohc@avalon>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org> <1518683903-10681-4-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518683903-10681-4-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, geert-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "open list:DRM DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thursday, 15 February 2018 10:38:18 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> The D3 supports two LVDS channels. Extend the binding to support them.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt index
> 79860f58a7ad..0dcf488b70df 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -14,6 +14,7 @@ Required properties:
>  - compatible : Shall contain one of
>    - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS encoders
>    - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> encoders
> +  - "renesas,lvds-r8a77995" for R8A77995 (R-Car D3) compatible
> LVDS encoders

This should be "renesas,r8a77995-lvds". I've already fixed the series you've 
based this patch on.

Apart from this,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

and taken in my tree with the compatible string fixed.

> 
>  - reg: Base address and length for the memory-mapped registers
>  - clocks: A phandle + clock-specifier pair for the functional clock


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
