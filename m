From: Noam Camus <noamca@mellanox.com>
Subject: [PATCH v6 0/3] Add clockevent for timer-nps driver to NPS400 SoC
Date: Mon, 14 Nov 2016 11:40:44 +0200
Message-ID: <1479116447-29483-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamca@mellanox.com>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca@mellanox.com>

Change log
---
V5 --> V6
Apply several comments made by Daniel Lezcano:
1) nps_get_timer_clk() - use clk_put() on error scenario
2) nps_get_timer_clk() - return EINVAL and not plain 1
3) Fix typos in log (double checked with spell checker)

V4 --> V5
Apply several comments made by Daniel Lezcano:
1) Add __init attribute to nps_get_timer_clk()
2) Fix return value of nps_get_timer_clk()
 when failing to get clk rate
3) Change clocksource rate from 301 -> 300

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
 drivers/clocksource/timer-nps.c                    |  266 ++++++++++++++++++--
 include/soc/nps/mtm.h                              |   59 +++++
 6 files changed, 337 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
 create mode 100644 include/soc/nps/mtm.h
