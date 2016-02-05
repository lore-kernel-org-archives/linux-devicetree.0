From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] MIPS: Add support for OCTEON cn78xx and cn73xx.
Date: Thu,  4 Feb 2016 16:42:47 -0800
Message-ID: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

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

David Daney (7):
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

 .../devicetree/bindings/mips/cavium/ciu3.txt       |  27 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/cavium-octeon/csrc-octeon.c              |  13 +-
 arch/mips/cavium-octeon/executive/octeon-model.c   |  82 ++-
 arch/mips/cavium-octeon/octeon-irq.c               | 678 ++++++++++++++++++++-
 arch/mips/cavium-octeon/setup.c                    |  36 +-
 arch/mips/cavium-octeon/smp.c                      | 145 ++++-
 arch/mips/include/asm/irq_regs.h                   |  10 +
 arch/mips/include/asm/octeon/cvmx-ciu3-defs.h      | 353 +++++++++++
 arch/mips/include/asm/octeon/cvmx-fpa-defs.h       |   1 +
 arch/mips/include/asm/octeon/cvmx-mio-defs.h       | 410 ++++++++++++-
 arch/mips/include/asm/octeon/cvmx.h                |  27 +-
 arch/mips/include/asm/octeon/octeon-feature.h      |  19 +-
 arch/mips/include/asm/octeon/octeon-model.h        |   5 +
 arch/mips/include/asm/octeon/octeon.h              |   8 +
 15 files changed, 1733 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/cavium/ciu3.txt
 create mode 100644 arch/mips/include/asm/octeon/cvmx-ciu3-defs.h

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
