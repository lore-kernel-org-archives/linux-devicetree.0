From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 0/3] Amazon's Annapurna Labs Fabric Interrupt Controller
Date: Wed, 5 Jun 2019 09:54:10 +0300
Message-ID: <1559717653-11258-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, Talel Shenhar <talel@amazon.com>
List-Id: devicetree@vger.kernel.org

This series introduces support for Amazon's Annapurna Labs Fabric Interrupt
Controller.

The Amazon's Annapurna Labs FIC (Fabric Interrupt Controller) has 32
inputs/sources. The output of this interrupt controller can be legacy-wired
output or, in case embedded inside PCIe devices, msi-x message. This FIC may
be cascaded into another FIC or connected directly to the main CPU
Interrupt Controller (e.g. GIC).

The FIC is a flexible HW unit that is embedded inside different parts of
the Amazon's Annapurna Labs chips. It can be a simple level 2 interrupt
controller which is then configured as a wired interrupt controller that
aggregates events from different units, or, while embedded inside PCIe
device, it can generate MSI-X messages based on the tables configured to
that PCIe device or can be configured to generate wired interrupt. 



Talel Shenhar (3):
  dt-bindings: interrupt-controller: Amazon's Annapurna Labs FIC
  irqchip: al-fic: Introduce Amazon's Annapurna Labs Fabric Interrupt
    Controller Driver
  irqchip: al-fic: Introducing support for MSI-X

 .../interrupt-controller/amazon,al-fic.txt         |  22 ++
 MAINTAINERS                                        |   7 +
 drivers/irqchip/Kconfig                            |  11 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-al-fic.c                       | 388 +++++++++++++++++++++
 include/linux/irqchip/al-fic.h                     |  23 ++
 6 files changed, 452 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 create mode 100644 drivers/irqchip/irq-al-fic.c
 create mode 100644 include/linux/irqchip/al-fic.h

-- 
2.7.4
