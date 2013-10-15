From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drivers: misc: add gpio wakeup driver
Date: Tue, 15 Oct 2013 21:32:00 +0200
Message-ID: <201310152132.00409.arnd@arndb.de>
References: <1380635719-31171-1-git-send-email-zonque@gmail.com> <CACRpkdYhQ+-d1COcvmg_hEJ==cTFpKLNDnvF8kdK4QgXzHenEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYhQ+-d1COcvmg_hEJ==cTFpKLNDnvF8kdK4QgXzHenEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Mack <zonque@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Friday 11 October 2013, Linus Walleij wrote:
> On Tue, Oct 1, 2013 at 3:55 PM, Daniel Mack <zonque@gmail.com> wrote:
> 
> > This patch adds a very simple driver that enables GPIO lines as wakeup
> > sources. It only operates on information passed in via DT, and depends
> > on CONFIG_OF && CONFIG_PM_SLEEP. It can for example be used to connect
> > wake-on-LAN (WOL) signals or other electric wakeup networks.
> >
> > The driver accepts a list of GPIO nodes and claims them along with their
> > interrupt line. During suspend, the interrupts will be enabled and
> > selected as wakeup source. The driver doesn't do anything else with the
> > GPIO lines, and will ignore occured interrupts silently.
> >
> > Signed-off-by: Daniel Mack <zonque@gmail.com>
> 
> This makes a weird kind of sense.
> Hm hm hm.
> 
> But I really need the misc mainatiners' help here...
> possibly also irqchip maintainers.

This seems like a completely generic driver, rather than some oddball
hack, so I'd prefer to not see it in drivers/misc at all. Maybe you
can find some other maintainer who is willing to put it into his
subsystem, candidates would be

 * gpio
 * irqchip
 * power
 * of/dt

I don't see anything wrong with the basic approach though.

> > +Example:
> > +
> > +       wake_up {
> > +               compatible = "gpio-wakeup";
> > +               gpios = <&gpio0 19 0>;
> > +       };
> 
> This will not work if that GPIO chip is not capable of supporting
> interrupts on that GPIO line right?
> 
> We have recently had a very long discussion about this: such
> GPIO chips will also be marked "interrupt-controller" and you
> should be able to just state interrupt-parent and
> interrupts = <>; for this. (And it should accept an array.)
> 
> It *may* be that we have many GPIO drivers that do not accept
> that you request an interrupt on them before you have done
> request_gpio() followed by gpio_to_irq() on the pin. Then this
> shall be treated like a bug and the GPIO driver fixed to handle
> this. (That was the outcome of this discussion.)

I haven't followed that discussion, but it's good to hear that
you made some progress there. I find it a bit worrying that you
say the behavior may be dependent on the gpio driver, but maybe
I didn't fully understand what the resolution is.

> Since what the driver will then eventually provide is to
> flag an IRQ line as wakeup, I wonder if this should not just
> simply go into the interrupt core, or atleast of/irq.c.

Right.

	Arnd
