From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] soc: mediatek: Add USB wakeup driver
Date: Fri, 15 Dec 2017 14:55:50 -0600
Message-ID: <20171215205550.dkiymkok6arheidg@rob-hp-laptop>
References: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
 <1512809136-2779-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512809136-2779-2-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 09, 2017 at 04:45:30PM +0800, Chunfeng Yun wrote:
> This driver is used to support usb wakeup which is controlled by
> the glue layer between SSUSB and SPM. Usually the glue layer is put
> into a system controller, such as pericfg module, which is
> represented by a syscon node in DTS.
> Due to the glue layer may vary on different SoCs, it's useful to
> extract a separated driver to simplify usb controller drivers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/soc/mediatek/Kconfig                  |   8 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/mtk-usb-wakeup.c         | 519 ++++++++++++++++++++++++++
>  include/dt-bindings/soc/mediatek,usb-wakeup.h |  15 +

This belongs in the binding patch and that should come first.

>  include/linux/soc/mediatek/usb-wakeup.h       |  88 +++++
>  5 files changed, 631 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-usb-wakeup.c
>  create mode 100644 include/dt-bindings/soc/mediatek,usb-wakeup.h
>  create mode 100644 include/linux/soc/mediatek/usb-wakeup.h

> +++ b/drivers/soc/mediatek/mtk-usb-wakeup.c
> @@ -0,0 +1,519 @@
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0

This should be the first line of the file and use a // style comment.

[...]

> diff --git a/include/dt-bindings/soc/mediatek,usb-wakeup.h b/include/dt-bindings/soc/mediatek,usb-wakeup.h
> new file mode 100644
> index 0000000..2461795
> --- /dev/null
> +++ b/include/dt-bindings/soc/mediatek,usb-wakeup.h
> @@ -0,0 +1,15 @@
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0

ditto. Except headers use /* */ comments...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
