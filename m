From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] doc: dt: add documentation for lpc1850-cgu clk driver
Date: Fri, 22 May 2015 00:21:10 +0200
Message-ID: <CAGhQ9VyEzLORbXv74NC6isa50UF5_K2F-NAktceE+PgV8bcGbQ@mail.gmail.com>
References: <1430170693-28303-1-git-send-email-manabian@gmail.com>
	<1430170693-28303-3-git-send-email-manabian@gmail.com>
	<20150512221202.16410.2827@quantum>
	<CAGhQ9VyRjugLxscdL_wELbjMiDD3CFYJmsJAC_34wQeBmuxWjQ@mail.gmail.com>
	<20150521211727.9817.5989@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150521211727.9817.5989@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ariel D'Alessandro <ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 May 2015 at 23:17, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Joachim Eastwood (2015-05-13 00:57:18)
>> On 13 May 2015 at 00:12, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> >
>> > Why do you need to use clock-indices?
>>
>> Since the CGU can have up to 27 clock lines, but in this device not
>> all are used. So I use clock-indices so I don't need to have empty
>> entries in the clock-output-names array. I thought this was the
>> intended usage(?)
>>
>> > Why do you need to use clock-output-names? If all of your clock
>> > consumers have nodes in DT then you can skip this and name them on the
>> > consuming side. See a further explanation here:
>> > http://lkml.kernel.org/r/<20150416192014.19585.9663@quantum>
>>
>> Most of the clocks from the CGU goes to a CCU, but the CCU isn't the
>> real consumer. It's more like a clock router with a bunch of gates.
>>
>> If you take a close look at the CCU driver you will notice that it
>> doesn't do clk_get on any of the clocks. My reason for doing this is
>> to not increase the usage counter on the CGU clock so that if there
>> are no consumer after a CCU the entire clock line up to the CGU can be
>> disabled. So this is the reason that the CCU driver uses a "special"
>> way to grab the clock output names from the CGU.
>
> A call to clk_get will not enable/ungate the clock signal. It seems that
> there might be some confusion around that. It is always OK to get the
> clk. This will not increase the enable_count or prepare_count values.
>
> If the CCU is a separate IP block then it might make sense for it to
> call clk_get on the CGU clocks. On the other hand it might make more
> sense for the CCU clocks to simply use the CGU clocks as parent clock
> signal inputs.

v3, that was sent a couple of days ago, uses of_clk_get/clk_get_name
to set the CCU clock parents. See v3 cover letter for a short
explanation.

> None of the points above have anything to do with my original comment.
> The use of the clock-output-names property is unnecessary if all of the
> consumer devices have DT nodes of their own. Please look at the thread I
> linked to and let me know what you think about getting rid of the
> clock-output-names property.

v3 removes the property. Please take a look at it when you get the time.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
