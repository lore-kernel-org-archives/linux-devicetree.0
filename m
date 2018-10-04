From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V10 0/8] C-SKY(csky) Linux Kernel Driver
Date: Fri,  5 Oct 2018 01:22:20 +0800
Message-ID: <cover.1538672812.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

This is about 10th patchset for C-SKY linux drivers. All patches have
been checked by checkpatch.pl.

Any feedback is welcome, thx for all people review my patchset.

If you finish the review for the patchset, please give a Reviewed-By
/ Acked-By and I'll record it in the commit-msg.

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
 drivers/irqchip/irq-csky-mpintc.c                  | 197 +++++++++++++++
 include/linux/cpuhotplug.h                         |   1 +
 13 files changed, 1024 insertions(+)
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
