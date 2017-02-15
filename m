From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v3 0/6] genirq/gpio: Add driver for ThunderX and OCTEON-TX
 SoCs
Date: Wed, 15 Feb 2017 11:29:43 -0800
Message-ID: <c259d2a6-23ce-0890-5cd7-f88b594b511c@caviumnetworks.com>
References: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The kbuild test robot found a compile problem on sparc64, also Christoph 
has noted, in a reply to a different patch, that pci_enable_msix() is 
deprecated.

I will respin to correct these issues.

David.



On 02/14/2017 09:49 AM, David Daney wrote:
> Per the Subject: Add driver for ThunderX and OCTEON-TX SoCs
>
> This GPIO hardware looks like a PCIe device, with the interrupt signal
> from each GPIO line being routed to a dedicated MSI-X.  This interrupt
> routing requires that we add some custom processing to the beginning
> of the MSI-X irqdomain hierarchy.
>
>
> Changes from v2:
>
>  - in 4/6: Added Rob Harring's Acked-by
>
>  - Added three patches to genirq/irqdomain to support interrupt code
>    in the driver.
>
>  - Rewrite irq code in driver to use irqdomain hierarchy.
>
>  - Other naming and style changes as recommended by Linus Walleij.
>
> Changes from v1:
>
>  - in 1/3: Addressed Rob Harring's comments.
>
>  - in 2/3: Trivial cleanups found in internal review + add some
>    comments.
>
> David Daney (6):
>   genirq: Export more irq_chip_*_parent() functions.
>   genirq: Add handle_fasteoi_{level,edge}_irq flow handlers.
>   irqdomain: Add irq_domain_{push,pop}_irq() functions.
>   dt-bindings: gpio: Add binding documentation for gpio-thunderx
>   gpio: Add gpio driver support for ThunderX and OCTEON-TX
>   MAINTAINERS: Add entry for THUNDERX GPIO Driver.
>
>  .../devicetree/bindings/gpio/gpio-thunderx.txt     |  27 ++
>  MAINTAINERS                                        |   5 +
>  drivers/gpio/Kconfig                               |   7 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-thunderx.c                       | 490 +++++++++++++++++++++
>  include/linux/irq.h                                |   2 +
>  include/linux/irqdomain.h                          |   3 +
>  kernel/irq/chip.c                                  | 105 +++++
>  kernel/irq/irqdomain.c                             | 137 ++++++
>  9 files changed, 777 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
>  create mode 100644 drivers/gpio/gpio-thunderx.c
>
