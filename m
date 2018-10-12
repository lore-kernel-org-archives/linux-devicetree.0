From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V12 0/8] C-SKY(csky) Linux Kernel Driver
Date: Fri, 12 Oct 2018 20:02:01 +0800
Message-ID: <cover.1539315341.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

This is about 12th patchset for C-SKY linux drivers and it should pair
with 8th kernel patchset.

Changelog:
 - Remove the set_irq_createmapping call back in csky-mp-intc.c.
 - Convert the cpumask to an interrupt-controller specific representation
   in driver's code, and not the SMP code's, and also modify the related
   codes in csky kernel patchset.
 - Add COMPILE_TEST for csky_mp_timer.
 - Fixup smp boot error, cpuhp_setup_state must after timer_of_init()
   for csky_mp_timer.

Any feedback is welcome, thx for all people review my patchset.

Guo Ren (8):
  irqchip: add C-SKY SMP interrupt controller
  dt-bindings: interrupt-controller: C-SKY SMP intc
  irqchip: add C-SKY APB bus interrupt controller
  dt-bindings: interrupt-controller: C-SKY APB intc
  clocksource: add C-SKY SMP timer
  dt-bindings: timer: C-SKY Multi-processor timer
  clocksource: add gx6605s SOC system timer
  dt-bindings: timer: gx6605s SOC timer

 .../interrupt-controller/csky,apb-intc.txt         |  62 +++++
 .../bindings/interrupt-controller/csky,mpintc.txt  |  40 +++
 .../bindings/timer/csky,gx6605s-timer.txt          |  42 ++++
 .../devicetree/bindings/timer/csky,mptimer.txt     |  42 ++++
 drivers/clocksource/Kconfig                        |  18 ++
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/timer-gx6605s.c                | 154 ++++++++++++
 drivers/clocksource/timer-mp-csky.c                | 173 +++++++++++++
 drivers/irqchip/Kconfig                            |  17 ++
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-csky-apb-intc.c                | 274 +++++++++++++++++++++
 drivers/irqchip/irq-csky-mpintc.c                  | 198 +++++++++++++++
 include/linux/cpuhotplug.h                         |   1 +
 13 files changed, 1025 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
 create mode 100644 drivers/clocksource/timer-gx6605s.c
 create mode 100644 drivers/clocksource/timer-mp-csky.c
 create mode 100644 drivers/irqchip/irq-csky-apb-intc.c
 create mode 100644 drivers/irqchip/irq-csky-mpintc.c

-- 
2.7.4
