From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 1/6] clk: add pxa clocks infrastructure
Date: Sat, 02 Aug 2014 18:46:00 +0200
Message-ID: <87tx5usuuv.fsf@free.fr>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr>
	<1406753464-15000-2-git-send-email-robert.jarzmik@free.fr>
	<CAN1soZyST84DNvK=zyj6EhOt0fswZ4SvOmMnWiCZsYmapxkhOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1soZyST84DNvK=zyj6EhOt0fswZ4SvOmMnWiCZsYmapxkhOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Haojian Zhuang's message of "Sat, 2 Aug 2014 20:00:43 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Thu, Jul 31, 2014 at 4:50 AM, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:
>> +void __init clkdev_pxa_register(int ckid, const char *con_id,
>> +                               const char *dev_id, struct clk *clk)
>> +{
>> +       if (!IS_ERR(clk) && (ckid != CLK_NONE))
>
> Will you specify CLK_NONE in clock driver?
I haven't found a use yet (ie. pxa27x has no use for it, while for pxa3xx and
pxa25x I don't know yet).
I had put that here for a "CKEN" type clock which would be declared, but hidden
from device-tree. That's the meaning of "CLK_NONE", hidden from DT.

I can remove it if you think that there is no pxaXXX which needs this functionality.

> It seems that CLK_NONE isn't used in pxa27x clock driver. And pxa_clocks[0] is
> not used. Is it redundant?
Yes it is. pxa_clocks[0] is never filled by any clock.

Cheers.

--
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
