From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 14 Nov 2016 16:41:54 +0100
Message-ID: <20161114154154.GF2016@mai>
References: <1479021872-14237-1-git-send-email-noamca@mellanox.com>
 <1479021872-14237-4-git-send-email-noamca@mellanox.com>
 <20161114112326.GC2016@mai>
 <DB6PR0501MB25183C670A48F44DB916D7FEAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
 <20161114143454.GE2016@mai>
 <DB6PR0501MB25183EEEC116B9E97CC01BCFAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB25183EEEC116B9E97CC01BCFAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 03:17:48PM +0000, Noam Camus wrote:
> > From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] 
> > Sent: Monday, November 14, 2016 4:35 PM
> 
>  
> >The function nps_clkevent_timer_event_setup() writes into the
> >NPS_REG_TIMER0_CTRL register but there is no critical section there. What
> >prevents another HW thread to write this register at the same time ?
> Correct, during my last email to you I noticed that fact and already started
> fixing it.
> 
> >I do believe we have a framework to access shared registers, otherwise a
> >simple spinlock would be simpler and perhaps faster than disabling the
> >entire hardware scheduling for the system, no ?
> When you are saying "we have a framework" do you mean to some generic
> framework in the kernel? 

Yes, IIRC it is regmap but I'm not sure.

> Anyway to my understanding I cannot guarantee this
> atomics during my routines without preventing HW from changing the HW thread
> this core executes.  As SW I am not aware to such HW scheduling, It is much
> same as with interrupts that we disable them when we reach code that might be
> shared by the interrupt handler.

I think there is something I am missing with this HW scheduling thing. Why are
these hw_schd_save/hw_schd_restore functions needed to be called from the
timer driver ? Regarding the explanation, the HW scheduling can happen everywhere
at any time, not only in the timer code but this one is the only one which need
the hw_schd_save/hw_schd_restore calls, why ?

Why,

spin_lock(&lock);
write_aux_reg(...)
spin_unlock(&lock);

can't work ?

IIUC, there can be more than 16 cpus/threads, so calling hw_schd_save /
hw_schd_restore will disable the HW scheduling for the entire system while one
cpu is processing something with these couple of registers, no ?

> >Regarding the comment I did above, it is possible the critical section is
> >reduced and moved into the shutdown function. Thus, the boolean wouldn't be
> >needed anymore, well that is conditional to the above comment. Discard the
> >comment for the moment, until the hw sched vs spinlock vs
> >NPS_REG_TIMER0_CTRL is sorted out.
> OK, I will discard that in the meantime.
> 
> ...
> >> >> +	.set_state_shutdown		=
> >> >> nps_clkevent_timer_shutdown,
> >> 
> >> >Doesn't set_state_shutdown and set_state_oneshot_stopped need to remove
> >> >the HW thread from the TSI ?
> >> You are correct, I will fix that.
> 
> >And tick_resume. Perhaps, that is the reason why NO_HZ hangs.
> What NO_HZ hang are you referring to in this case?  How calling
> nps_clkevent_rm_thread() explain such hang?  Anyway I agree, and will add
> nps_clkevent_rm_thread() to tick_resume.

Actually I meant NOHZ_FULL.
 
> Appreciating your effort and will gladly provide any more information needed
> about our SoC.  -Noam

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
