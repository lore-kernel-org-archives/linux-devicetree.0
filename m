From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 09/10] dt-bindings: Update bindings with additional
 vendor for LS1012A
Date: Fri, 26 Aug 2016 17:42:00 -0500
Message-ID: <1472251320.13245.14.camel@buserror.net>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
         <1472207269-18499-9-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472207269-18499-9-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-08-26 at 15:57 +0530, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index a7440bc..e9f923d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -85,6 +85,7 @@ elan	Elan Microelectronic Corp.
>  embest	Shenzhen Embest Technology Co., Ltd.
>  emmicro	EM Microelectronic
>  energymicro	Silicon Laboratories (formerly Energy Micro AS)
> +eon	Eon Silicon Solution, Inc.
>  epcos	EPCOS AG
>  epfl	Ecole Polytechnique Fédérale de Lausanne
>  epson	Seiko Epson Corp.
> @@ -246,6 +247,7 @@ solomon        Solomon Systech Limited
>  sony	Sony Corporation
>  spansion	Spansion Inc.
>  sprd	Spreadtrum Communications Inc.
> +sst	Silicon Storage Technology, Inc.
>  st	STMicroelectronics
>  startek	Startek
>  ste	ST-Ericsson

What does LS1012A have to do with these vendors?  At most your motivation
might be that these chips are on a board that happens to also have an LS1012A
on it, but that doesn't make it an appropriate patch description.  Better
would be something like "dt-bindings: Add eon and sst vendor strings" with the
changelog body mentioning that you're documenting prefixes that are already in
use.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
