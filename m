From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] mailbox: Hisilicon: add mailbox driver
Date: Tue, 4 Aug 2015 17:56:26 +0800
Message-ID: <20150804095626.GC27609@leoy-linaro>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
 <1438564390-28111-3-git-send-email-leo.yan@linaro.org>
 <1438677024.8734.24.camel@tiscali.nl>
 <20150804084930.GA27609@leoy-linaro>
 <1438679859.8734.35.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438679859.8734.35.camel-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 04, 2015 at 11:17:39AM +0200, Paul Bolle wrote:
> On di, 2015-08-04 at 16:49 +0800, Leo Yan wrote:
> > On Tue, Aug 04, 2015 at 10:30:24AM +0200, Paul Bolle wrote:
> > > On ma, 2015-08-03 at 09:13 +0800, Leo Yan wrote:
> > > > --- /dev/null
> > > > +++ b/drivers/mailbox/hisilicon/Kconfig
> > > 
> > > > +config HISI_MBOX
> > > > +	bool "Hisilicon's Mailbox"
> > > > +	depends on ARCH_HISI || OF
> > > 
> > > ARCH_HISI is available on either ARM64 or ARM. ARM64 selects OF. On ARM
> > > ARCH_HISI depends on ARCH_MULTIV7 which depends on ARCH_MULTIPLATFORM.
> > > That selects USE_OF which on its turn selects OF.
> > > 
> > > So, HISI_MBOX implies OF, correct?
> > 
> > Exactly, will simply use "depends on ARCH_HISI".
> 
> That change would alter the dependencies. My remark was made just to
> make clear why I think CONFIG_OF will always be defined. But now I guess
> you actually meant
> 	depends on ARCH_HISI && OF

Correct, shame for my wrong logic :)

> And that would, I think, indeed be equivalent to
> 	depends on ARCH_HISI

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
