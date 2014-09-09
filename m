From: Weike Chen <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4 v3] The Designware GPIO Supporting
Date: Tue,  9 Sep 2014 11:07:57 -0700
Message-ID: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boon Leong Ong <boon.leong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hock Leong Kweh <hock.leong.kweh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andriy Shevchenko <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alvin Chen <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
These patches are for Intel Quark X1000 designware GPIO supporting. The first
patch enables the Synopsys DesignWare APB GPIO driver to support the MFD device.
And the Quark designware GPIO controller is registered as MFD device,
because Quark exports a single PCI device with both GPIO and I2C functions.
It is about reviewing the GPIO changes in gpio-dwapb, and in near future,
the Quark I2C driver and the MFD driver that binds these GPIO & I2C
functions will be sent subsequently. The second patch replaces all
'readl&writel' with 'dwapb_read'&'dwapb_write. The third patch enables the gpio
'debounce' feature. And the fourth patch enables the power management.

---
v3:
 Split [PATCH 2/3] into two patches [PATCH 2/4] and [PATCH 3/4],
 and now inlucde 4 patches.

 [PATCH 1/4]
 * Use 'is_pdata_alloc' instead of 'is_of'.
 * Allocate 'pdata' by 'kmalloc/kfree' instead of 'devm_*' for OF.
 * Use 'IS_ENABLED(CONFIG_OF_GPIO)' instead of '#ifdef CONFIG_OF_GPIO'.
 * A couple of other minor changes.
 [PATCH 2/4]
 * New patch splitted from the original [PATCH 2/3]
 * Use 'dwapb_read/write' instead of readl&writel.
 [PATCH 3/4]
 * Move 'dwapb_read/write' defination to new patch [PATCH 2/4].
 * Only port A support 'debounce' now.
 [PATCH 4/4]
 * The original patch [PATCH 3/3]
 * Use 'struct dwapb_context' instead of 'struct gpio_saved_regs'.
 * Allocate and save context dynamically by per port.

v2:
 [PATCH 1/3]
 * Fixed a bug to set the base gpio number to '-1' for the OF flow.
 * Set device node for each gpio chip for the OF flow.
 * Change the name of 'struct dwapb_gpio_platform_data' to
   'struct dwapb_platform_data'.
 * Change the name of 'struct dwapb_gpio_port_property' to
   'struct dwapb_port_property'.
 * Access pdata directly in 'probe' instead of accesing it
   by 'struct dwapb_gpio'.
 * Free 'pdata' at the end of 'probe' if it is OF case to save memory.
 * Improve the interrupt handler.
 * Move 'irq_set_handler_data' together with 'irq_set_chained_hanlder'.
 * Remove unncessary comments.
 [PATCH 2/3]
 * Change all 'readl'&'writel' to 'dwapb_read'&'dwapb_write'.
 [PATCH 3/3]
 * Change the name for 'struct gpio_saved_regs' to 'struct dwapb_context'.
 * Save the registers for all ports according to the port index.
 * Change '#if defined' to '#ifdef'.

Weike Chen (4):
  GPIO: gpio-dwapb: Enable platform driver binding to MFD driver
  GPIO: gpio-dwapb: Change readl&writel to dwapb_read&dwapb_write
  GPIO: gpio-dwapb: Support Debounce
  GPIO: gpio-dwapb: Suspend & Resume PM enabling

 drivers/gpio/Kconfig                     |    1 -
 drivers/gpio/gpio-dwapb.c                |  400 +++++++++++++++++++++++++-----
 include/linux/platform_data/gpio-dwapb.h |   32 +++
 3 files changed, 365 insertions(+), 68 deletions(-)
 create mode 100644 include/linux/platform_data/gpio-dwapb.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
