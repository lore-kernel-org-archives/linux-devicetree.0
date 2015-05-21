From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/7] clocksource: mips-gic: Split clocksource and clockevent
 initialization
Date: Thu, 21 May 2015 19:25:32 -0300
Message-ID: <555E5B5C.9050807@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>	<1432244260-14908-4-git-send-email-ezequiel.garcia@imgtec.com> <CAL1qeaFkzpH+nGqRPOuY-L62jP8NgZWP0WxKTYKXZDpe1sSojg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaFkzpH+nGqRPOuY-L62jP8NgZWP0WxKTYKXZDpe1sSojg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 05/21/2015 07:24 PM, Andrew Bresticker wrote:
> On Thu, May 21, 2015 at 2:37 PM, Ezequiel Garcia
> <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> This is preparation work for the introduction of clockevent frequency
>> update with a clock notifier. This is only possible when the device
>> is passed a clk struct, so let's split the legacy and devicetree
>> initialization.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clocksource/mips-gic-timer.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
>> index c4352f0..22a4daf 100644
>> --- a/drivers/clocksource/mips-gic-timer.c
>> +++ b/drivers/clocksource/mips-gic-timer.c
>> @@ -142,11 +142,6 @@ static void __init __gic_clocksource_init(void)
>>         ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
>>         if (ret < 0)
>>                 pr_warn("GIC: Unable to register clocksource\n");
>> -
>> -       gic_clockevent_init();
>> -
>> -       /* And finally start the counter */
>> -       gic_start_count();
>>  }
> 
> Instead of duplicating this bit in both the OF and non-OF paths, maybe
> it would be better to do the notifier registration in
> gic_clockevent_init(), either by passing around the struct clk or
> making it a global?
> 

Yeah, I had something like that first, but somehow it looked ugly to have:

  gic_clockevent_init(IS_ERR(clk) ? NULL : clk);

Don't have a strong opinion though.
-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
