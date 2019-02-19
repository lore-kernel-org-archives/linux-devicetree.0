From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v4 0/2] irqchip: Add support for Renesas RZ/N1 GPIO interrupt multiplexer
Date: Tue, 19 Feb 2019 15:55:09 +0000
Message-ID: <20190219155511.28507-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On RZ/N1 devices, there are lots of GPIO interrupts that are multiplexed before
getting to the GIC interrupt controller. Other than the multiplexing, there is
no other logic applied to the signals.

The multiplexing cannot be handled dynamically because there is another CPU that
runs firmware. It's likely that the firmware will use some of these GPIO
interrupts and so we don't want them to move around.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v4:
 - Fix DT binding nits
v3:
 - Use 'interrupt-map' DT property to map the interrupts, this is very similar
   to PCIe MSI. The only difference is that we need to get hold of the interrupt
   specifier for the interupts coming into the irqmux.
   I had completely messed up the use of 'interrupt-map' in v2... oops.
 - Do not use a chained interrupt controller.
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

 .../interrupt-controller/renesas,rzn1-mux.txt |  73 +++++++
 drivers/irqchip/Kconfig                       |   9 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/rzn1-irq-mux.c                | 205 ++++++++++++++++++
 4 files changed, 288 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
 create mode 100644 drivers/irqchip/rzn1-irq-mux.c

-- 
2.17.1
