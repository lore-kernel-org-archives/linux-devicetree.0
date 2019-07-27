From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] MIPS: lantiq: EBU interrupt controller and generalization
Date: Sat, 27 Jul 2019 19:53:10 +0200
Message-ID: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org, hauke@hauke-m.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The relevant EBU code which is touched by this series is:
- initialization of the EBU WRDIS register on XWAY SoCs (this was part
  of arch/mips/lantiq/xway/sysctrl.c)
- initialization of the global ltq_ebu_membase variable on XWAY and
  Falcon SoCs (this was part of arch/mips/lantiq/xway/sysctrl.c and
  arch/mips/lantiq/falcon/sysctrl.c)
- handling the chained PCI_INTA interrupt (which was previously managed
  by arch/mips/lantiq/irq.c)
- configuring the PCI_INTA interrupt line (which was previously done by
  arch/mips/pci/pci-lantiq.c)

Instead of having the code spread across multiple source code files
this moves them to one "EBU" driver in arch/mips/lantiq/ebu.c utilizing
the irqchip subsystem to implement the PCI_INTA interrupt line.

While here this adds the dt-bindings documentation for the EBU IP block.

I believe that this series should go through the MIPS tree. However, it
would be great to have the irqchip maintainer review patch #3.



Martin Blumenstingl (5):
  dt-bindings: MIPS: lantiq: Add documentation for the External Bus Unit
  MIPS: lantiq: use a generic "EBU" driver for Falcon and XWAY SoCs
  MIPS: lantiq: add an irq_domain and irq_chip for EBU
  MIPS: dts: lantiq: danube: mark the ebu0 node as interrupt-controller
  MIPS: dts: lantiq: danube: easy50712: route the PCI_INTA IRQ through
    EBU

 .../bindings/mips/lantiq/lantiq,ebu.yaml      |  53 ++++
 arch/mips/boot/dts/lantiq/danube.dtsi         |   3 +
 arch/mips/boot/dts/lantiq/easy50712.dts       |   4 +-
 .../include/asm/mach-lantiq/xway/lantiq_soc.h |   5 -
 arch/mips/lantiq/Makefile                     |   2 +-
 arch/mips/lantiq/ebu.c                        | 238 ++++++++++++++++++
 arch/mips/lantiq/falcon/sysctrl.c             |  17 +-
 arch/mips/lantiq/irq.c                        |  11 -
 arch/mips/lantiq/xway/sysctrl.c               |  21 +-
 arch/mips/pci/pci-lantiq.c                    |   4 -
 10 files changed, 308 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
 create mode 100644 arch/mips/lantiq/ebu.c

-- 
2.22.0
