Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:63760 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836Ab3HQL5G (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 07:57:06 -0400
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Sat, 17 Aug 2013 04:57:03 -0700 (PDT)
Message-ID: <7650035.V1NBeFKeMW@flatron>
In-Reply-To: <1376697255-18806-1-git-send-email-linus.walleij@linaro.org>
References: <1376697255-18806-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>, Lars Poeschel <poeschel@lemonage.de>
List-ID: <devicetree@vger.kernel.org>

Hi Linus,

On Saturday 17 of August 2013 01:54:15 Linus Walleij wrote:
> Currently the kernel is ambigously treating GPIOs and interrupts
> from a GPIO controller: GPIOs and interrupts are treated as
> orthogonal. This unfortunately makes it unclear how to actually
> retrieve and request a GPIO line or interrupt from a GPIO
> controller in the device tree probe path.
> 
> In the non-DT probe path it is clear that the GPIO number has to
> be passed to the consuming device, and if it is to be used as
> an interrupt, the consumer shall performa a gpio_to_irq() mapping
> and request the resulting IRQ number.
> 
> In the DT boot path consumers may have been given one or more
> interrupts from the interrupt-controller side of the GPIO chip
> in an abstract way, such that the driver is not aware of the
> fact that a GPIO chip is backing this interrupt, and the GPIO
> side of the same line is never requested with gpio_request().
> A typical case for this is ethernet chips which just take some
> interrupt line which may be a "hard" interrupt line (such as an
> external interrupt line from an SoC) or a cascaded interrupt
> connected to a GPIO line.
> 
> This has the following undesired effects:
> 
> - The GPIOlib subsystem is not aware that the line is in use
>   and willingly lets some other consumer perform gpio_request()
>   on it, leading to a complex resource conflict if it occurs.
> 
> - The GPIO debugfs file claims this GPIO line is "free".
> 
> - The line direction of the interrupt GPIO line is not
>   explicitly set as input, even though it is obvious that such
>   a line need to be set up in this way, often making the system
>   depend on boot-on defaults for this kind of settings.
> 
> To solve this dilemma, perform an interrupt consistency check
> when adding a GPIO chip: if the chip is both gpio-controller and
> interrupt-controller, walk all children of the device tree,
> check if these in turn reference the interrupt-controller, and
> if they do, loop over the interrupts used by that child and
> perform gpio_request() and gpio_direction_input() on these,
> making them unreachable from the GPIO side.
> 
> The patch has been devised by Linus Walleij and Lars Poeschel.


I still have some concerns with regard to GPIO-interrupt mapping used 
here, which I posted as a reply to the discussion that was happening for 
previous version of this patch. I would be happy if this could be 
discussed a bit more.

Best regards,
Tomasz

