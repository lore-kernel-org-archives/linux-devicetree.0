From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 02 Jun 2015 12:21:51 -0500
Message-ID: <556DE62F.1040401@codeaurora.org>
References: <=fu.wei@linaro.org>	<1433217907-928-1-git-send-email-fu.wei@linaro.org>	<1433217907-928-6-git-send-email-fu.wei@linaro.org>	<556DCC95.806@codeaurora.org> <CADyBb7sXiMNtrH+Eu1Qj00TPNLMMr5cCTPObzFmKnHLsbWH79Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7sXiMNtrH+Eu1Qj00TPNLMMr5cCTPObzFmKnHLsbWH79Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/02/2015 11:55 AM, Fu Wei wrote:

>>> +static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
>>> +{
>>> +       struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
>>> +       struct watchdog_device *wdd = &gwdt->wdd;
>>> +
>>> +       if (wdd->pretimeout)
>>> +               /* The pretimeout is valid, go panic */
>>> +               panic("SBSA Watchdog pre-timeout");
>>> +       else
>>> +               /* We don't use pretimeout, trigger WS1 now*/
>>> +               sbsa_gwdt_set_wcv(wdd, 0);
>>
>>
>> I don't like this.
>
> If so, what is your idea ,if pretimeout == 0?

If pretimeout == 0, then WCV should be set to timeout/2.  The WS0 
timeout will occur after timeout/2 seconds, and the driver will ignore 
it in the interrupt handler.  Then after another timeout/2 seconds, WS1 
will timeout and the system will reset.

> the reason of using WCV as (timout - pretimeout): it can provide the
> longer timeout period,
> (1)If we use WOR, it can only provide 10s @ 400MHz(max).
> as Guenter said earlier, the default timer out for most watchdog will
> be 30s, so I think 10s limit will be a little short
> (2)we can always program WCV just like ping.
> (3)if a timeout arrives, WOR will be use, so use it as pretimeout, but
> we still can make this pretimeout longer by programming WCV(I don't
> think it's necessary)

I understand that, but like I said, I think pretimeout will be rarely 
used, and so the driver should work best with pre-timeout enabled.

>> The triggering of the hardware reset should never depend
>> on an interrupt being handled properly.
>
> if this fail, system reset in 1S, because WOR == (1s)
>
>> You should always program WCV
>> correctly in advance.  This is especially true since pre-timeout will
>> probably rarely be used.
>
> always programming WCV is doable.  But I absolutely can not agree "
> pre-timeout will probably rarely be used"
> If so, SBSA watchdog is just a normal watchdog,

So what? What's wrong with that?  Users don't have any control over 
which watchdog hardware is on the SOC, and they don't care.  They will 
use the same watchdog software as they do on x86.

Users *want* a normal watchdog.  Pre-timeout is only supported on time 
watchdog hardware, so no one will standardize on it.  ARM servers 
supposed to be interchangeable with x86 servers.  Customers are not 
going to do anything special on an ARM server that they don't do on an 
x86 server.  I've been working in the ARM server industry for over two 
years, and that's why everyone says.

> This use case just
> makes this HW useless.
> If so, go to use SP805.
> you still don't see the importance of this warning and pretimeout to a
> real server.
>
> If the software of a real server goes wrong, then you just directly restart it ,
> never try to sync/protect the current data, never try to figure out
> what is wrong with it.
> I don't think that is a good server software.

And that is exactly why my driver treats WS0 as the real timeout, and 
WS1 as a "backup" timeout.  When WS0 expires, the system tries to do a 
"polite" reset.  If that doesn't work, then WS1 will do a hard reset.

This also allows me to have a timeout that's twice as long as your 
driver, so my timeout occurs in WS0, not WS1.

> At least, I don't thinks " pre-timeout will probably rarely be used"
> is a good idea for a server.
> in another word, in a server ,pre-timeout should always be used.

Except that few servers today support pre-timeout, so customers won't 
depend on it.

>> You should probably do this *after* calling platform_get_irq_byname().
>
>   it just dose (pdev->) dev->driver_data = gwdt
> If we got gwdt, we can do that.
>
> But maybe I miss something(or a rule of usage),  so please let know
> why this has to be called  *after* calling platform_get_irq_byname().

It's just so that you can avoid calling kzalloc() if the 
platform_get_irq_byname() fails.  It's not important.

> I think I don't need to print "watchdog",   dev_warn(dev,  has help us on this.
> If you do so , the message will be "watchdog: watchdog0: watchdog is
> already enabled"

Ok.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
