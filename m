From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm: pxa: add non device-tree timer link to clocksource
Date: Mon, 21 Jul 2014 20:15:16 +0200
Message-ID: <87oawivarv.fsf@free.fr>
References: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr>
	<1405356724-32207-4-git-send-email-robert.jarzmik@free.fr>
	<53CD25A4.7030606@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53CD25A4.7030606-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (Daniel Lezcano's message of "Mon,
	21 Jul 2014 16:37:24 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On 07/14/2014 06:52 PM, Robert Jarzmik wrote:
>> As clocksource pxa_timer was moved to clocksource framework, the
>> pxa_timer initialization needs to be a bit amended, to pass the
>> necessary informations to clocksource, ie :
>>   - the timer interrupt (mach specific)
>>   - the timer registers base (ditto)
>>   - the timer clockrate
>>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
>>
>> ---
>> Since V2: Arnd's comment : moved extern declaration into .h file
>> ---
>
> Shall I take the patches 4-5 also ?
Mmm you mean patch 4 I think.
Then I'd like you too, because it's linked in the serie, and without it the
former non-DT platforms break, hence I'd like all the serie to go through 1
tree.

Yet we'd need Haojian's ack here. Haojian, would you give your blessing on the
serie and agree that Daniel carries all the patches including patch 4/4 ?

Cheers.

--
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
