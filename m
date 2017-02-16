From: David Daney <david.daney@cavium.com>
Subject: [PATCH v4 0/6] genirq/gpio: Add driver for ThunderX and OCTEON-TX SoCs
Date: Wed, 15 Feb 2017 17:01:00 -0800
Message-ID: <1487206866-4011-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
the interrupt signal from each GPIO line being routed to a dedicated
MSI-X.  This interrupt routing requires that we add some custom
processing to the beginning of the MSI-X irqdomain hierarchy.

Changes from v3:

 - Add some "depends on" to the driver Kconfig to avoid build errors
   in some architectures when doing COMPILE_TEST builds.

Changes from v2:

 - in 4/6: Added Rob Harring's Acked-by

 - Added three patches to genirq/irqdomain to support interrupt code
   in the driver.

 - Rewrite irq code in driver to use irqdomain hierarchy.

 - Other naming and style changes as recommended by Linus Walleij.

Changes from v1:

 - in 1/3: Addressed Rob Harring's comments.

 - in 2/3: Trivial cleanups found in internal review + add some
   comments.

David Daney (6):
  genirq: Export more irq_chip_*_parent() functions.
  genirq: Add handle_fasteoi_{level,edge}_irq flow handlers.
  irqdomain: Add irq_domain_{push,pop}_irq() functions.
  dt-bindings: gpio: Add binding documentation for gpio-thunderx
  gpio: Add gpio driver support for ThunderX and OCTEON-TX
  MAINTAINERS: Add entry for THUNDERX GPIO Driver.

 .../devicetree/bindings/gpio/gpio-thunderx.txt     |  27 ++
 MAINTAINERS                                        |   5 +
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-thunderx.c                       | 490 +++++++++++++++++++++
 include/linux/irq.h                                |   2 +
 include/linux/irqdomain.h                          |   3 +
 kernel/irq/chip.c                                  | 105 +++++
 kernel/irq/irqdomain.c                             | 137 ++++++
 9 files changed, 778 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
 create mode 100644 drivers/gpio/gpio-thunderx.c

-- 
1.8.3.1
