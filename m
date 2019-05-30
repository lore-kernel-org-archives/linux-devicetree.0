From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 1/3] soc: mediatek: add SMC fid table for SIP interface
Date: Thu, 30 May 2019 15:50:35 -0700
Message-ID: <CAGp9LzpkhDhSHL=go3fvzn2Oh8DrsW8F=1YKP4ne9TDvWQVq6Q@mail.gmail.com>
References: <1558946326-13630-1-git-send-email-neal.liu@mediatek.com> <1558946326-13630-2-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558946326-13630-2-git-send-email-neal.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Neal,

On Mon, May 27, 2019 at 1:39 AM Neal Liu <neal.liu@mediatek.com> wrote:
>
> 1. Add a header file to provide SIP interface to ARM Trusted
> Firmware(ATF)
> 2. Add hwrng SMC fid
>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  include/linux/soc/mediatek/mtk_sip_svc.h |   51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h
>
> diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
> new file mode 100644
> index 0000000..f65d403
> --- /dev/null
> +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef _MTK_SECURE_API_H_
> +#define _MTK_SECURE_API_H_
> +
> +#include <linux/kernel.h>
> +
> +/* Error Code */
> +#define SIP_SVC_E_SUCCESS                      0
> +#define SIP_SVC_E_NOT_SUPPORTED                        -1
> +#define SIP_SVC_E_INVALID_PARAMS               -2
> +#define SIP_SVC_E_INVALID_RANGE                        -3
> +#define SIP_SVC_E_PERMISSION_DENY              -4
> +
> +#ifdef CONFIG_ARM64
> +#define MTK_SIP_SMC_AARCH_BIT                  0x40000000

#define MTK_SIP_SMC_AARCH_BIT                  BIT(30)

> +#else
> +#define MTK_SIP_SMC_AARCH_BIT                  0x00000000

#define MTK_SIP_SMC_AARCH_BIT                  0

> +#endif
> +
> +/*******************************************************************************
> + * Defines for Mediatek runtime services func ids
> + ******************************************************************************/

It would be good if remove the trivial and below all unused comments.

> +
> +/* Debug feature and ATF related SMC call */
> +
> +/* CPU operations related SMC call */
> +
> +/* SPM related SMC call */
> +
> +/* Low power related SMC call */
> +
> +/* AMMS related SMC call */
> +
> +/* Security related SMC call */
> +/* HWRNG */
> +#define MTK_SIP_KERNEL_GET_RND \
> +       (0x82000206 | MTK_SIP_SMC_AARCH_BIT)
> +
> +/* Storage Encryption related SMC call */
> +
> +/* Platform related SMC call */
> +
> +/* Pheripheral related SMC call */
> +
> +/* MM related SMC call */
> +
> +#endif /* _MTK_SECURE_API_H_ */
> --
> 1.7.9.5
>
