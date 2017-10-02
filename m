From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: fsl-imx-drm: Remove incorrect "@di0" usage
Date: Mon, 02 Oct 2017 14:27:33 +0200
Message-ID: <1506947253.9752.3.camel@pengutronix.de>
References: <1506103553-31366-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506103553-31366-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Fri, 2017-09-22 at 15:05 -0300, Marco Franchi wrote:
> Improve the binding example by removing the '@di0' notation, which
> fixes the following build warning:
> 
> Warning (unit_address_vs_reg): Node /display@di0 has a unit name, but 
> no reg property
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-
> drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-
> drm.txt
> index f798547..44814f0 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> +++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> @@ -129,7 +129,7 @@ Optional properties:
>  
>  example:
>  
> -display@di0 {
> +display-di0 {
>  	compatible = "fsl,imx-parallel-display";
>  	edid = [edid-data];
>  	interface-pix-fmt = "rgb24";

Thank you for the patch. We certainly should get rid of the @di0
notation. Since these nodes mostly describe the DISP0 and DISP1 pin
groups controlled by the IOMUXC, I'd prefer to rename this to

-display@di0 {
+disp0 {

instead, if that is fine with you.

I'd also like to move the disp0/disp1 nodes into the SoC dtsi files to
avoid having to duplicate port@0 all over the place.

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
