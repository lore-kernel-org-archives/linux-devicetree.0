From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Thu, 21 May 2015 19:02:28 -0300
Message-ID: <555E55F4.2060500@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com> <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com> <alpine.DEB.2.11.1505212352330.5457@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1505212352330.5457@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/21/2015 07:00 PM, Thomas Gleixner wrote:
> On Thu, 21 May 2015, Ezequiel Garcia wrote:
>> +static cycle_t clocksource_read_cycles(struct clocksource *cs)
>> +{
>> +	u32 counter, overflw;
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&lock, flags);
> 
> Hmm. Is that lock really necessary to read that counter? The
> clocksource is global. And if its actually used for timekeeping, the
> lock can get heavy contended.
> 

Yup, it is really (and sadly) necessary. The kernel hangs up completely
without it when the counter is accesed by more than one CPU.

Apparently, those two timer registers overflow and counter must be read
atomically.

>> +	overflw = gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
>> +	counter = gpt_readl(TIMER_CURRENT_VALUE, 0);
>> +	raw_spin_unlock_irqrestore(&lock, flags);
>> +
>> +	return ~(cycle_t)counter;
>> +}
> 
> Thanks,
> 
> 	tglx
> 

-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
