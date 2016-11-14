From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 14 Nov 2016 18:10:10 +0100
Message-ID: <20161114171010.GG2016@mai>
References: <1479021872-14237-1-git-send-email-noamca@mellanox.com>
 <1479021872-14237-4-git-send-email-noamca@mellanox.com>
 <20161114112326.GC2016@mai>
 <DB6PR0501MB25183C670A48F44DB916D7FEAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
 <20161114143454.GE2016@mai>
 <DB6PR0501MB25183EEEC116B9E97CC01BCFAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
 <20161114154154.GF2016@mai>
 <DB6PR0501MB251848D66EAA58589B550B41AABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB251848D66EAA58589B550B41AABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 04:45:44PM +0000, Noam Camus wrote:
> > From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] Sent: Monday,
> > November 14, 2016 5:42 PM
> 
> >> When you are saying "we have a framework" do you mean to some generic
> >> framework in the kernel?
> 
> > Yes, IIRC it is regmap but I'm not sure.
> Indeed regmap is a generic framework and it primarily meant for registers
> which can be mapped to our virtual/logical address space which is not the
> case here. For our auxiliary registers access we use dedicated instructions
> (lr/sr) and not LOAD/STORE like GCC produce.  It is possible to use such
> regmap but this driver will be filled with all regmap handling just to hide
> couple of lines. This will not serve this driver readability well.

Indeed.
 
> >I think there is something I am missing with this HW scheduling thing. Why
> >are these hw_schd_save/hw_schd_restore functions needed to be called from
> >the timer driver ? Regarding the explanation, the HW scheduling can happen
> >everywhere at any time, not only in the timer code but this one is the only
> >one which need the hw_schd_save/hw_schd_restore calls, why ?
> I use them not just here they are also serve to protect our L1 cache and TLB
> which are also shared within same core. You can't see this yet since patch
> are not still push to arch/arc tree.
> >Why,
> 
> >spin_lock(&lock); write_aux_reg(...) spin_unlock(&lock);
> 
> >can't work ?
> Because I can't use spinlock in interrupt context (I call to
> nps_clkevent_rm_thread() in irq_handler).
> 
> >IIUC, there can be more than 16 cpus/threads, so calling hw_schd_save /
> >hw_schd_restore will disable the HW scheduling for the entire system while
> >one cpu is processing something with these couple of registers, no ?
> NO, HW scheduling will be disabled only for this specific core, all other
> cores will not be affected since they got their own private registers.
> 
> ...
> >> >And tick_resume. Perhaps, that is the reason why NO_HZ hangs.
> >> What NO_HZ hang are you referring to in this case?  How calling
> >> nps_clkevent_rm_thread() explain such hang?  Anyway I agree, and will add
> >> nps_clkevent_rm_thread() to tick_resume.
> 
> >Actually I meant NOHZ_FULL.
>  Still got no clue what hang we are talking about here!

Never mind, I read in a previous email from v2 "hanging" instead of "handling".
 
> Note: I looked at arch/tile timer driver again and noticed that I can work
> without periodic mode. This is exactly what I need here (pure oneshot mode).
> With this fact I can define Static void nps_clkevent_rm_thread(void) Static
> void nps_clkevent_add_thread(void)
> 
> Also HW scheduling save/restore is only used in *rm_thread/*add_thread since
> I can now remove nps_clkevent_set_periodic() and
> nps_clkevent_timer_event_setup().  This way clockevent driver seem much
> simpler and it is clearer to understanding.  I hope that this approach of not
> having periodic mode is acceptable.

AFAICT, oneshot mode is more accurate than periodic mode. The time framework
will take care of emulating the periodic timer. There are several timers in
drivers/clocksource which are oneshot more only.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
