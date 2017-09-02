From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] driver: mailbox: add support for Hi3660
Date: Sat, 2 Sep 2017 13:07:50 +0530
Message-ID: <CABb+yY1gbA8tXz4u_7s6=jo7s0HTEWcisXxKe_yhdZR2tPPEUw@mail.gmail.com>
References: <1502097434-11136-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502097434-11136-1-git-send-email-zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, wangruyi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jason.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xupeng7-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 2:47 PM, Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> From: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>
> Add mailbox driver for Hi3660.
>
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Ruyi Wang <wangruyi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Tested-by: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>
> ---
>  drivers/mailbox/Kconfig          |   6 +
>  drivers/mailbox/Makefile         |   2 +
>  drivers/mailbox/hi3660-mailbox.c | 688 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 696 insertions(+)
>  create mode 100644 drivers/mailbox/hi3660-mailbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ee1a3d9..778ba85 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -116,6 +116,12 @@ config HI6220_MBOX
>           between application processors and MCU. Say Y here if you want to
>           build Hi6220 mailbox controller driver.
>
> +config HI3660_MBOX
> +       tristate "Hi3660 Mailbox"
> +       depends on ARCH_HISI
> +       help
> +         Mailbox implementation for Hi3660.
> +
>  config MAILBOX_TEST
>         tristate "Mailbox Test Client"
>         depends on OF
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index e2bcb03..f1c2fc4 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -28,6 +28,8 @@ obj-$(CONFIG_XGENE_SLIMPRO_MBOX) += mailbox-xgene-slimpro.o
>
>  obj-$(CONFIG_HI6220_MBOX)      += hi6220-mailbox.o
>
> +obj-$(CONFIG_HI3660_MBOX)      += hi3660-mailbox.o
> +
>  obj-$(CONFIG_BCM_PDC_MBOX)     += bcm-pdc-mailbox.o
>
>  obj-$(CONFIG_BCM_FLEXRM_MBOX)  += bcm-flexrm-mailbox.o
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
> new file mode 100644
> index 0000000..14f469d
> --- /dev/null
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -0,0 +1,688 @@
> +/*
> + * Hisilicon's Hi3660 mailbox driver
> + *
> + * Copyright (c) 2017 Hisilicon Limited.
> + * Copyright (c) 2017 Linaro Limited.
> + *
> + * Author: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kfifo.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +
> +#include "mailbox.h"
> +
> +#define MBOX_CHAN_MAX                  32
> +
> +#define MBOX_TX                                0x1
> +
> +/* Mailbox message length: 2 words */
> +#define MBOX_MSG_LEN                   2
> +
> +#define MBOX_OFF(m)                    (0x40 * (m))
> +#define MBOX_SRC_REG(m)                        MBOX_OFF(m)
> +#define MBOX_DST_REG(m)                        (MBOX_OFF(m) + 0x04)
> +#define MBOX_DCLR_REG(m)               (MBOX_OFF(m) + 0x08)
> +#define MBOX_DSTAT_REG(m)              (MBOX_OFF(m) + 0x0C)
> +#define MBOX_MODE_REG(m)               (MBOX_OFF(m) + 0x10)
> +#define MBOX_IMASK_REG(m)              (MBOX_OFF(m) + 0x14)
> +#define MBOX_ICLR_REG(m)               (MBOX_OFF(m) + 0x18)
> +#define MBOX_SEND_REG(m)               (MBOX_OFF(m) + 0x1C)
> +#define MBOX_DATA_REG(m, i)            (MBOX_OFF(m) + 0x20 + ((i) << 2))
> +
> +#define MBOX_CPU_IMASK(cpu)            (((cpu) << 3) + 0x800)
> +#define MBOX_CPU_IRST(cpu)             (((cpu) << 3) + 0x804)
> +#define MBOX_IPC_LOCK                  (0xA00)
> +
How is this controller different than the PL320?

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
