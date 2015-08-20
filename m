From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] mailbox: Hi6220: add mailbox driver
Date: Thu, 20 Aug 2015 21:44:38 +0800
Message-ID: <20150820134438.GA18629@leoy-linaro>
References: <1440039239-8772-1-git-send-email-leo.yan@linaro.org>
 <1440039239-8772-3-git-send-email-leo.yan@linaro.org>
 <55D568E2.9060505@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D568E2.9060505-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YiPing Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yiping,

Thanks for review, please see below comments.

On Thu, Aug 20, 2015 at 01:42:58PM +0800, YiPing Xu wrote:
> On 2015/8/20 10:53, Leo Yan wrote:
> >Add driver for Hi6220 mailbox, the mailbox communicates with MCU; for
> >sending data, it can support two methods for low level implementation:
> >one is to use interrupt as acknowledge, another is automatic mode which
> >without any acknowledge. These two methods have been supported in the
> >driver. For receiving data, it will depend on the interrupt to notify
> >the channel has incoming message; enhance rx channel's message queue,
> >which is based on the code in drivers/mailbox/omap-mailbox.c.
> >
> >Now mailbox driver is used to send message to MCU to control dynamic
> >voltage and frequency scaling for CPU, GPU and DDR.
> >
> >Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

[...]

> >+static int hi6220_mbox_send_data(struct mbox_chan *chan, void *msg)
> >+{
> >+	struct hi6220_mbox_chan *mchan = chan->con_priv;
> >+	struct hi6220_mbox *mbox = mchan->parent;
> >+	int irq = mchan->remote_irq;
> >+	u32 *buf = msg;
> >+	unsigned long flags;
> >+	int i;
> >+
> >+	hi6220_mbox_set_status(mchan, HI6220_MBOX_STATUS_TX);
> 
> 	hi6220_mbox_set_status is called in send_data context, and it is
> also called in hi6220_mbox_rx_interrupt and
> hi6220_mbox_tx_interrupt.
> 
> 	no race condition here?

Have thought this question yet when writing code; it will _NOT_
introduce race condition according to below implementation details:

- Every channel have its own slot, so there have no race condition
  between channels;
- The channel is unidirectional; so it will be only for tx or rx at
  the same time;
- The channel operation is sequential, so it have the sequence as:
  For tx: startup -> send_data -> tx_irq (for ack);
  For rx: startup -> rx_irq -> recv_data;

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
