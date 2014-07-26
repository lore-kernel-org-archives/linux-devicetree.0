From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Migrate PXA27x platforms to clock framework
Date: Sat, 26 Jul 2014 10:52:49 +0200
Message-ID: <87k370o61q.fsf@free.fr>
References: <1405353263-13424-1-git-send-email-robert.jarzmik@free.fr>
	<87k376vadk.fsf@free.fr> <20140726004212.4791.52407@quantum>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140726004212.4791.52407@quantum> (Mike Turquette's message of
	"Fri, 25 Jul 2014 17:42:12 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> Quoting Robert Jarzmik (2014-07-21 11:23:51)
>> Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> writes:
>> 
>> > This is the second opus of this serie.
>> 
>> Ping ?
>
> Hi Robert,
>
> Overall the series looks good to me. The only problem I see is that
> somewhere in the use of the PARENTS() macro there is a section mismatch
> introduced. I spent about 5 minutes looking at it and gave up. This
> problem introduces 26 section mismatch warnings building
> colibri_pxa270_defconfig.
OK Mike, I'll fix this. This is probably because pxa27x_clocks array is not
__init, and it references parents which are __init. I was lazy letting
pxa27x_clocks not __init because I reuse the internal fields "hw" and "gate->hw"
later (hence I didn't leave the __init).
This is a bit dirty and I'll launder it.

Moreover, I have one fix which I had fixed wrt boot ordering : the
postcore_init() must die. The reason behind is that I have no guarantee of
ordering between clocks init and clocksource init, and clocksource relies on
clocks.

The right way will be AFAIK to call the core clocks init :
 - within the device-tree initialization function : pxa27x_dt_clocks_init()
 calls pxa27x_clocks_init9)
 - directly from pxa27x_init() or pxa_timer_init() in non-device tree setup

> Once those are fixed up then I will be happy to take this series. Do you
> want me to take all six patches through the clk tree, including the
> arm/arm stuff?
I would feel more comfortable if :
 - you take the 4 first ones (3 clock ones + 1 arm pxa header bit definitions)
 - Haojian takes the last 2 ones (pxa ones)

I will check that taking only the first 4 ones doesn't break anything, in case
there is a merge window hipcup.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
