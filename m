From: Rich Felker <dalias@libc.org>
Subject: [PATCH v6 0/2] J-Core interrupt controller support
Date: Thu, 04 Aug 2016 04:30:36 +0000
Message-ID: <cover.147018b6529.git.dalias@libc.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Updated based on feedback from Thomas Gleixner. Removal of unnecessary
data allowed some simplification. Magic numbers have been replaced
with meaningful (I hope) macro constants, comments added, and minor
style issues fixed.

Also, driver was made conditional in Kconfig to avoid it showing up in
configurations where it's not relevant.

Rich


Rich Felker (2):
  of: add J-Core interrupt controller bindings
  irqchip: add J-Core AIC driver

 .../bindings/interrupt-controller/jcore,aic.txt    | 26 ++++++
 drivers/irqchip/Kconfig                            |  7 ++
 drivers/irqchip/Makefile                           |  1 +
 drivers/irqchip/irq-jcore-aic.c                    | 94 ++++++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
 create mode 100644 drivers/irqchip/irq-jcore-aic.c

-- 
2.8.1
