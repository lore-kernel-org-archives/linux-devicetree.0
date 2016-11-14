From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] devicetree: bindings: nvmem: Add compatible string
 for imx6ul
Date: Mon, 14 Nov 2016 10:14:23 -0600
Message-ID: <20161114161423.fs7dlt5firmj4q3s@rob-hp-laptop>
References: <1478497281-5477-1-git-send-email-ping.bai@nxp.com>
 <1478497281-5477-2-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478497281-5477-2-git-send-email-ping.bai-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 07, 2016 at 01:41:20PM +0800, Bai Ping wrote:
> Add new compatible string for i.MX6UL SOC.
> 
> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 383d588..a7ff65d 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -1,13 +1,14 @@
>  Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
>  
>  This binding represents the on-chip eFuse OTP controller found on
> -i.MX6Q/D, i.MX6DL/S, i.MX6SL, and i.MX6SX SoCs.
> +i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX and i.MX6UL SoCs.
>  
>  Required properties:
>  - compatible: should be one of
>  	"fsl,imx6q-ocotp" (i.MX6Q/D/DL/S),
> -	"fsl,imx6sl-ocotp" (i.MX6SL), or
> -	"fsl,imx6sx-ocotp" (i.MX6SX), followed by "syscon".
> +	"fsl,imx6sl-ocotp" (i.MX6SL),
> +	"fsl,imx6sx-ocotp" (i.MX6SX), or
> +	"fsl,imx6ul-ocotp" (i.MX6UL), followed by "syscon".

This should be reformatted such that it's not a 5 line change to add a 
compatible. "one of" defines this is an OR relationship, so drop that. 
Move 'followed by "syscon"' to below the list of compatibles.

>  - reg: Should contain the register base and length.
>  - clocks: Should contain a phandle pointing to the gated peripheral clock.
>  
> -- 
> 2.8.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
