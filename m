From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] clk: mediatek: Add initial common clock support
 for Mediatek SoCs.
Date: Tue, 20 Jan 2015 13:39:03 +0100
Message-ID: <CABuKBeLFvP4ChnzzUJwoLtCHtH6PejENJueBd7D+xMJhBMDBkg@mail.gmail.com>
References: <1420601123-25859-1-git-send-email-jamesjj.liao@mediatek.com>
	<1420601123-25859-3-git-send-email-jamesjj.liao@mediatek.com>
	<CABuKBeLQkTBYWkBWAYXjYudMAza+1zueRSqGFPd+480p1rYNwg@mail.gmail.com>
	<1420685701.27952.44.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420685701.27952.44.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-01-08 3:55 GMT+01:00 James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> Hi Matthias,
>
> On Wed, 2015-01-07 at 18:22 +0100, Matthias Brugger wrote:
>> 2015-01-07 4:25 GMT+01:00 James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
[...]
>> > +
>> > +extern spinlock_t *get_mtk_clk_lock(void);
>> > +
>> > +#define mtk_clk_lock(flags)    spin_lock_irqsave(get_mtk_clk_lock(), flags)
>> > +#define mtk_clk_unlock(flags)  \
>> > +       spin_unlock_irqrestore(get_mtk_clk_lock(), flags)
>>
>> Please use the spinlock directly without this akward defines.
>
> Do you mean we should export clk_ops_lock (from clk-mtk.c) directly
> instead of get_mtk_clk_lock()? Or simply remove mtk_clk_lock/unlock()?
>

I think you should use spin_lock_irqsave(&clk_ops_lock, flags) instead
of mtk_clk_lock.
In any case I think you should define a spinlock in clk-mt8135.c and
pass a reference of it in the init functions.
See drivers/clk/berlin as a good example.

Thanks,
Matthias

-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
