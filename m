From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 07/10] dt-bindings: thermal: Update bindings for LS1012A
Date: Fri, 26 Aug 2016 17:37:50 -0500
Message-ID: <1472251070.13245.10.camel@buserror.net>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
         <1472207269-18499-7-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472207269-18499-7-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-08-26 at 15:57 +0530, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/thermal/qoriq-thermal.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> index 66223d5..8e2b211 100644
> --- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> @@ -1,7 +1,7 @@
>  * Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
>  
>  Required properties:
> -- compatible : Must include "fsl,qoriq-tmu". The version of the device is
> +- compatible :"fsl,qoriq-tmu", "fsl,ls1012a-tmu". The version of the device
> is
>  	determined by the TMU IP Block Revision Register (IPBRR0) at
>  	offset 0x0BF8.
>  	Table of correspondences between IPBRR0 values and example  chips:

Why is this needed given that the block has a version register?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
