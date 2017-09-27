From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v6 0/2] gpio: uniphier: UniPhier GPIO driver
Date: Wed, 27 Sep 2017 11:40:20 +0900
Message-ID: <1506480022-8995-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds UniPhier GPIO driver.

The interrupt controller part is implemented by using hierarchy irqdomain.

IMHO, the problem of the hierarchy irqdomain is that drivers must hard-code
the fwspec of the interrupt parent.  We will never know the DT binding of
the parent unless we parse #interrupt-cell, etc.

I asked about this:
https://lkml.org/lkml/2017/7/6/758

Apparently, the current kernel does not provide a systematic way to
describe it.

In v1-v3, I hard-coded the parent hwirq numbers in the driver because
irqchip drivers are forced to hard-code more or less about the parent.
This was not accepted by Linus Walleij.

In v4, I tried to use the new API irq_domain_push_irq().  I needed to
change the irqdomain framework to make it work for DT, but seemed
controversial in the irqdomain subsystem review.

In v5, I tried another solution.  At first I thought it worked, but
I found a dead-lock if an irq is disposed from the .alloc hook.

After I considered more, I thought "interrupts" property does not
make much sense here because the last cell (which usually specifies
the trigger type) is useless for the hierarchy irqdomain.

I decided to use a vendor-specific property.  This is what some drivers
actually do.


Changes in v6:
  - Add "socionext,interrupt-ranges"

Changes in v5:
  - Split into a separate patch for DT binding
  - Add a new patch to export of_phandle_args_to_fwspec
  - Split DT binding into a separate file
  - v4 depends on some patches that change irq_domain_push_irq(), but
    they got negative feedback in the irqdomain subsystem review.
    Yet another approach here.  Parse "interrupts" property in
    .alloc() hook.  If the parent IRQ is already mapped, dispose it
    and re-alloc in irqdomain manner.

Changes in v4:
  - Add COMPILE_TEST and select IRQ_DOMAIN_HIERARCHY
  - Reimplement irqchip part by using irq_domain_push_irq()

Changes in v3:
  - Add .irq_set_affinity() hook
  - Use irq_domain_create_hierarchy() instead of legacy
    irq_domain_add_hierarchy()

Changes in v2:
  - Remove +32 offset for parent interrupts to follow the GIC
    binding convention
  - Let uniphier_gpio_irq_alloc() fail if nr_irqs != 1
  - Allocate gpio_chip statically because just one instance is
    supported
  - Fix suspend and resume hooks

Masahiro Yamada (2):
  dt-bindings: gpio: uniphier: add UniPhier GPIO binding
  gpio: uniphier: add UniPhier GPIO controller driver

 .../devicetree/bindings/gpio/gpio-uniphier.txt     |  40 ++
 MAINTAINERS                                        |   1 +
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-uniphier.c                       | 507 +++++++++++++++++++++
 include/dt-bindings/gpio/uniphier-gpio.h           |  18 +
 6 files changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
 create mode 100644 drivers/gpio/gpio-uniphier.c
 create mode 100644 include/dt-bindings/gpio/uniphier-gpio.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
