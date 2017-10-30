From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] mailbox: Add support for Hi3660 mailbox
Date: Mon, 30 Oct 2017 12:45:06 +0800
Message-ID: <20171030044506.GE31478@leoy-ThinkPad-T440>
References: <1509084904-2505-1-git-send-email-zhongkaihua@huawei.com>
 <1509084904-2505-3-git-send-email-zhongkaihua@huawei.com>
 <20171027104559.em5n5ogro46ethmq@salmiak>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171027104559.em5n5ogro46ethmq@salmiak>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, Oct 27, 2017 at 11:46:00AM +0100, Mark Rutland wrote:
> On Fri, Oct 27, 2017 at 02:15:03PM +0800, Kaihua Zhong wrote:
> > Hi3660 mailbox controller is used to send message within multiple
> > processors, MCU, HIFI, etc.  It supports 32 mailbox channels and every
> > channel can only be used for single transferring direction.  Once the
> > channel is enabled, it needs to specify the destination interrupt and
> > acknowledge interrupt, these two interrupt vectors are used to create
> > the connection between the mailbox and interrupt controllers.
> > 
> > The application processor (or from point of view of kernel) is not the
> > only one master which can launch the data transferring, other
> > processors or MCU/DSP also can kick off the data transferring.  So this
> > driver implements a locking mechanism to support exclusive accessing.
> 
> ... and that locking mechanism is what precisely?
> 
> Where is the protocol defined?
> 
> > +static int hi3660_mbox_check_state(struct mbox_chan *chan)
> > +{
> > +	unsigned long ch = (unsigned long)chan->con_priv;
> > +	struct hi3660_mbox *mbox = to_hi3660_mbox(chan);
> > +	struct hi3660_mbox_dev *mdev = &mbox->mdev[ch];
> > +	void __iomem *base = MBOX_BASE(mbox, ch);
> > +	unsigned long val;
> > +	unsigned int state, ret;
> > +
> > +	/* Mailbox is idle so directly bail out */
> > +	state = readl_relaxed(base + MBOX_MODE_REG);
> > +	if (state & MBOX_STATE_IDLE)
> > +		return 0;
> > +
> > +	/* Wait for acknowledge from remote */
> > +	ret = readx_poll_timeout_atomic(readl_relaxed, base + MBOX_MODE_REG,
> > +			val, (val & MBOX_STATE_ACK), 1000, 300000);
> > +	if (ret) {
> > +		dev_err(mbox->dev, "%s: timeout for receiving ack\n", __func__);
> > +		return ret;
> > +	}
> > +
> > +	/* Ensure channel is released */
> > +	writel_relaxed(0xffffffff, base + MBOX_IMASK_REG);
> > +	writel_relaxed(BIT(mdev->ack_irq), base + MBOX_SRC_REG);
> > +	__asm__ volatile ("sev");
> > +	return 0;
> > +}
> 
> Drivers really shouldn't be using SEV directly (even if via the sev() macro)...
> 
> This SEV isn't ordered w.r.t. anything, and it's unclear what ordering you
> need, so this simply does not work.

I will leave your questions for Hisilicon colleagues, essentially
your questions are related with mailbox mechanism.

But I'd like to firstly get clear your question for "This SEV isn't
ordered w.r.t. anything". From my understanding, ARMv8 architecture
natually adds DMB before SEV so all previous register writing
opreations should be ensured to endpoint before SEV?

[...]

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
