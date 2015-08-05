From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] mailbox: hisilicon: add mailbox driver
Date: Wed, 5 Aug 2015 16:22:01 +0530
Message-ID: <CABb+yY0-RQ80q92EBsuBoYpjxW5zR=nXr+j3zCXw3wKkCf33OQ@mail.gmail.com>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438564390-28111-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 3, 2015 at 6:43 AM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch series is to implement Hisilicon's mailbox driver and enable
> the mailbox controller on Hi6220.
>
Cool.

> The Hisilicon mailbox supports up to 32 channels. Each channel is
> unidirectional with a maximum message size of 8 words. I/O is performed
> using register access (there is no DMA) and the cell raises an interrupt
> when messages are received.
>
FYI, none of other platforms has mailbox with DMA. 8-word deep fifo,
RX interrupt
and optional TX interrupt is pretty common. So cool still.

> For easily extending for Hisilicon series SoCs (SoCs may have difference
> for register's definition with each other), so firstly implement common
> mailbox driver; this common mailbox driver provides three mainly
> functionality:
>
>  - help register channels into framework;
>  - hook low level callback functions for register's operations;
>  - Enhance rx channel's message queue, which is based on the code in
>    drivers/mailbox/omap-mailbox.c.
>
Not cool.
 Please don't reinvent the wheel by having platform specific
implementation of the mailbox api. Which vendor doesn't plan to roll
out new SoCs, and hence variations of mailbox controllers?  The OMAP
stack predates the common api, and was actually supposed to be
converted over eventually. Please implement just the
drivers/mailbox/hi6220-mailbox.c (preferably by the name of the
mailbox controller, if any)

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
