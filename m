From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH v7 0/3] Add clockevent for timer-nps driver to
 NPS400 SoC
Date: Thu, 17 Nov 2016 09:50:35 -0800
Message-ID: <d3ae0f3b-a343-1e34-533b-3bc640c24fed@synopsys.com>
References: <1479277873-18994-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479277873-18994-1-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/15/2016 10:31 PM, Noam Camus wrote:
> From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Change log
> ---
> V6 --> V7
> Apply several comments made by Daniel Lezcano:
> 1) Remove CLOCK_EVT_FEAT_PERIODIC support. This way it is
>  pure oneshot driver. This simplifies driver so that:
>  nps_clkevent_add_thread()
>  nps_clkevent_rm_thread()
>  are more clearer without any vague logic if to change
>  TSI bit of current HW thread or not.
> 2) tick_resume is also calls nps_clkevent_rm_thread()
> 3) Few (hopefully last) typo fixes. 
> 
> V5 --> V6
> Apply several comments made by Daniel Lezcano:
> 1) nps_get_timer_clk() - use clk_put() on error scenario
> 2) nps_get_timer_clk() - return EINVAL and not plain 1
> 3) Fix typos in log (double checked with spell checker)
> 
> V4 --> V5
> Apply several comments made by Daniel Lezcano:
> 1) Add __init attribute to nps_get_timer_clk()
> 2) Fix return value of nps_get_timer_clk()
>  when failing to get clk rate
> 3) Change clocksource rate from 301 -> 300
> 
> V3 --> V4
> Main changes are [Thanks for the review]:
> Fix many typos at log [Daniel]
> Add handling for bad return values [Daniel and Thomas]
> Replace use of internal irqchip pointers with existing IRQ API [Thomas]
> Provide interrupt handler (percpu) with dev_id equal to evt [Thomas]
> Fix passing *clk by reference to nps_get_timer_clk() [Daniel]
> 
> V2 --> V3
> Apply Rob Herring comment about backword compatibility
> 
> V1 --> V2
> Apply Daniel Lezcano comments:
> 	CLOCKSOURCE_OF_DECLARE return value
> 	update hotplug callbacks usage
> 	squash of 2 first commits.
> In this version I created new commit to serve as preperation for adding clockevents.
> This way the last patch is more readable with clockevent content.
> ---
> 
> In first version of this driver we supported clocksource for the NPS400.
> The support for clockevent was taken from Synopsys ARC timer driver.
> This was good for working with our simulator of NPS400.
> However in NPS400 ASIC the timers behave differently than simulation.
> The timers in ASIC are shared between all threads whithin a core
> and hence need different driver to support this behaviour.
> 
> The idea of this design is that we got 16 HW threads per core
> each represented at bimask in a shared register in this core.
> So when thread wants that next clockevent expiration will produce
> timer interrupt to itself the correspondance bit in this register
> should be set.
> So theoretically if all 16 bits are set then all HW threads will get
> timer interrupt on next expiration of timer 0.
> 
> Note that we use Synopsys ARC design naming convention for the timers
> where:
> timer0 is used for clockevents
> timer1 is used for clocksource.
> 
> Noam Camus (3):
>   soc: Support for NPS HW scheduling
>   clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
>   clocksource: Add clockevent support to NPS400 driver
> 
>  .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
>  .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
>  .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++
>  arch/arc/plat-eznps/include/plat/ctop.h            |    2 -
>  drivers/clocksource/timer-nps.c                    |  223 ++++++++++++++++++--
>  include/soc/nps/mtm.h                              |   59 +++++
>  6 files changed, 294 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
>  create mode 100644 include/soc/nps/mtm.h

Added to ARC for-next !

Thx,
-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
