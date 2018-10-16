From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V13 0/4] C-SKY(csky) Linux Intc Driver
Date: Tue, 16 Oct 2018 22:08:18 +0800
Message-ID: <cover.1539696960.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

This is about 13th patchset for C-SKY linux intc drivers and it should pair
with 9th kernel patchset. Timer drivers are seperated according to
requirements.

This version patch improve the comment in commit-msg and move the
changelog to the end with "---", so git am will ignore the changelog.

Hope it could be merged into linux-4.20 and I'm very grateful to any help.

Guo Ren (4):
  irqchip: add C-SKY SMP interrupt controller
  dt-bindings: interrupt-controller: C-SKY SMP intc
  irqchip: add C-SKY APB bus interrupt controller
  dt-bindings: interrupt-controller: C-SKY APB intc

 .../interrupt-controller/csky,apb-intc.txt         |  62 +++++
 .../bindings/interrupt-controller/csky,mpintc.txt  |  40 +++
 drivers/irqchip/Kconfig                            |  17 ++
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-csky-apb-intc.c                | 274 +++++++++++++++++++++
 drivers/irqchip/irq-csky-mpintc.c                  | 198 +++++++++++++++
 6 files changed, 593 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
 create mode 100644 drivers/irqchip/irq-csky-apb-intc.c
 create mode 100644 drivers/irqchip/irq-csky-mpintc.c

-- 
2.7.4
