From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 1/4] irqchip: gic: Support hierarchy irq domain.
Date: Tue, 02 Dec 2014 13:37:59 +0000
Message-ID: <547DC0B7.6050600@arm.com>
References: <1416902662-19281-1-git-send-email-yingjoe.chen@mediatek.com>	<1416902662-19281-2-git-send-email-yingjoe.chen@mediatek.com> <CAMuHMdWj0Z66fya=7oN=ZUoz0TQOHFxBe0wyHmkDDVzU8Lafog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWj0Z66fya=7oN=ZUoz0TQOHFxBe0wyHmkDDVzU8Lafog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <eddie.huang-NuS5LvNUpcLQFizaE/u3fw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/14 13:27, Geert Uytterhoeven wrote:
> On Tue, Nov 25, 2014 at 9:04 AM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> Add support to use gic as a parent for stacked irq domain.
>>
>> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This change (which is now in -next as commit 9a1091ef0017c40a) breaks
> booting on r8a7740/armadillo-legacy.
> 
> It hangs because the timers cannot get their interrupts:
> 
> console [tty0] enabled
>  sh-tmu.0: ch0: used for clock events
>  sh-tmu.0: ch0: used for periodic clock events
>  sh-tmu.0: ch0: failed to request irq 230
>  sh-tmu.0: ch1: used as clock source
>  sh-cmt-48.1: ch0: failed to request irq 90
>  sh-cmt-48.1: ch0: registration failed
> earlytimer: unable to probe sh-cmt-48 early.
> Calibrating delay loop...

Grmbl... Are you, by any (lack of) chance, using a setup where the GIC
is probed via DT, but the timers have their IRQs hardcoded?

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
