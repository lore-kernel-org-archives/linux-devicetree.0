From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RESEND 0/2] irqchip: Broadcom Set Top Box Level-2 interrupt controller
Date: Tue, 20 May 2014 12:13:47 -0700
Message-ID: <1400613229-19049-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: arm@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Brian Norris <computersforpeace@gmail.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel@vger.kernel.org, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

(Resending to include Jason Cooper)

Hi Thomas, Jason,

This patch set adds an irqchip driver for the Broadcom Set Top Box Level-2
interrupt controller hardware, as well as a corresponding Device Tree binding
document.

Thanks!

Florian Fainelli (2):
  irqchip: add Broadcom Set Top Box Level-2 interrupt controller
  Documentation: add Broadcom STB Level-2 interrupt controller binding

 .../bindings/interrupt-controller/brcm,l2-intc.txt |  29 +++
 drivers/irqchip/Kconfig                            |   6 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-brcmstb-l2.c                   | 231 +++++++++++++++++++++
 4 files changed, 267 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
 create mode 100644 drivers/irqchip/irq-brcmstb-l2.c

-- 
1.9.1

