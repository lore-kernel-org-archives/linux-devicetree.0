From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/3] Add clockevet for timer-nps driver to NPS400 SoC
Date: Sun, 6 Nov 2016 19:44:55 +0200
Message-ID: <1478454298-381-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Change log
---
V3 --> V4
Main changes are [Thanks for the review]:
Fix many typos at log [Daniel]
Add handling for bad return values [Daniel and Thomas]
Replace use of internal irqchip pointers with existing IRQ API [Thomas]
Provide interrupt handler (percpu) with dev_id equal to evt [Thomas]
Fix passing *clk by reference to nps_get_timer_clk() [Daniel]

V2 --> V3
Apply Rob Herring comment about backword compatibility

V1 --> V2
Apply Daniel Lezcano comments:
	CLOCKSOURCE_OF_DECLARE return value
	update hotplug callbacks usage
	squash of 2 first commits.
In this version I created new commit to serve as preperation for adding clockevents.
This way the last patch is more readable with clockevent content.
---

In first version of this driver we supported clocksource for the NPS400.
The support for clockevent was taken from Synopsys ARC timer driver.
This was good for working with our simulator of NPS400.
However in NPS400 ASIC the timers behave differently than simulation.
The timers in ASIC are shared between all threads whithin a core
and hence need different driver to support this behaviour.

The idea of this design is that we got 16 HW threads per core
each represented at bimask in a shared register in this core.
So when thread wants that next clockevent expiration will produce
timer interrupt to itself the correspondance bit in this register
should be set.
So theoretically if all 16 bits are set then all HW threads will get
timer interrupt on next expiration of timer 0.

Note that we use Synopsys ARC design naming convention for the timers
where:
timer0 is used for clockevents
timer1 is used for clocksource.

Noam Camus (3):
  soc: Support for NPS HW scheduling
  clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
  clocksource: Add clockevent support to NPS400 driver

 .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
 .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
 .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++
 arch/arc/plat-eznps/include/plat/ctop.h            |    2 -
 drivers/clocksource/timer-nps.c                    |  264 ++++++++++++++++++--
 include/soc/nps/mtm.h                              |   59 +++++
 6 files changed, 335 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
 create mode 100644 include/soc/nps/mtm.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
