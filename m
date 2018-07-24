From: Parthiban Nallathambi <pn@denx.de>
Subject: [PATCH 0/3] Add Actions Semi Owl family sirq support
Date: Tue, 24 Jul 2018 17:02:16 +0200
Message-ID: <20180724150219.1807724-1-pn@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, manivannan.sadhasivam@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sravanhome@gmail.com, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br, Parthiban Nallathambi <pn@denx.de>
List-Id: devicetree@vger.kernel.org

This patch series add support for external interrupt controller
in Actions Semi Owl famil of SoC's (S500, S700 and S900). Actions
provides support for external interrupt controller to be connected
with it's SoC's using 3 SIRQ pins.

Each line can be configures independently, i.e 3 independent external
interrupt controller can be connected and managed parallely.

Device tree node is created only for S700 after testing it in Cubieboard7.

Thanks,
Parthiban
Saravanan

Parthiban Nallathambi (3):
  dt-bindings: interrupt-controller: Actions external interrupt
    controller
  drivers/irqchip: Add Actions external interrupts support
  arm64: dts: actions: Add sirq node for Actions Semi S700

 .../interrupt-controller/actions,owl-sirq.txt      |  34 +++
 arch/arm64/boot/dts/actions/s700.dtsi              |  11 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-owl-sirq.c                     | 275 +++++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
 create mode 100644 drivers/irqchip/irq-owl-sirq.c

-- 
2.14.4
