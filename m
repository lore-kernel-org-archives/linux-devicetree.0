From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm: pxa: add non device-tree timer link to clocksource
Date: Fri, 26 Sep 2014 19:08:45 +0200
Message-ID: <87lhp6paw2.fsf@free.fr>
References: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr>
	<1405356724-32207-4-git-send-email-robert.jarzmik@free.fr>
	<53CD25A4.7030606@linaro.org> <87oawivarv.fsf@free.fr>
	<54251B27.909@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54251B27.909-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (Daniel Lezcano's message of "Fri, 26
	Sep 2014 09:52:07 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On 07/21/2014 08:15 PM, Robert Jarzmik wrote:
>> Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
>>
>>> On 07/14/2014 06:52 PM, Robert Jarzmik wrote:
>>>> As clocksource pxa_timer was moved to clocksource framework, the
>>>> pxa_timer initialization needs to be a bit amended, to pass the
>>>> necessary informations to clocksource, ie :
>>>>    - the timer interrupt (mach specific)
>>>>    - the timer registers base (ditto)
>>>>    - the timer clockrate
>>>>
>>>> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
>>>>
>>>> ---
>>>> Since V2: Arnd's comment : moved extern declaration into .h file
>>>> ---
>>>

> Hi,
>
> May be I missed it but I don't see the Haojian's ack.
>
> Thanks
>   -- Daniel

You're right, I scanned through my mail and didn't find the ack.
Haojian, would you review this one please ?

It's here :
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272311.html

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
