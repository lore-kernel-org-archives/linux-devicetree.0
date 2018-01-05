From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] mailbox: Add support for Hi3660 mailbox
Date: Fri, 5 Jan 2018 09:58:57 +0530
Message-ID: <CABb+yY2z4jDWJdDY2WRw5Mhv+ArTuvLgqJ9RyVoUJj3O1d=o6A@mail.gmail.com>
References: <1513682145-19892-1-git-send-email-zhongkaihua@huawei.com> <1513682145-19892-3-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513682145-19892-3-git-send-email-zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 4:45 PM, Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

.....
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
> new file mode 100644
> index 0000000..3ceca40
> --- /dev/null
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Hisilicon Limited.
> +// Copyright (c) 2017 Linaro Limited.

A blank here please.

> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>

.....
> +
> +static inline struct hi3660_mbox *to_hi3660_mbox(struct mbox_controller *mbox)
>
inline in .c is out of fasion these days
> +{
> +       return container_of(mbox, struct hi3660_mbox, controller);
> +}
> +

....
> +
> +static int hi3660_mbox_startup(struct mbox_chan *chan)
> +{
> +       int ret;
> +
> +       ret = hi3660_mbox_check_state(chan);
> +       if (ret)
> +               return ret;
> +
> +       ret = hi3660_mbox_unlock(chan);
> +       if (ret)
> +               return ret;
> +
> +       ret = hi3660_mbox_acquire_channel(chan);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
Do you not need to do "release channel" for shutdown() ?

.....
> +
> +static int hi3660_mbox_send_data(struct mbox_chan *chan, void *msg)
> +{
> +       return hi3660_mbox_send(chan, msg);
>
Please directly have hi3660_mbox_send as .send_data

Cheers!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
