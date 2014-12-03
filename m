From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 01/11] mfd: syscon: Add atmel-matrix registers definition
Date: Wed, 3 Dec 2014 16:57:51 +0100
Message-ID: <547F32FF.7000005@atmel.com>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <1417429647-3419-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417429647-3419-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 01/12/2014 11:27, Boris Brezillon a =E9crit :
> AT91 SoCs have a memory range reserved for internal bus configuration=
=2E
> Expose those registers so that drivers can make use of the matrix sys=
con
> declared in at91 DTs.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/mfd/syscon/atmel-matrix.h | 114 ++++++++++++++++++++++=
++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 include/linux/mfd/syscon/atmel-matrix.h
>=20
> diff --git a/include/linux/mfd/syscon/atmel-matrix.h b/include/linux/=
mfd/syscon/atmel-matrix.h
> new file mode 100644
> index 0000000..d0da495
> --- /dev/null
> +++ b/include/linux/mfd/syscon/atmel-matrix.h
> @@ -0,0 +1,114 @@
> +/*
> + *  Copyright (C) 2014 Atmel Corporation.
> + *
> + * Memory Controllers (MATRIX, EBI) - System peripherals registers.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef _LINUX_MFD_SYSCON_ATMEL_MATRIX_H
> +#define _LINUX_MFD_SYSCON_ATMEL_MATRIX_H
> +
> +#define AT91SAM9260_MATRIX_MCFG_OFF	0x00
> +#define AT91SAM9260_MATRIX_SCFG_OFF	0x40
> +#define AT91SAM9260_MATRIX_PRS_OFF	0x80
> +#define AT91SAM9260_MATRIX_MRCR_OFF	0x100
> +#define AT91SAM9260_MATRIX_EBICSA_OFF	0x11c
> +
> +#define AT91SAM9261_MATRIX_MRCR_OFF	0x0
> +#define AT91SAM9261_MATRIX_SCFG_OFF	0x4
> +#define AT91SAM9261_MATRIX_TCR_OFF	0x24
> +#define AT91SAM9261_MATRIX_EBICSA_OFF	0x30
> +#define AT91SAM9261_MATRIX_USBPUCR_OFF	0x34
> +
> +#define AT91SAM9263_MATRIX_MCFG_OFF	0x00
> +#define AT91SAM9263_MATRIX_SCFG_OFF	0x40
> +#define AT91SAM9263_MATRIX_PRS_OFF	0x80
> +#define AT91SAM9263_MATRIX_MRCR_OFF	0x100
> +#define AT91SAM9263_MATRIX_TCR_OFF	0x114
> +#define AT91SAM9263_MATRIX_EBI0CSA_OFF	0x120
> +#define AT91SAM9263_MATRIX_EBI1CSA_OFF	0x124
> +
> +#define AT91SAM9G45_MATRIX_MCFG_OFF	0x00
> +#define AT91SAM9G45_MATRIX_SCFG_OFF	0x40
> +#define AT91SAM9G45_MATRIX_PRS_OFF	0x80
> +#define AT91SAM9G45_MATRIX_MRCR_OFF	0x100
> +#define AT91SAM9G45_MATRIX_TCR_OFF	0x110
> +#define AT91SAM9G45_MATRIX_DDRMPR_OFF	0x118
> +#define AT91SAM9G45_MATRIX_EBICSA_OFF	0x128
> +
> +#define AT91SAM9N12_MATRIX_MCFG_OFF	0x00
> +#define AT91SAM9N12_MATRIX_SCFG_OFF	0x40
> +#define AT91SAM9N12_MATRIX_PRS_OFF	0x80
> +#define AT91SAM9N12_MATRIX_MRCR_OFF	0x100
> +#define AT91SAM9N12_MATRIX_EBICSA_OFF	0x118
> +
> +#define AT91SAM9X5_MATRIX_MCFG_OFF	0x00
> +#define AT91SAM9X5_MATRIX_SCFG_OFF	0x40
> +#define AT91SAM9X5_MATRIX_PRS_OFF	0x80
> +#define AT91SAM9X5_MATRIX_MRCR_OFF	0x100
> +#define AT91SAM9X5_MATRIX_EBICSA_OFF	0x120
> +
> +#define SAMA5D3_MATRIX_MCFG_OFF		0x00
> +#define SAMA5D3_MATRIX_SCFG_OFF		0x40
> +#define SAMA5D3_MATRIX_PRS_OFF		0x80
> +#define SAMA5D3_MATRIX_MRCR_OFF		0x100
> +
> +#define AT91_MATRIX_MCFG(o, x)		((o) + ((x) * 0x4))
> +#define AT91_MATRIX_ULBT		(7 << 0)
> +#define AT91_MATRIX_ULBT_INFINITE	(0 << 0)
> +#define AT91_MATRIX_ULBT_SINGLE		(1 << 0)
> +#define AT91_MATRIX_ULBT_FOUR		(2 << 0)
> +#define AT91_MATRIX_ULBT_EIGHT		(3 << 0)
> +#define AT91_MATRIX_ULBT_SIXTEEN	(4 << 0)
> +
> +#define AT91_MATRIX_SCFG(o, x)		((o) + ((x) * 0x4))
> +#define AT91_MATRIX_SLOT_CYCLE		(0xff <<  0)
> +#define AT91_MATRIX_DEFMSTR_TYPE	(3 << 16)
> +#define AT91_MATRIX_DEFMSTR_TYPE_NONE	(0 << 16)
> +#define AT91_MATRIX_DEFMSTR_TYPE_LAST	(1 << 16)
> +#define AT91_MATRIX_DEFMSTR_TYPE_FIXED	(2 << 16)
> +#define AT91_MATRIX_FIXED_DEFMSTR	(7 << 18)
> +#define AT91_MATRIX_ARBT		(3 << 24)
> +#define AT91_MATRIX_ARBT_ROUND_ROBIN	(0 << 24)
> +#define AT91_MATRIX_ARBT_FIXED_PRIORITY	(1 << 24)
> +
> +#define AT91_MATRIX_TCR(o)		(o)
> +#define AT91_MATRIX_ITCM_SIZE		(0xf << 0)
> +#define AT91_MATRIX_ITCM_0		(0 << 0)
> +#define AT91_MATRIX_ITCM_16		(5 << 0)
> +#define AT91_MATRIX_ITCM_32		(6 << 0)
> +#define AT91_MATRIX_ITCM_64		(7 << 0)
> +#define	AT91_MATRIX_DTCM_SIZE		(0xf << 4)
> +#define	AT91_MATRIX_DTCM_0		(0 << 4)
> +#define	AT91_MATRIX_DTCM_16		(5 << 4)
> +#define AT91_MATRIX_DTCM_32		(6 << 4)
> +#define AT91_MATRIX_DTCM_64		(7 << 4)
> +
> +#define AT91_MATRIX_PRAS(o, x)		((o) + ((x) * 0x8))
> +#define AT91_MATRIX_PRBS(o, x)		((o) + ((x) * 0x8) + 0x4)
> +#define AT91_MATRIX_MPR_MSK(x)		(3 << ((x) * 0x4))
> +
> +#define AT91_MATRIX_MRC(o)		(o)
> +#define AT91_MATRIX_RCB(x)		BIT(x)
> +
> +#define AT91_MATRIX_EBICSA(o)		(o)
> +#define AT91_MATRIX_CSA(cs, val)	(val << (cs))
> +#define AT91_MATRIX_DBPUC		BIT(8)
> +#define AT91_MATRIX_DBPDC		BIT(9)
> +#define AT91_MATRIX_VDDIOMSEL		BIT(16)
> +#define AT91_MATRIX_VDDIOMSEL_1_8V	(0 << 16)
> +#define AT91_MATRIX_VDDIOMSEL_3_3V	(1 << 16)
> +#define AT91_MATRIX_EBI_IOSR		BIT(17)
> +#define AT91_MATRIX_DDR_IOSR		BIT(18)
> +#define AT91_MATRIX_NFD0_SELECT		BIT(24)
> +#define AT91_MATRIX_DDR_MP_EN		BIT(25)
> +#define AT91_MATRIX_EBI_NUM_CS		8
> +
> +#define AT91_MATRIX_WPMR(o)		(o)
> +#define AT91_MATRIX_WPSR(o)		(o)
> +
> +#endif /* _LINUX_MFD_SYSCON_ATMEL_MATRIX_H */
>=20

General comment on the register descriptions of this series:
please be consistent:
1/ use BIT(x) marco *or* (1 << 16) not both
2/ use GENMASK(x,y) macro *or* (3 << 16) not both
3/ SAMA5D3_MATRIX_SCFG_OFF <=3D=3D what is the meaning of _OFF offset o=
f the
register? if it's not used in a macro (and a macro is not desirable),
please remove this suffix.
4/ same for the suffix _OFFSET in the SMC register definition file
5/ same for the _SHFT suffix in SMC register definition file
6/ what is the purpose of these macros? #defineAT91_MATRIX_WPMR(o) (o)

Thanks, bye.
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
