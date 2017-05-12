From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pintrl: meson: add interrupts to pinctrl data
Date: Fri, 12 May 2017 11:51:41 +0200
Message-ID: <CACRpkdajRQNTEYntY+NuG+3vNenzN9ZOw3ukWtS-=5zgDh5wCA@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
 <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com> <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
 <1494518886.2375.15.camel@baylibre.com> <7ed5a88a-43dd-f7ab-2794-48ceb5a62a93@gmail.com>
 <18ad8094-4e17-3487-7ef2-497d5c7ab9dc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <18ad8094-4e17-3487-7ef2-497d5c7ab9dc@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 12, 2017 at 8:08 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Following Jerome's suggestion I prepared a version making the irq multiplexer
> an own device. Nice here is that with this approach basically only one line of
> code needs to be changed in the existing pinctrl driver.
>
> As discussion basis I add it here w/o submitting a v2 of patch 5.

I think this is the right way to go, but would ideally like some feedback from
the irqchip maintainers.

Have you looked at drivers/irqchip/irq-crossbar.c for inspiration?
Also read
Documentation/devicetree/bindings/arm/omap/crossbar.txt

It uses an hierarchical domain for a similar cross-connection
usecase.

Under any circumstances I think decoupling the IRQ multiplexer
and dealing with it in separate is easier for maintainance and
also for the irq maintainers to review.

Yours,
Linus Walleij
