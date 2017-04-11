From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/6] genirq/gpio: Add driver for ThunderX and OCTEON-TX SoCs
Date: Tue, 11 Apr 2017 10:21:03 -0700
Message-ID: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
the interrupt signal from each GPIO line being routed to a dedicated
MSI-X.  This interrupt routing requires that we add some custom
processing to the beginning of the MSI-X irqdomain hierarchy.

Changes from v5:

 - Added .irq_{request,release}_resources() functions to irq_chip.

 - Quit calling irq_set_irq_type() in the irq_map() function.

 - Added more error condition checking to irq_domain_{push,pop}_irq()

Changes from v4:

 - Rebased to post-v4.10 to support .set_config() function.

 - Added .get_direction() support.

 - Added PIN_CONFIG_INPUT_DEBOUNCE support.

 - Removed some improper use of ENOSYS.

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

 .../devicetree/bindings/gpio/gpio-thunderx.txt     |  27 +
 MAINTAINERS                                        |   5 +
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-thunderx.c                       | 639 +++++++++++++++++++++
 include/linux/irq.h                                |   2 +
 include/linux/irqdomain.h                          |   3 +
 kernel/irq/chip.c                                  | 105 ++++
 kernel/irq/irqdomain.c                             | 178 ++++++
 9 files changed, 968 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
 create mode 100644 drivers/gpio/gpio-thunderx.c

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
