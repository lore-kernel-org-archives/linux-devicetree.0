From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2] clockevents: rockchip: Add rockchip timer for rk3288
Date: Mon, 26 Jan 2015 10:50:39 +0100
Message-ID: <54C60DEF.7090709@linaro.org>
References: <1422178979-12382-1-git-send-email-daniel.lezcano@linaro.org> <alpine.DEB.2.11.1501261041580.5526@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1501261041580.5526@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: heiko@sntech.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/26/2015 10:43 AM, Thomas Gleixner wrote:
> On Sun, 25 Jan 2015, Daniel Lezcano wrote:
>> +static inline void rk_timer_set_mode(enum clock_event_mode mode,
>> +				     struct clock_event_device *ce)
>> +{
>> +	switch (mode) {
>> +	case CLOCK_EVT_MODE_PERIODIC:
>> +		rk_timer_disable(ce);
>> +		rk_timer_update_counter(rk_timer(ce)->freq / HZ - 1, ce);
>> +		rk_timer_enable(ce, TIMER_MODE_FREE_RUNNING);
>
> Missing break. You disable the timer again right away ...

Oops :)

Thanks for spotting this. I figured out why when I tested the timer,=20
that worked: it ends up in any case in the noop ONESHOT/RESUME's break.

=46ixed.

>> +	case CLOCK_EVT_MODE_ONESHOT:
>> +	case CLOCK_EVT_MODE_RESUME:
>> +		break;
>> +	case CLOCK_EVT_MODE_UNUSED:
>> +	case CLOCK_EVT_MODE_SHUTDOWN:
>> +		rk_timer_disable(ce);
>> +		break;
>> +	}
>> +}
>> +
>> +static irqreturn_t rk_timer_interrupt(int irq, void *dev_id)
>> +{
>> +	struct clock_event_device *ce =3D dev_id;
>> +
>> +	rk_timer_interrupt_clear(ce);
>> +
>> +	if (ce->mode =3D=3D CLOCK_EVT_MODE_ONESHOT) {
>> +		rk_timer_disable(ce);
>> +	}
>
> No need for the braces here.

Thanks ! Fixed.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
