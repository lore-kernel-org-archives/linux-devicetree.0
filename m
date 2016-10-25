From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Tue, 25 Oct 2016 20:20:52 +0200
Message-ID: <CACRpkdbGo4BJOdzkgBrE9jT-rKodd4zssCnOtOuGS+OqV-Uc6Q@mail.gmail.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
 <1476871709-8359-5-git-send-email-jbrunet@baylibre.com> <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
 <1477040798.15560.96.camel@baylibre.com> <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg@mail.gmail.com>
 <ec7c6cc5-cf9a-9c75-4b07-e337064c7d6e@arm.com> <1477400900.2482.51.camel@baylibre.com>
 <dee26f0b-e175-f8a0-2b73-08e8e324841c@arm.com> <1477405332.2482.87.camel@baylibre.com>
 <bbc268c8-35c3-206a-46b1-62cebef174b2@arm.com> <1477409478.2482.113.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477409478.2482.113.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 5:31 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2016-10-25 at 15:47 +0100, Marc Zyngier wrote:

>> Is gpio_to_irq() supposed to allocate an interrupt? Or merely to
>> report the existence of a mapping?

It should provide an IRQ corresponding to the gpio line, if possible.

However the semantic is such, that it is not necessary to call to_irq()
before using an IRQ: the irqchip and gpiochip abstractions should be
orthogonal.

This goes especially when using device tree or ACPI, where you
may reference an IRQ from something modeled as irqchip, which
is simultaneously a gpiochip.

> Linus, please correct me if I'm wrong,
> .to_irq gets the linux gpio number and returns the linux virtual irq
> numbers, 0 if there is no interrupt.

Yes. But it may *or may not* be called before using the IRQ.

So it should look up or try to create a mapping on request, but not
assume to have been called before using some line as IRQ.

The only thing you should assume to be called before an interrupt
is put to use is the stuff in irqchip. So you have to do your
dynamic irqdomain mapping elsewhere than .to_irq().

Yours,
Linus Walleij
