Return-Path: <SRS0=rlds=L3=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
 <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
 <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org>
 <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
 <a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org>
 <CAMuHMdV3Ai+CLHBJ_GH9d=JN0cmiaQT3eSfNGRgiiMffgK7stg@mail.gmail.com>
 <ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org>
 <TYXPR01MB1568B71126AB4A2BDB78BF1F8A000@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
 <TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAL_JsqJorfOhuwiRk9vbfZ_6B8s-EM7k+RTJmC4La76NzY5tuw@mail.gmail.com>
 <TY1PR01MB15629984AA415D4F876B86038A040@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e4b750b4-2e99-ac24-d7aa-db05a6872a8b@linaro.org>
Date: Thu, 13 Sep 2018 15:17:23 +0200
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB15629984AA415D4F876B86038A040@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 11/09/2018 20:42, Chris Brandt wrote:
> On Tuesday, September 11, 2018 1, Rob Herring wrote:
>> Well before we get to initcalls, the kernel calls the arch specific
>> time_init() which (on ARM) calls of_clk_init (for all the reasons
>> above) and then timer_probe(). When timer_probe returns, it is
>> expected that you have setup a clocksource and clockevent. If you
>> haven't, then at some point before we get to initcalls we should hang
>> because we're not getting any timer interrupts and time is not
>> advancing.
> 
> What I get now is:
> 
> [    0.000000] timer_probe: no matching timers found
> ...
> ...
>  [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> ...
> ...
> 
> 
> But then later on in boot, I'll get (with my subsys_initcall timer fix)
> 
> ...
> ...
> [    0.000000] SCSI subsystem initialized
> [    0.000000] usbcore: registered new interface driver usbfs
> [    0.000000] usbcore: registered new interface driver hub
> [    0.000000] usbcore: registered new device driver usb
> [    0.000000] clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 28958491609 ns
> [    0.000619] sched_clock: 32 bits at 66MHz, resolution 15ns, wraps every 32537631224ns
> [    0.008599] ostm: used for clocksource
> [    0.018926] ostm: used for clock events
> [    0.133339] clocksource: Switched to clocksource ostm
> [    0.821474] NET: Registered protocol family 2
> [    0.840624] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
> [    0.850549] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> ...
> ...
> 
> 
> 
>> Maybe you
>> just get lucky and it works as long as no thread blocks (e.g. on a
>> msleep).
> 
> You're right. If I put in a msleep() before my timer is up and running, it hangs.
> 
> As far as I can tell, nothing before device_initcall seems to call anything like msleep.
> 
>> If things changed and you can setup a timer in an initcall,
>> then why are folks still trying to do things like early platform
>> drivers. Regular drivers would work and we should be able to
>> completely remove CLK_OF_DECLARE and TIMER_OF_DECLARE.
> 
> I wonder if the reason is because you can't assign a priority to your 
> driver when you declare it with xxx_initcall( ). So, your driver ends up 
> in the same table as all the other drivers and you are not guaranteed the
> order in which they probe. So, the answer was to make a NEW table and 
> register it using TIMER_OF_DECLARE and CLOCK_OF_DECLARE.
> 
> I wonder they just didn't make a clock_initcall() and timer_initcall() 
> instead.

What happens if you place the clk_init() before board_time_init() ? in
arch/sh/kernel/time.c

void __init time_init(void)
{
        if (board_time_init)
                board_time_init();

        clk_init();

        late_time_init = sh_late_time_init;
}



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
