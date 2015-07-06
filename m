From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: mediatek: mt8173: Fix enabling of critical
 clocks
Date: Mon, 06 Jul 2015 15:52:55 -0700
Message-ID: <559B06C7.80209@codeaurora.org>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com> <1435633127-31952-2-git-send-email-jamesjj.liao@mediatek.com> <20150702230300.GO4301@codeaurora.org> <CAGS+omCwxLNha7EJ2nZ1++E-D5G1d-oRmh1C=m3OQWtbX0SH4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCwxLNha7EJ2nZ1++E-D5G1d-oRmh1C=m3OQWtbX0SH4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/02/2015 11:29 PM, Daniel Kurtz wrote:
> Hi Stephen,
>
> On Fri, Jul 3, 2015 at 7:03 AM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> On 06/30, James Liao wrote:
>>> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>
>>> On the MT8173 the clocks are provided by different units. To enable
>>> the critical clocks we must be sure that all parent clocks are already
>>> registered, otherwise the parents of the critical clocks end up being
>>> unused and get disabled later. To find a place where all parents are
>>> registered we try each time after we've registered some clocks if
>>> all known providers are present now and only then we enable the critical
>>> clocks
>>>
>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>> Applied to clk-fixes
> I think James plans to send an updated version of this patch.
>
>

Oh right. Well those comments are minor so I'll just fold them in given
that I'm rewinding clk-fixes today. I see that comment in init.h about
uninitialized variables and __initdata too. I found this 10 year old
thread about that [1]. At least with my gcc-4.9 arm compiler I don't see
uninitialized __initdata moved to bss. A workaround seems to be to
initialize it to NULL in this case, but maybe that doesn't matter
because compilers don't have that problem anymore.

[1] http://lkml.iu.edu/hypermail/linux/kernel/0512.0/1366.html

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
