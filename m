From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v2 0/8] MIPS: Add support for OCTEON cn78xx and cn73xx.
Date: Tue,  9 Feb 2016 11:00:05 -0800
Message-ID: <1455044413-9823-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

The OCTEON III cn78xx and cn73xx family of SoCs has some architectural
differences from previous OCTEON processors.

Here we add support for the new interrupt controller and related IPI
machinery.  This is enough to be able to boot an initrd based system
to a command prompt on the serial console.

Still pending are support for: PCI, Watchdog, I2C, Sata, USB,
Ethernet, etc.

This set depends on these two sets:
http://www.linux-mips.org/archives/linux-mips/2016-02/msg00051.html
http://www.linux-mips.org/archives/linux-mips/2016-02/msg00041.html

All patches are to the MIPS tree except the device tree binding
definition.  Probably they could be merged via Ralf's tree if there
were no objections.

Changes from v1: Added Acked-by: Rob Herring to 6/8.  Simplifications
                 suggested by tglx.  Added 8/8.

David Daney (8):
  MIPS: OCTEON: Remove some code limiting NR_IRQS to 255
  MIPS: Select CONFIG_HANDLE_DOMAIN_IRQ and make it work.
  MIPS: OCTEON: Add register definitions for cn73xx, cnf75xx and
    cn78xx.
  MIPS: OCTEON: Add model checking support for cn73xx, cnf75xx and
    cn78xx
  MIPS: OCTEON: Don't attempt to use nonexistent registers on OCTEON
    III models.
  MIPS: OCTEON: Add support for OCTEON III interrupt  controller.
  MIPS: OCTEON: Add SMP support for OCTEON cn78xx et al.
  MIPS: OCTEON: Simplify code in octeon_irq_ciu_gpio_set_type()

 .../devicetree/bindings/mips/cavium/ciu3.txt       |  27 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/cavium-octeon/csrc-octeon.c              |  13 +-
 arch/mips/cavium-octeon/executive/octeon-model.c   |  82 ++-
 arch/mips/cavium-octeon/octeon-irq.c               | 679 ++++++++++++++++++++-
 arch/mips/cavium-octeon/setup.c                    |  36 +-
 arch/mips/cavium-octeon/smp.c                      | 145 ++++-
 arch/mips/include/asm/irq_regs.h                   |  10 +
 arch/mips/include/asm/octeon/cvmx-ciu3-defs.h      | 353 +++++++++++
 arch/mips/include/asm/octeon/cvmx-fpa-defs.h       |   1 +
 arch/mips/include/asm/octeon/cvmx-mio-defs.h       | 410 ++++++++++++-
 arch/mips/include/asm/octeon/cvmx.h                |  27 +-
 arch/mips/include/asm/octeon/octeon-feature.h      |  19 +-
 arch/mips/include/asm/octeon/octeon-model.h        |   5 +
 arch/mips/include/asm/octeon/octeon.h              |  25 +
 15 files changed, 1750 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/cavium/ciu3.txt
 create mode 100644 arch/mips/include/asm/octeon/cvmx-ciu3-defs.h

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>
-- 
1.7.11.7
