From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3] powerpc/fsl: Added binding for Freescale CoreNet
 coherency fabric (CCF)
Date: Mon, 5 May 2014 14:31:02 -0500
Message-ID: <1399318262.15726.98.camel@snotra.buserror.net>
References: <1399305499-6612-1-git-send-email-diana.craciun@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399305499-6612-1-git-send-email-diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-05-05 at 18:58 +0300, Diana Craciun wrote:
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
> index 922c30a..09dbc5f 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpus.txt
> @@ -20,3 +20,11 @@ PROPERTIES
>  	a property named fsl,eref-[CAT], where [CAT] is the abbreviated category
>  	name with all uppercase letters converted to lowercase, indicates that
>  	the category is supported by the implementation.
> +
> +	- fsl,portid-mapping : <u32>
> +	The Coherency Subdomain ID Port Mapping Registers and Snoop ID Port Mapping
> +	registers which are part of the CoreNet Coherency fabric (CCF) provide a
> +	CoreNet Coherency Subdomain ID/CoreNet Snoop ID to cpu mapping functions.
> +	Certain bits from these registers should be set if the coresponding CPU
> +	should be snooped. This property defines a bitmask which selects the bit that
> +	should be set if this cpu should be snooped.

Please follow existing formatting in this file.

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt b/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
> index 1f5e329..827c637 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/pamu.txt
> @@ -26,6 +26,13 @@ Required properties:
>  		  A standard property.
>  - #size-cells	: <u32>
>  		  A standard property.
> +- fsl,portid-mapping : <u32>
> +	The Coherency Subdomain ID Port Mapping Registers and Snoop ID Port Mapping
> +	registers which are part of the CoreNet Coherency fabric (CCF) provide a
> +	CoreNet Coherency Subdomain ID/CoreNet Snoop ID to pamu mapping functions.
> +	Certain bits from these registers should be set if PAMUs should be snooped.
> +	This property defines a bitmask which selects the bits that should be set
> +	if PAMUs should be snooped.

This can't be a required property since existing trees don't have it --
in addition to allowing for the possibility of a PAMU where the snoop ID
is not known or where the snoop domain mechanism does not exist.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
