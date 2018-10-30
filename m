From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2 0/2] irqchip: Add support for Renesas RZ/N1 GPIO interrupt multiplexer
Date: Tue, 30 Oct 2018 10:44:36 +0000
Message-ID: <20181030104438.27827-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On RZ/N1 devices, there are lots of GPIO interrupts that are multiplexed before
getting to the GIC interrupt controller. Other than the multiplexing, there is
no other logic applied to the signals.

The multiplexing cannot be handled dynamically because there is another CPU that
runs firmware. It's likely that the firmware will use some of these GPIO
interrupts and so we don't want them to move around.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Split DT bindings into separate patch.
 - Use interrupt-map to allow the GPIO controller info to be specified
   as part of the irq.
 - Don't show status in binding examples.
 - Don't show the soc/board split in binding doc.
 - Renamed struct and funcs from 'girq' to a more comprehenisble 'irqmux'.

Phil Edworthy (2):
  dt-bindings/interrupt-controller: rzn1: Add RZ/N1 gpio irq mux binding
  irqchip: Add support for Renesas RZ/N1 GPIO interrupt multiplexer

 .../interrupt-controller/renesas,rzn1-mux.txt |  92 +++++++
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/rzn1-irq-mux.c                | 235 ++++++++++++++++++
 4 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
 create mode 100644 drivers/irqchip/rzn1-irq-mux.c

-- 
2.17.1
