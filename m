From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/2] irqchip: ti-sci-intr: Add support for K3 Interrupt Router
Date: Sat, 6 Oct 2018 12:58:10 +0530
Message-ID: <20181006072812.15814-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Device Tree Mailing List <devicetree@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds irqchip driver for Texas Instruments' K3 based
Interrupt Router.

This series depends on TISCI IRQ management support posted here[1]

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-October/605784.html

Lokesh Vutla (2):
  dt-bindings: irqchip: Introduce TISCI Interrupt router bindings
  irqchip: ti-sci-intr: Add support for Interrupt Router driver

 .../interrupt-controller/ti,sci-intr.txt      |  83 +++++
 MAINTAINERS                                   |   2 +
 drivers/irqchip/Kconfig                       |  11 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-ti-sci-intr.c             | 325 ++++++++++++++++++
 5 files changed, 422 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 drivers/irqchip/irq-ti-sci-intr.c

-- 
2.19.0
