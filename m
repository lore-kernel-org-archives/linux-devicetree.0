From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 0/2] PINT irqchip driver for NXP LPC18xx family
Date: Sat,  2 Apr 2016 18:35:22 +0200
Message-ID: <1459614924-32670-1-git-send-email-manabian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: Joachim Eastwood <manabian@gmail.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LPC1850 has no less than 3 GPIO interrupt blocks. One of these
blocks is called 'gpio pin interrupt' or just PINT. LPC1850 PINT can
handle up to 8 interrupts and these have a one-to-one relationship with
the main interrupt controller (NVIC).

The interrupts on PINT can be either level or edge trigger and supports
any polarity. This patch set adds a irqchip driver for PINT on LPC18xx.

This version address the comments from Thomas and Rob.

Changes since v1:
 - use irq_gc_ack_set_bit for edge ack
 - switch to generic functions on level mask/unmask
 - use revmap to look up hwirq in handler
 - describe the interrupts property better in dt doc

Joachim Eastwood (2):
  irqchip: add lpc18xx gpio pin interrupt driver
  devicetree: document NXP LPC1850 PINT irq controller binding

 .../interrupt-controller/nxp,lpc1850-gpio-pint.txt |  26 +++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-lpc18xx-gpio-pint.c            | 219 +++++++++++++++++++++
 4 files changed, 251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
 create mode 100644 drivers/irqchip/irq-lpc18xx-gpio-pint.c

-- 
2.8.0
