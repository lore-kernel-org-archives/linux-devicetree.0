From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/fsl-dcu: update the panel dt binding document
Date: Tue, 28 Jun 2016 16:07:49 -0500
Message-ID: <20160628210748.GA10847@rob-hp-laptop>
References: <1467106748-19314-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467106748-19314-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 05:39:07PM +0800, Meng Yi wrote:
> dropped the old "fsl,panel" property, using the of_graph dt
> binding syntax
> 
> Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/fsl,dcu.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> index ae55cde..f44cf5b 100644
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> @@ -12,7 +12,7 @@ Required properties:
>  - clock-names:		Should be "dcu" and "pix"
>  			See ../clocks/clock-bindings.txt for details.
>  - big-endian		Boolean property, LS1021A DCU registers are big-endian.
> -- fsl,panel:		The phandle to panel node.
> +- port			Video port for the panel output
>  
>  Optional properties:
>  - fsl,tcon:		The phandle to the timing controller node.
> @@ -24,6 +24,11 @@ dcu: dcu@2ce0000 {
>  	clocks = <&platform_clk 0>, <&platform_clk 0>;
>  	clock-names = "dcu", "pix";
>  	big-endian;
> -	fsl,panel = <&panel>;
>  	fsl,tcon = <&tcon>;
> +
> +	port: port@0 {

Drop the unit address. With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +		dcu_out: endpoint {
> +			remote-endpoint = <&panel_out>;
> +		};
> +	};
>  };
> -- 
> 2.1.0.27.g96db324
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
