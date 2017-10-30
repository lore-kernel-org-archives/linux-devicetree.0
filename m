From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] mailbox: Add support for Hi3660 mailbox
Date: Mon, 30 Oct 2017 10:19:40 +0000
Message-ID: <20171030101940.dtf6rw7alhkn6irf@lakrids.cambridge.arm.com>
References: <1509084904-2505-1-git-send-email-zhongkaihua@huawei.com>
 <1509084904-2505-3-git-send-email-zhongkaihua@huawei.com>
 <20171027104559.em5n5ogro46ethmq@salmiak>
 <20171030044506.GE31478@leoy-ThinkPad-T440>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171030044506.GE31478@leoy-ThinkPad-T440>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kaihua Zhong <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Oct 30, 2017 at 12:45:06PM +0800, Leo Yan wrote:
> On Fri, Oct 27, 2017 at 11:46:00AM +0100, Mark Rutland wrote:
> > On Fri, Oct 27, 2017 at 02:15:03PM +0800, Kaihua Zhong wrote:
> > > +static int hi3660_mbox_check_state(struct mbox_chan *chan)
> > > +{

> > > +	/* Ensure channel is released */
> > > +	writel_relaxed(0xffffffff, base + MBOX_IMASK_REG);
> > > +	writel_relaxed(BIT(mdev->ack_irq), base + MBOX_SRC_REG);
> > > +	__asm__ volatile ("sev");
> > > +	return 0;
> > > +}
> > 
> > Drivers really shouldn't be using SEV directly (even if via the
> > sev() macro)...
> > 
> > This SEV isn't ordered w.r.t. anything, and it's unclear what
> > ordering you need, so this simply does not work.
> 
> I will leave your questions for Hisilicon colleagues, essentially your
> questions are related with mailbox mechanism.
> 
> But I'd like to firstly get clear your question for "This SEV isn't
> ordered w.r.t. anything". From my understanding, ARMv8 architecture
> natually adds DMB before SEV so all previous register writing
> opreations should be ensured to endpoint before SEV?

This is not the case; SEV does not add any implicit memory barrier, and
is not ordered w.r.t. memory accesses.

See ARM DDI 0487B.b, page D1-1905, "The Send Event instructions":

    The PE is not required to guarantee the ordering of this event with
    respect to the completion of memory accesses by instructions before
    the SEV instruction. Therefore, ARM recommends that software
    includes a DSB instruction before any SEV instruction.

Note that a DMB is not sufficient, as SEV is not a memory access.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
