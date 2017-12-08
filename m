From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 4/6] clocksource: stm32: add clocksource support
Date: Fri, 8 Dec 2017 15:19:24 +0100
Message-ID: <CA+M3ks7DQ7xH8WyKkwjU+=XHFjAE=N7hvsN8Pcxpkz1L5LHqKQ@mail.gmail.com>
References: <20171208113250.359-1-benjamin.gaignard@st.com>
 <20171208113250.359-5-benjamin.gaignard@st.com> <ac396fdb-1658-d2f3-bd92-b2b9fe04f201@linaro.org>
 <CA+M3ks6uWUQqD-c_FWETDLp097AfUEVs1srpH_C7kK-X8ADQ1Q@mail.gmail.com> <810270c4-c6b4-ee05-2481-ced52f7d2685@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <810270c4-c6b4-ee05-2481-ced52f7d2685-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-12-08 15:08 GMT+01:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On 08/12/2017 15:04, Benjamin Gaignard wrote:
>> 2017-12-08 14:46 GMT+01:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>> On 08/12/2017 12:32, Benjamin Gaignard wrote:
>>>> The stm32 timer hardware is currently only used as a clock event devic=
e,
>>>> but it can be utilized as a clocksource as well.
>>>>
>>>> Implement this by enabling the free running counter in the hardware bl=
ock
>>>> and converting the clock event part from a count down event timer to a
>>>> comparator based timer.
>>>
>>>
>>> Split this patch in two:
>>>  - periodic support
>>>  - clocksource support
>>
>> No because the way of implementing periodic support depend of how clocks=
ource
>> part is implemented on the hardware.
>> I don't want to code functions that I will completely remove just after
>
> Sorry, I don't get it. Can you elaborate please ?

To add clocksource support I use the counter part of the hardware
which was before
used for clockevent and make clockevent use the comparator instead.
So implementing periodic on counter side of the hardware is a waste of
time because
I will to remove right after

>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
