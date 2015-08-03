From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 0/4] GPIO support for BRCMSTB
Date: Mon, 03 Aug 2015 10:33:06 -0700
Message-ID: <55BFA5D2.1090305@gmail.com>
References: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On 31/07/15 18:17, Gregory Fong wrote:
> Adds interrupt support for the GPIO controller (UPG GIO) used on Broadcom's
> various BRCMSTB SoCs (BCM7XXX and others).  For all existing hardware, this
> block hooks up to the BCM7120 L2 IRQ controller and so will require
> CONFIG_BCM7120_L2_IRQ=y.

For this entire series:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

> 
> New in v4:
> - add nodes for the BRCMSTB GPIO controller to the BCM7445 dts file
> - a few improvements suggested by Linus Walleij on v3
> - remove unused 'irq' argument to brcmstb_gpio_irq_bank_handler()
> 
> The following are not included in this patchset:
> - Initial device tree bindings (merged from v1 to GPIO tree)
> - Initial GPIO support w/o interrupts (merged from v2 to GPIO tree)
> - ARM Kconfig changes (merged from v2 to arm-soc tree)
> - fix for null ptr deref in driver remove (merged from v3)
> 
> Previous versions:
> v1: https://lkml.org/lkml/2015/5/6/199
> v2: https://lkml.org/lkml/2015/5/28/853
> v3: https://lkml.org/lkml/2015/6/17/960
> 
> Gregory Fong (4):
>   dt-bindings: brcmstb-gpio: document properties for wakeup
>   gpio: brcmstb: Add interrupt and wakeup source support
>   gpio: brcmstb: support wakeup from S5 cold boot
>   ARM: dts: brcmstb: add BCM7445 GPIO nodes
> 
>  .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |  35 ++-
>  arch/arm/boot/dts/bcm7445.dtsi                     |  50 ++++
>  drivers/gpio/Kconfig                               |   1 +
>  drivers/gpio/gpio-brcmstb.c                        | 306 ++++++++++++++++++++-
>  4 files changed, 379 insertions(+), 13 deletions(-)
> 


-- 
Florian
