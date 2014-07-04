From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 2/4] dts: add devicetree bindings for pxa27x clocks
Date: Fri, 04 Jul 2014 21:38:30 +0200
Message-ID: <87d2dkoqx5.fsf@free.fr>
References: <1404066744-13416-1-git-send-email-robert.jarzmik@free.fr>
	<1404066744-13416-3-git-send-email-robert.jarzmik@free.fr>
	<CAN1soZys4k6g5RgPLbreopOxTwDJ+bfPOq8XPwsNpyt5+YURjg@mail.gmail.com>
	<20140703220328.11380.22037@quantum>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140703220328.11380.22037@quantum> (Mike Turquette's message of
	"Thu, 03 Jul 2014 15:03:28 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> Quoting Haojian Zhuang (2014-07-02 23:14:33)
>> Maybe defining these clocks in pxa27x clock driver is better.
>
> Agreed. After a long time trying to figure out the best DT binding for
> clocks it seems that defining the per-clock data in DTS is not the best
> way. The qcom msm and samsung exynos clock bindings and DTS data are
> good examples.

Ah, I see. Would have been a great comment in the former RFC patch serie, sic
... Maybe a comment in the clock device-tree documentation would prevent others
to do the same error ?

Well, it will take me some time to transform the dts data into code, especially
if I want to have some genericity to handle all PXA variants.

I'll work on it in the next days/week.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
