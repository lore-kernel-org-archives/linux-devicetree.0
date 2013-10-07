From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv0,RESEND] Add support for Intersil ISL12057 I2C RTC/Alarm chip
Date: Mon, 07 Oct 2013 20:04:45 +0200
Message-ID: <878uy5vtxe.fsf@natisbad.org>
References: <87ob787nf6.fsf@natisbad.org>
	<20131002111423.GO22259@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131002111423.GO22259-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org> (Mark
	Rutland's message of "Wed, 2 Oct 2013 12:14:23 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "grant.likely@linaro.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring@calxeda.com" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rtc-linux@googlegroups.com" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Tue, Oct 01, 2013 at 09:21:01PM +0100, Arnaud Ebalard wrote:
>> Hi,
>> 
>> Netgear ReadyNAS 102 (Armada 370-base) NAS includes an Intersil ISL12057
>> I2C RTC/Alarm chip. As part of an effort to get full support for the NAS
>> in mainline kernel, I wrote a driver for the chip based on ISL1208 one
>> developed by Hebert Valerio Riedel. The patch below is an updated resend
>> of the one I submitted on August 3 (i.e. holidays), but got no reply
>> for. See
>> 
>>   https://groups.google.com/forum/#!topic/rtc-linux/ypqMloOezj0
>> 
>> If possible, I would like to be able to get it mainline in 3.13, and
>> pushed required DT bindings for ReadyNAS 102 to avoid the NAS to wake up
>> in the 70s.
>> 
>> Setting and retrieving time works as expected at startup and shutdown.
>> Also, alarm bit is set in status register when the alarm is triggered.
>> 
>> Some things worth mentioning:
>>  - on my platform, the Alarm IRQ is not connected to the SoC but to a
>>    power chip, so I cannot test the alarm IRQ handling code of the
>>    patch. I'd be happy to get feedback if someone has the same hardware.
>>  - nonetheless, when the alarm is set and the NAS is powered off, it
>>    gets woken up, i.e. the alarm setting code does work.
>>  - trying to interact w/ the clock using userland tools (Debian jessie)
>>    makes me wonder what I missed:
>> 
>>    root@humble:/sys/class/rtc/rtc0# hwclock -r
>>    hwclock: select() to /dev/rtc0 to wait for clock tick timed out: Success
>> 
>>    root@humble:/tmp# gcc rtctest.c
>>    root@humble:/tmp# ./a.out
>> 
>>                           RTC Driver Test Example.
>> 
>>     Counting 5 update (1/sec) interrupts from reading /dev/rtc0:
>> 
>>     [ nothing happens ]
>> 
>>     I tried and find some documentation on the topic to understand where
>>     the issue comes from but found nothing obvious.
>
> Forgive me if I'm mistaken, but you mentioned above that interrupts
> aren't wired up on your platform, and judging by the output the test
> program seems to be relying on them.

This is correct. I spent some more time digging about what I should do
an it's not very clear to me. I found some informative elements about
IRQ handling and RTC in

 commit c9f5c7e7a8 rtc: rtc-spear: Provide flag for no support of UIE mode
 commit 4a649903f9 rtc: Provide flag for rtc devices that don't support UIE

So I modified the driver to have uie_unsupported set to 1 for testing. This
makes hwclock happy but does not please rtctest.c, because commit
4a649903f9 modified the interface to have -EINVAL returned.

root@humble:/tmp# hwclock -r
Sun 06 Oct 2013 09:38:12 PM CEST  -0.107813 seconds
root@humble:/tmp# ./a.out 

                        RTC Driver Test Example.

RTC_UIE_ON ioctl: Invalid argument


Even if I modify the code to pass the UIE related test
(i.e. s/ENOTTY/EINVAL/) then I get stuck on RTC_AIE_ON
test. 


Anyway, to come back to my initial issue, I thinks my problem is that
the ReadyNAS 102 has the ISL 12057 Alarm IRQ pin connected to a power
chip instead of the SoC, i.e. there is no way for the SoC to get
interrupts from the chips and the RTC interface does not seem (at least
to me) to provide a trivial whay to handle that. As I am unable to
understand what I should do and not do from the documentation, I am
basically asking RTC experts for guidelines on what to do.

One solution^Wworkaround would be for me to completely remove the alarm
related code (at least initially) and provide a basic driver that only
support the clock function of the chip. Alarm support could then be
added later by someone with an IRQ pin routed to its SoC.

Another possible path could be to provide some DT (i.e. OF) knob in order
to make ISL 12057 code (or possibly generic RTC code) aware that alarm
IRQ are indeed supported by the chip but not routed to the processor
itself. Regarding the IRQ handling code, care should be taken in that
case to review it as I cannot test it myself.


>> I intend to provide some documentation in next round and fix reported
>> issues. Additionally, I wonder why ISL1208 code has no specific mutex
>> protection for access and changes. I also followed that path in attached
>> driver but I guess this is something that should be improved.
>
> The devicetree binding must go in when the driver is added, rather than
> later.

As soon as I know what should be fixed I will write some documentation
if needed. As you write below, if the driver remains as is (trivial
interface), it will not be needed. On the contrary, if some DT knob is
needed, I will provide documentation once the code in a next round of
the patch set.


> Given the above known issue, I think that should be fixed up before the
> driver gets merged -- 
> If this driver has known issues then should those not be fixed before
> merging it?

I don't think the driver has issues per se. All the problems come from
the fact that the platform I have does not have the chip alarm interrupt
line routed to the SoC:

 - someone with an ISL 12057 with a routed alarm interrupt pin could
   test the IRQ-related code of the driver; otherwise, that code - based
   on ISL 1208 one - should be carefully reviewed.
 - some direction is needed about RTC interface in order to be able to
   express the fact that the chip supports setting an alarm which can
   trigger an interrupt at a given time but that this interrupt is for
   someone else than the SoC.


>> +#ifdef CONFIG_OF
>> +static struct of_device_id isl12057_dt_match[] = {
>> +       { .compatible = "isil,isl12057" },
>> +       { },
>> +};
>> +#endif
>
> It looks like this is a simple device with only an interrupt (no clocks,
> regulators, other elements), so that can go under
> Documentation/devicetree/bindings/i2c/trivial-devices.txt.

Will do that if the interface remains as is.


> Also, the "isil" vendor prefix doesn't seem to be documented. Could you
> please create a patch adding it to
> Documentation/devicetree/bindings/vendor-prefixes.txt?

will do. I went for "isil" because it is the stock ticker symbol for
Intersil (FWIW, https://lkml.org/lkml/2013/7/11/170).

Cheers,

a+

ps: sorry if your received the mail twice but google smtp servers decide
to drop my first email. 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
