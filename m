From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] clockevents: rockchip: Add rockchip timer for rk3288
Date: Mon, 26 Jan 2015 10:33:23 +0100
Message-ID: <54C609E3.8020303@linaro.org>
References: <1422178979-12382-1-git-send-email-daniel.lezcano@linaro.org> <54C59782.80504@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C59782.80504-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/26/2015 02:25 AM, Kever Yang wrote:
> Hi Daniel,

Hi Kever,

[ ... ]

>> +static inline int rk_timer_set_next_event(unsigned long cycles,
>> +                      struct clock_event_device *ce)
>> +{
>> +    rk_timer_disable(ce);
>> +    rk_timer_update_counter(cycles, ce);
>> +    rk_timer_enable(ce, TIMER_MODE_USER_DEFINED_COUNT);
>> +    return 0;
>> +}
>> +
>> +static inline void rk_timer_set_mode(enum clock_event_mode mode,
>> +                     struct clock_event_device *ce)
>> +{
>> +    switch (mode) {
>> +    case CLOCK_EVT_MODE_PERIODIC:
>> +        rk_timer_disable(ce);
>> +        rk_timer_update_counter(rk_timer(ce)->freq / HZ - 1, ce);
>> +        rk_timer_enable(ce, TIMER_MODE_FREE_RUNNING);
>> +    case CLOCK_EVT_MODE_ONESHOT:
> This driver seems init the timer as ONE SHOT mode, and we can
> set to PERIODIC by this code, but what if user set the timer
> as PERIODIC mode and then want to set back to ONESHOT mode?

Mmh, I think that will be followed by a call set_next_event, hence=20
disabling the timer and set the right mode with the next event.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
