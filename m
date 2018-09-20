From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V8 0/2] irqchip: add C-SKY APB bus interrupt controller
Date: Thu, 20 Sep 2018 16:25:18 +0800
Message-ID: <cover.1537412037.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, c-sky_gcc_upstream@c-sky.com, green.hu@gmail.com, arnd@arndb.de, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

 - Dt-bindings documentation
 - irq-csky-apb-intc driver

Guo Ren (2):
  irqchip: add C-SKY APB bus interrupt controller
  dt-bindings: interrupt-controller: C-SKY APB intc

 .../interrupt-controller/csky,apb-intc.txt         |  62 +++++
 drivers/irqchip/Kconfig                            |   8 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-csky-apb-intc.c                | 260 +++++++++++++++++++++
 4 files changed, 331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
 create mode 100644 drivers/irqchip/irq-csky-apb-intc.c

-- 
2.7.4
