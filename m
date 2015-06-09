From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Mon, 08 Jun 2015 21:37:08 -0700
Message-ID: <55766D74.2060401@roeck-us.net>
References: <=fu.wei@linaro.org>	<1433217907-928-1-git-send-email-fu.wei@linaro.org>	<1433217907-928-6-git-send-email-fu.wei@linaro.org>	<556DCC95.806@codeaurora.org>	<CADyBb7sXiMNtrH+Eu1Qj00TPNLMMr5cCTPObzFmKnHLsbWH79Q@mail.gmail.com>	<556DE2D5.3090906@roeck-us.net>	<CADyBb7uT=gFJkK8s-QF1n4Z+Zov9Lurp1nvBO-C-qszTqbMYXQ@mail.gmail.com>	<5575DE48.8010308@roeck-us.net> <CADyBb7sYPnvDVEJYVQm65B1JV=yvq10+ezs2x3f8F=TJCZ+OJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7sYPnvDVEJYVQm65B1JV=yvq10+ezs2x3f8F=TJCZ+OJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/08/2015 08:59 PM, Fu Wei wrote:
> Hi Guenter,
>
>
> On 9 June 2015 at 02:26, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On 06/08/2015 09:05 AM, Fu Wei wrote:
>>>
>>> Hi Gurnter
>>>
>>> On 3 June 2015 at 01:07, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>>>>
>>>> On 06/02/2015 09:55 AM, Fu Wei wrote:
>>>>>
>>>>>
>>>>> Hi Timur,
>>>>>
>>>>> Thanks , feedback inline
>>>>>
>>>>> On 2 June 2015 at 23:32, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>>>>>
>>>>>>
>>>>>> On 06/01/2015 11:05 PM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>>>>>
>>>>>>> +/*
>>>>>>> + * help functions for accessing 32bit registers of SBSA Generic
>>>>>>> Watchdog
>>>>>>> + */
>>>>>>> +static void sbsa_gwdt_cf_write(unsigned int reg, u32 val,
>>>>>>> +                              struct watchdog_device *wdd)
>>>>>>> +{
>>>>>>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>>>>>>> +
>>>>>>> +       writel_relaxed(val, gwdt->control_base + reg);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void sbsa_gwdt_rf_write(unsigned int reg, u32 val,
>>>>>>> +                              struct watchdog_device *wdd)
>>>>>>> +{
>>>>>>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>>>>>>> +
>>>>>>> +       writel_relaxed(val, gwdt->refresh_base + reg);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static u32 sbsa_gwdt_cf_read(unsigned int reg, struct watchdog_device
>>>>>>> *wdd)
>>>>>>> +{
>>>>>>> +       struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
>>>>>>> +
>>>>>>> +       return readl_relaxed(gwdt->control_base + reg);
>>>>>>> +}
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> I still think you should get rid of these functions and just call
>>>>>> readl_relaxed() and writel_relaxed() every time, but I won't complain
>>>>>> again
>>>>>> if you keep them.
>>>>>
>>>>>
>>>>>
>>>>> yes, that make sense, and will reduce the size of code, and I think
>>>>> the code's readability will be OK too.
>>>>> will try in my next patch,
>>>>>
>>>>>>
>>>>>>> +static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
>>>>>>> +{
>>>>>>> +       struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
>>>>>>> +       struct watchdog_device *wdd = &gwdt->wdd;
>>>>>>> +
>>>>>>> +       if (wdd->pretimeout)
>>>>>>> +               /* The pretimeout is valid, go panic */
>>>>>>> +               panic("SBSA Watchdog pre-timeout");
>>>>>>> +       else
>>>>>>> +               /* We don't use pretimeout, trigger WS1 now*/
>>>>>>> +               sbsa_gwdt_set_wcv(wdd, 0);
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> I don't like this.
>>>>>
>>>>>
>>>>>
>>>>> If so, what is your idea ,if pretimeout == 0?
>>>>>
>>>>> the reason of using WCV as (timout - pretimeout): it can provide the
>>>>> longer timeout period,
>>>>> (1)If we use WOR, it can only provide 10s @ 400MHz(max).
>>>>> as Guenter said earlier, the default timer out for most watchdog will
>>>>> be 30s, so I think 10s limit will be a little short
>>>>> (2)we can always program WCV just like ping.
>>>>> (3)if a timeout arrives, WOR will be use, so use it as pretimeout, but
>>>>> we still can make this pretimeout longer by programming WCV(I don't
>>>>> think it's necessary)
>>>>>
>>>>>
>>>>>> The triggering of the hardware reset should never depend
>>>>>> on an interrupt being handled properly.
>>>>>
>>>>>
>>>>>
>>>>> if this fail, system reset in 1S, because WOR == (1s)
>>>>>
>>>> So ?
>>>
>>>
>>> Even the interrupt routine isn't triggered,  (WOR + system counter) -->
>>> WCV,
>>> then, sy system reset in 1S.
>>>
>>> the hardware reset doesn't depend on an interrupt.
>>>
>>>
>>>>
>>>>>> You should always program WCV
>>>>>> correctly in advance.  This is especially true since pre-timeout will
>>>>>> probably rarely be used.
>>>>>
>>>>>
>>>>>
>>>>> always programming WCV is doable.  But I absolutely can not agree "
>>>>> pre-timeout will probably rarely be used"
>>>>> If so, SBSA watchdog is just a normal watchdog,  This use case just
>>>>> makes this HW useless.
>>>>> If so, go to use SP805.
>>>>> you still don't see the importance of this warning and pretimeout to a
>>>>> real server.
>>>>>
>>>>
>>>> If pretimeout isn't used, why not just set WCV = timeout, WOR = 0 ?
>>>
>>>
>>> Because if WOR = 0 , according to SBSA,  once you want to enable watchdog,
>>> (0 + system counter) --> WCV , then , WS0 and WS1 will be triggered
>>> immediately.
>>> we have not a chance(a time slot) to update WCV.
>>>
>>
>> I would have thought that this is exactly what we want if pretimeout is not
>> used.
>
> Although pretimeout == 0 is not good for a server, but If
> administrator set up pretimeout == 0. *I thinks we should trigger WS1
> ASAP* . Because  WS1 maybe a interrupter or a reboot signal, that is
> why we can not reboot system directly.
>
> This driver is SBSA watchdog driver, that means we need to follow SBSA spec:
> (1) SBSA watchdog has two stage timeouts --> timeout and pretimeout is
> the best solution in watchdog framework, at least for now.
> (2) The watchdog has the following output signals:
>      Watchdog Signal 0 (WS0)---> "The initial signal is typically wired
> to an interrupt and alerts the system."(original word from spec), I
> thinks the key work should be "interrupt" and "alerts". So in WS0
> interrupt routine, reset is absolutely a wrong operation. Although I
> think we should make this "alerts" more useful. But for the first
> version of driver, I thinks panic is useful enough.
>      Watchdog Signal 1 (WS1). ---> "The signal is fed to a higher agent
> as an interrupt or reset for it to take executive action." (original
> word from spec) . The key work should be "interrupt", "or" and "reset"
> . So  WS1 maybe a interrupt.
> so even in the WS0 interrupt routine, if  pretimeout == 0 , we need to
> trigger WS1(that is what my patch is doing now, set WCV to 0, so WCV
> is always less than SystemCounter, and in this situation(WS0 = TRUE),
> WS1 will be trigger immediately), but definitely not a reset too.
>
> But in worst case,  if the WS0 is triggered, but the interrupt routine
> doesn't work(can not set up WCV), it doesn't matter, we just need to
> wait for a WOR(1s in my driver) timeout, then WS1 will be triggered.
> That is hardware mechanism, once we config SBSA watchdog correctly,
> that should work.  If it doesn't, I think the chip design doesn't
> follow the SBSA spec.
>
> Make a summary here, for SBSA watchdog driver,  it need to support two
> stage timeouts and need to trigger WS0/1 when timeouts occur(can not
> simply reset system in interrupt routines).
> If a driver doesn't do these above, the driver can not be called SBSA
> watchdog driver.
>
> But according to SBSA, even pretimeout == 0, we can not setup WOR = 0.
> if we make WOR = 0 , once we set up WCS(enabling watchdog), that cause
> a explicit watchdog refresh, then WCV = (0 + system counter), so WS0
> and WS1 will be triggered serially and immediately(in theory, the

I still don't understand why this would be a problem.

> "delay" also depend on implementation). So in my patchset , if
> pretimeout == 0, WOR will be 1s at least to make sure we have time to
> setup WCV. I have made comments in the patch for explaining this.
>
> Maybe some people want to ask: if we can not set up WOR = 0, but
> pretimeout can be 0 and timeout can not, why I still want to use WOR
> for pretimeout and using WCV as (timout - pretimeout) ??
> For this:
> (1)WCV can provide the longer timeout period, If we use WOR, it can
> only provide 10s @ 400MHz(max). The default timer out for most
> watchdog will be 30s, so I think 10s limit will be a little short.
> (2)we can always program(write) WCV just like ping.
> (3)if the first timeout occurs, WOR will be loaded to WCV(WOR + system
> counter)  automatically , so why not just use WOR as pretimeout?
> Although we still can make this pretimeout longer by programming WCV,
> I don't think it's necessary for now.
>

Too bad I don't have an arm64 system to test myself. I am not sure
I understand why WOR must be set to > 0 if pretimeout == 0, and even
if it must be set to a value > 0 I don't understand why
setting it to 1 (instead of 1 second) would not be sufficient.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
