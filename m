From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH linux-next v9 1/3] mfd: atmel-flexcom: create include file
 with macros used by DT bindings
Date: Tue, 8 Sep 2015 18:33:19 -0500
Message-ID: <55EF703F.2030806@kernel.org>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <69844d8092ccbcaef6a3a24d39127ca432462d69.1441118159.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69844d8092ccbcaef6a3a24d39127ca432462d69.1441118159.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/01/2015 09:46 AM, Cyrille Pitchen wrote:
> This patch defines some macros to be used as value for the
> "atmel,flexcom-mode" DT property. This value is then written into
> the Operating Mode (OPMODE) bit field of the Flexcom Mode Register.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

In the future, you can combine headers with the binding doc as they are
part of the binding.

Rob

> ---
>  include/dt-bindings/mfd/atmel-flexcom.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h
> 
> diff --git a/include/dt-bindings/mfd/atmel-flexcom.h b/include/dt-bindings/mfd/atmel-flexcom.h
> new file mode 100644
> index 000000000000..6728f2851b4d
> --- /dev/null
> +++ b/include/dt-bindings/mfd/atmel-flexcom.h
> @@ -0,0 +1,16 @@
> +/*
> + * This header provides macros for Atmel Flexcom DT bindings.
> + *
> + * Copyright (C) 2015 Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * GPLv2 only
> + */
> +
> +#ifndef __DT_BINDINGS_ATMEL_FLEXCOM_H__
> +#define __DT_BINDINGS_ATMEL_FLEXCOM_H__
> +
> +#define ATMEL_FLEXCOM_MODE_USART	1
> +#define ATMEL_FLEXCOM_MODE_SPI		2
> +#define ATMEL_FLEXCOM_MODE_TWI		3
> +
> +#endif /* __DT_BINDINGS_ATMEL_FLEXCOM_H__ */
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
