From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V9 0/8] C-SKY(csky) Linux Kernel Drivers
Date: Mon,  1 Oct 2018 09:35:55 +0800
Message-ID: <cover.1538355281.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, f.fainelli@gmail.com, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

>From "PATCH V5 00/30] C-SKY(csky) Linux Kernel Port" I seperated the
drivers from the patchset. I've sent driver patches with "V5 V6 V7 V8".

Now is V9. The changelog is in every patch.

Perhaps I should seperate driver patchset earlier and the csky port patchset
is too big now.

Any feedback is welcome, thx for all people review my patchset.

Best Regards

Guo Ren (8):
  irqchip: add C-SKY SMP interrupt controller
  dt-bindings: interrupt-controller: C-SKY SMP intc
  clocksource: add C-SKY SMP timer
  dt-bindings: timer: C-SKY Multi-processor timer
  dt-bindings: interrupt-controller: C-SKY APB intc
  irqchip: add C-SKY APB bus interrupt controller
  dt-bindings: timer: gx6605s SOC timer
  clocksource: add gx6605s SOC system timer

 .../interrupt-controller/csky,apb-intc.txt         |  62 +++++
 .../bindings/interrupt-controller/csky,mpintc.txt  |  40 ++++
 .../bindings/timer/csky,gx6605s-timer.txt          |  42 ++++
 .../devicetree/bindings/timer/csky,mptimer.txt     |  42 ++++
 drivers/clocksource/Kconfig                        |  16 ++
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/csky_mptimer.c                 | 176 ++++++++++++++
 drivers/clocksource/timer-gx6605s.c                | 150 ++++++++++++
 drivers/irqchip/Kconfig                            |  16 ++
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-csky-apb-intc.c                | 260 +++++++++++++++++++++
 drivers/irqchip/irq-csky-mpintc.c                  | 195 ++++++++++++++++
 include/linux/cpuhotplug.h                         |   1 +
 13 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
 create mode 100644 drivers/clocksource/csky_mptimer.c
 create mode 100644 drivers/clocksource/timer-gx6605s.c
 create mode 100644 drivers/irqchip/irq-csky-apb-intc.c
 create mode 100644 drivers/irqchip/irq-csky-mpintc.c

-- 
2.7.4
