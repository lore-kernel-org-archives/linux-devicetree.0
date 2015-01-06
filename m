From: <thloh@altera.com>
Subject: [PATCH v9 0/2] Altera soft IP GPIO driver
Date: Mon, 5 Jan 2015 18:19:31 -0800
Message-ID: <1420510773-24605-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, grant.likely@linaro.org, akpm@linux-foundation.org, davem@davemloft.net, gregkh@linuxfoundation.org, joe@perches.com, mchehab@osg.samsung.com, crope@iki.fi, linux-gpio@vger.kernel.org
Cc: thloh.linux@gmail.com, thloh@altera.com
List-Id: devicetree@vger.kernel.org

From: Tien Hock Loh <thloh@altera.com>

Adds a new device tree binding and driver for Altera soft GPIO IP.
The driver is able to do read/write and allows GPIO to be a interrupt
controller.

Tested on Altera GHRD on interrupt handling and IO.

v9:
Removed duplicated initialization on set_type
using temporals to improve code readability in calling generic_handle_irq
Using ?: ternary to reduce code size

v8:
Using for_each_set_bit
added const for struct definition
removed naggy pr_err
sort alpha header
remove unused macros
use fixed width data types instead of unsigned long
whitespace issue fixes
removed _relaxed function for better compatibility across different CPU
changed irq_create_mapping to platform_get_irq
updated implementation to use gpiochip_irqchip_add
reserve interrupt-cells number 2 in device tree binding for future use
remove confusing sections on devicetree bindings
Added tristate Kconfig help text

v7:
used dev_warn instead of pr_warn
clean up unnecesarry if else indentation

v6:
Added irq_startup and irq_shutdown
changed bitwise clamping style
cleanup bitwise operation to improve readability
change naming of mapped irqs from virq to mapped_irq

v5:
dispose irq_domain mapping correctly
update optional binding description in binding docs

v4:
added vendor prefix to devicetree binding for IP specific properties
using MMIO GPIO helper library instead of manually map PIO to memory
altera_gpio_chip inline struct documentation to kerneldoc
using dev_ print to print a better failure message

v2, v3:
Do not reference NO_IRQ
Updated irq_set_type to only allow the hardware configured irq type


Tien Hock Loh (2):
  drivers/gpio: Altera soft IP GPIO driver device tree binding
  drivers/gpio: Altera soft IP GPIO driver

 .../devicetree/bindings/gpio/gpio-altera.txt       |  43 +++
 MAINTAINERS                                        |   6 +
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-altera.c                         | 405 +++++++++++++++++++++
 5 files changed, 463 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
 create mode 100644 drivers/gpio/gpio-altera.c

-- 
1.7.11.GIT
