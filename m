From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/3] Introduce clocksource driver for Keystone platform
Date: Tue, 11 Feb 2014 13:50:20 +0100
Message-ID: <52FA1C8C.40105@linaro.org>
References: <1392027058-11680-1-git-send-email-ivan.khoronzhuk@ti.com> <52F8F55A.2090903@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52F8F55A.2090903-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/10/2014 04:50 PM, Santosh Shilimkar wrote:
> Daniel,
>
> On Monday 10 February 2014 05:10 AM, Ivan Khoronzhuk wrote:
>> Add a broadcast timer64 based clockevent driver for keystone arch.
>> This driver uses timer in 64-bit general purpose mode as clock event
>> device.
>>
>> Documentation:
>>      http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
>>
>> Based on
>> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keyston=
e.git
>> keystone/master
>>
>> v5..v6:
>> 	added function to encapsulate __iowmb().
>>
>> v4..v5:
>> 	used __iowmb() insted of wmb()
>>
>> v3..v4:
>> 	rebased on latest of linux-keystone.git keystone/master
>>
>> v2..v3:
>> - clocksource: timer-keystone: introduce clocksource driver for
>> 	changed "u64" type to "unsigned long" for hz_period as more appropr=
iate
>> 	hz_period rounded up by DIV_ROUND_UP(rate, HZ)
>> 	corrected comments
>>
>> v1..v2:
>> - clocksource: timer-keystone: introduce clocksource driver for
>> 	renamed timer on "timer-keystone"
>> 	in keystone_timer_interrupt() evet pointer is passed via "dev_id"
>> 	used __relaxed variants of writel/readl and added explicit barriers
>> 	added "keystone_timer_disable()" for using in keystone_set_mode()
>> 	keystone_timer_config() is not used for disabling the timer any mor=
e
>> 	in case of an unsupported mode the keystone_timer_config() returns =
-1.
>> 	used request_irq() instead of setup_irq()
>> 	assigned irq for event_device in event_dev->irq
>> 	calculated timer.hz_period for CLOCK_EVT_MODE_PERIODIC at init
>> 	deleted spare call of keystone_timer_config() in keystone_timer_ini=
t()
>>
>> Ivan Khoronzhuk (3):
>>    clocksource: timer-keystone: introduce clocksource driver for Key=
stone
>>    clocksource: keystone: add bindings for keystone timer
>>    arm: dts: keystone: add keystone timer entry
>>
> Can you queue the first two patches from the series ?
> I will queue the dts patch via my tree.

Sure.


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
