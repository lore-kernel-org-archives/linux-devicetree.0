From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/85xx: Add binding for SCFG
Date: Tue, 7 Jul 2015 14:50:20 -0500
Message-ID: <1436298620.2658.41.camel@freescale.com>
References: <1436262437-31390-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436262437-31390-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-07-07 at 17:47 +0800, Dongsheng Wang wrote:
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> SCFG provides SoC specific configuration and status registers for
> the chip. Add this for powerpc platform.
> 
> Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt 
> b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> index cff38bd..55604fe 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> @@ -3,6 +3,25 @@ Freescale Reference Board Bindings
>  This document describes device tree bindings for various devices that
>  exist on some Freescale reference boards.
>  
> +* Supplement configuration unit (SCFG)
> +
> +SCFG is the supplemental configuration unit, that provides SoC specific
> +configuration and status registers for the chip. Such as getting PEX port
> +status.
> +
> +Required properties:
> +
> +- compatible: should be "fsl,<board>-scfg"

fsl,<chip>-scfg

> +- reg: should contain base address and length of SCFG memory-mapped
> +registers
> +
> +Example:
> +
> +     scfg:  global-utilities@fc000{
> +             compatible = "fsl,t1040-scfg";
> +             reg = <0xfc000 0x1000>;
> +     };
> +

I don't think board.txt is the right place for this, since it's part of the 
SoC, not the board.  Put it in its own file.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
