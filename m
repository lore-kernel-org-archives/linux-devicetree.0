From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] mailbox: hisilicon: add mailbox driver
Date: Mon, 10 Aug 2015 16:52:44 +0800
Message-ID: <20150810085244.GA13147@leoy-linaro>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
 <CABb+yY0-RQ80q92EBsuBoYpjxW5zR=nXr+j3zCXw3wKkCf33OQ@mail.gmail.com>
 <20150805231743.GB6880@leoy-linaro>
 <CABb+yY1HTGNi4gZABNhXjpA57DPZx-tv=6+m4JLyx4wPHfovyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY1HTGNi4gZABNhXjpA57DPZx-tv=6+m4JLyx4wPHfovyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On Mon, Aug 10, 2015 at 12:32:05PM +0530, Jassi Brar wrote:
> On Thu, Aug 6, 2015 at 4:47 AM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Jassi,
> >
> > Thanks for review.
> >
> > On Wed, Aug 05, 2015 at 04:22:01PM +0530, Jassi Brar wrote:
> >> On Mon, Aug 3, 2015 at 6:43 AM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> > [...]
> >
> >> > For easily extending for Hisilicon series SoCs (SoCs may have difference
> >> > for register's definition with each other), so firstly implement common
> >> > mailbox driver; this common mailbox driver provides three mainly
> >> > functionality:
> >> >
> >> >  - help register channels into framework;
> >> >  - hook low level callback functions for register's operations;
> >> >  - Enhance rx channel's message queue, which is based on the code in
> >> >    drivers/mailbox/omap-mailbox.c.
> >> >
> >> Not cool.
> >>  Please don't reinvent the wheel by having platform specific
> >> implementation of the mailbox api. Which vendor doesn't plan to roll
> >> out new SoCs, and hence variations of mailbox controllers?  The OMAP
> >> stack predates the common api, and was actually supposed to be
> >> converted over eventually. Please implement just the
> >> drivers/mailbox/hi6220-mailbox.c (preferably by the name of the
> >> mailbox controller, if any)
> >
> > Understood. Here i have one question, the rx channel's message queue is
> > looks like a common mechanism and can be added into framework file
> > mailbox.c, then Soc driver file can _ONLY_ focus on register level's
> > operations. If so, the common driver in this patch also is unnecessary.
> >
> Yes, that's what I say, no 'common' driver for a platform.
> 
> > Do you suggest to use upper method to rework patches? Or just think
> > it's okay to implement rx channel's message queue in hi6220-mailbox.c?
> >
> The code in drivers/mailbox/ should only manage the controller
> (registers and interrupts). Everything else (queues, shmem etc) should
> be in platform specific client driver(s).

Thanks for suggestion, will send new version patches for reviewing.

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
