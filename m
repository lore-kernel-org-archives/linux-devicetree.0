From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 03/11] mfd: syscon: Add atmel-smc registers definition
Date: Mon, 10 Nov 2014 09:57:28 +0000
Message-ID: <20141110095728.GJ21424@x1>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
 <1415203287-21517-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415203287-21517-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 05 Nov 2014, Boris Brezillon wrote:

> Atmel AT91 SoCs have a memory range reserved for SMC (Static Memory
> Controller) configuration.
> Expose those registers so that drivers can make use of the smc syscon
> declared in at91 DTs.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/linux/mfd/syscon/atmel-smc.h | 60 ++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 include/linux/mfd/syscon/atmel-smc.h

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Any idea who will take this set?

> diff --git a/include/linux/mfd/syscon/atmel-smc.h b/include/linux/mfd=
/syscon/atmel-smc.h
> new file mode 100644
> index 0000000..430f486
> --- /dev/null
> +++ b/include/linux/mfd/syscon/atmel-smc.h
> @@ -0,0 +1,60 @@
> +/*
> + * Atmel SMC (Static Memory Controller) register offsets and bit def=
initions.
> + *
> + * Copyright (C) 2014 Atmel
> + * Copyright (C) 2014 Free Electrons
> + *
> + * Author: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef _LINUX_MFD_SYSCON_ATMEL_SMC_H_
> +#define _LINUX_MFD_SYSCON_ATMEL_SMC_H_
> +
> +#include <linux/regmap.h>
> +
> +#define AT91SAM9_SMC_GENERIC_OFFSET	0x00
> +#define AT91SAM9_SMC_GENERIC_BLK_SZ	0x10
> +
> +#define SAMA5_SMC_GENERIC_OFFSET	0x600
> +#define SAMA5_SMC_GENERIC_BLK_SZ	0x14
> +
> +#define AT91SAM9_SMC_SETUP(o)		((o) + 0x00)
> +#define AT91SAM9_SMC_NWESETUP_SHFT	0
> +#define AT91SAM9_SMC_NCS_WRSETUP_SHFT	8
> +#define AT91SAM9_SMC_NRDSETUP_SHFT	16
> +#define AT91SAM9_SMC_NCS_NRDSETUP_SHFT	24
> +
> +#define AT91SAM9_SMC_PULSE(o)		((o) + 0x04)
> +
> +#define AT91SAM9_SMC_CYCLE(o)		((o) + 0x08)
> +
> +#define AT91SAM9_SMC_MODE(o)		((o) + 0x0c)
> +#define SAMA5_SMC_MODE(o)		((o) + 0x10)
> +#define AT91_SMC_READMODE		BIT(0)
> +#define AT91_SMC_WRITEMODE		BIT(1)
> +#define AT91_SMC_EXNWMODE		GENMASK(5, 4)
> +#define AT91_SMC_EXNWMODE_DISABLE	(0 << 4)
> +#define AT91_SMC_EXNWMODE_FROZEN	(2 << 4)
> +#define AT91_SMC_EXNWMODE_READY		(3 << 4)
> +#define AT91_SMC_BAT			BIT(8)
> +#define AT91_SMC_BAT_SELECT		(0 << 8)
> +#define AT91_SMC_BAT_WRITE		(1 << 8)
> +#define AT91_SMC_DBW			GENMASK(13, 12)
> +#define AT91_SMC_DBW_8			(0 << 12)
> +#define AT91_SMC_DBW_16			(1 << 12)
> +#define AT91_SMC_DBW_32			(2 << 12)
> +#define AT91_SMC_TDF			GENMASK(19, 16)
> +#define AT91_SMC_TDF_(x)		(((x) & 0xf) << 16)
> +#define AT91_SMC_TDFMODE		BIT(20)
> +#define AT91_SMC_PMEN			BIT(24)
> +#define AT91_SMC_PS			GENMASK(29, 28)
> +#define AT91_SMC_PS_4			(0 << 28)
> +#define AT91_SMC_PS_8			(1 << 28)
> +#define AT91_SMC_PS_16			(2 << 28)
> +#define AT91_SMC_PS_32			(3 << 28)
> +
> +#endif /* _LINUX_MFD_SYSCON_ATMEL_SMC_H_ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
