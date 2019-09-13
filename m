From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 0/5] irqchip/irq-bcm7038-l1 updates
Date: Fri, 13 Sep 2019 12:15:37 -0700
Message-ID: <20190913191542.9908-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marc, Jason, Thomas,

This patch series contains some updates from our internal tree to
support power management and allow configuring specific instances of the
brcm,bcm7038-l1-intc to leave some interrupts untouched and how the
firmware might have configured them.

Changes in v2:

- dropped the accidental fixup patch that made it to the list and squash
  it with patch #1 as it should have

Florian Fainelli (4):
  dt-bindings: Document brcm,irq-can-wake for brcm,bcm7038-l1-intc.txt
  irqchip/irq-bcm7038-l1: Enable parent IRQ if necessary
  dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
  irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask

Justin Chen (1):
  irqchip/irq-bcm7038-l1: Add PM support

 .../brcm,bcm7038-l1-intc.txt                  |   9 ++
 drivers/irqchip/irq-bcm7038-l1.c              | 117 +++++++++++++++++-
 2 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.17.1
