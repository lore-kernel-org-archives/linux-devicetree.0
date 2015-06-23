From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [non-pretimeout,4/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 24 Jun 2015 01:01:04 +0800
Message-ID: <CADyBb7vNz3dgH=ecsFm7pP=-xR+mNq37rkdoyv-GB_dRU5XtuA@mail.gmail.com>
References: <1433958452-23721-5-git-send-email-fu.wei@linaro.org>
	<20150611162810.GA22711@roeck-us.net>
	<CADyBb7uGT9bTNiG7524wrd14xiFfgwoDNMq1_J2HDxiK-ogc8Q@mail.gmail.com>
	<20150623152131.GA9990@roeck-us.net>
	<CADyBb7seRmCFu3jhzUTJu7XemH=GjXRopx6EjfSzBypp95tn=w@mail.gmail.com>
	<20150623164314.GB20017@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150623164314.GB20017-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter

On 24 June 2015 at 00:43, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Wed, Jun 24, 2015 at 12:17:19AM +0800, Fu Wei wrote:
>> Hi Guenter,
>>
>> you always can provide help very quickly, thank you very much :-)
>>
>> On 23 June 2015 at 23:21, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> > On Tue, Jun 23, 2015 at 09:26:35PM +0800, Fu Wei wrote:
>> >> Hi Guenter,
>> > [ ...]
>> >
>> >> >
>> >> >> + *       When the first timeout occurs, WS0(SPI or LPI) is triggered,
>> >> >> + *       the second timeout period(as long as the first timeout period) starts.
>> >> >
>> >> > no longer accurate if WOR is used for the second period.
>> >> >
>> >> >> + *       In WS0 interrupt routine, panic() will be called for collecting
>> >> >> + *       crashdown info.
>> >> >> + *       If system can not recover from WS0 interrupt routine, then second
>> >> >> + *       timeout occurs, WS1(reset or higher level interrupt) is triggered.
>> >> >> + *       The two timeout period can be set by WOR(32bit).
>> >> >
>> >> > The second timeout period is determined by ...
>> >> >
>> >> >> + *       WOR gives a maximum watch period of around 10s at the maximum
>> >> >> + *       system counter frequency.
>> >> >> + *       The System Counter shall run at maximum of 400MHz.
>> >> >
>> >> > "... at the maximum system counter frequency of 400 MHz.", and drop the
>> >> > last sentence.
>> >>
>> >> For the second timeout period,  I have discussed with a kdump developers,
>> >> (1)10s maybe not good enough for all the case of panic + kdump, so
>> >> maybe we still need to use WCV in the second timeout period
>> >> (2)in the second timeout period, maybe we need to programme WCV for
>> >> two reason: a, trigger WS1 to reboot system ASAP; b, feed the watchdog
>> >> without cleanning WS0 flag.
>> >>
>> >> WHY we want to feed the watchdog (keepalive) without cleanning WS0 flag??
>> >> REASON:
>> >> (1)if the system context is large, we may need to feed the dog until
>> >> we get all the things backed up.
>> >> (2)if system goes wrong,  WS0 triggered, then panic--> kdump. if we
>> >> feed the dog by WRR or programming WOR, WS0 flag will be cleaned. Once
>> >> system goes wrong again, then panic again.....
>> >> So this system will be in a panic--kdump--panic--kdump loop, have not
>> >> chance to reset.
>> >>
>> >> So if we are in the second timeout period, we may need to always programme WCV.
>> >>
>> > The crashdump kernel is supposed to reload the watchdog driver, which will ping
>> > the watchdog. If it isn't able to do that in 10 seconds, something is wrong.
>>
>> yes, 10s maybe not enough for all case.
>> When I tested kdump on arm64, sometimes , it took 20s. So I am
>> thinking : can we make the max value of pretimeout > 10s in this
>> driver.
>>
> It takes more than 10 seconds to load the crashdump kernel,
> or it takes more than 10 seconds to complete the dump ?

It takes more than 10 seconds to boot into kernel(from panic to finish
devices init in crashdump kernel).
I thinks that maybe depend on hardware or soc.
As I said, 10 seconds maybe not enough for all cases.

For completing the dump, 10 seconds maybe not enough for some case(big
RAM, dump to network and so on),
that is why I added "ping without cleaning WS0" support in the second stage.

>
>>
>> >
>> >> >> +
>> >> >> +     status = readl_relaxed(gwdt->control_base + SBSA_GWDT_WCS);
>> >> >> +     if (status & SBSA_GWDT_WCS_WS1) {
>> >> >> +             dev_warn(dev, "System reset by WDT(WCV: %llx)\n",
>> >> >> +                      sbsa_gwdt_get_wcv(wdd));
>> >> >
>> >> > WCV here only tells us how many clock cycles were executed since the
>> >> > system started (or something like that). So I still don't understand
>> >> > why it is valuable to print that number.
>> >>
>> >> this number provides the time of system reset, I thinks that may help
>> >> admin to analyse the system failure.
>> >>
>> > It doesn't mean anything to anyone but you since it is not in a well defined
>> > time scale.
>>
>> maybe I should convert it to second?
>> I think the original value is better?
>>
>
> I think you should drop it.

OK, will do in my next patchset.

But my option is if hardware provide this info, and it can let admin
know the crash time.  maybe it can help to debug.
 :-)

>
> Guenter



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
