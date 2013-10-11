From: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH] drivers: misc: add gpio wakeup driver
Date: Fri, 11 Oct 2013 13:40:54 +0200
Message-ID: <5257E3C6.3050507@gmail.com>
References: <1380635719-31171-1-git-send-email-zonque@gmail.com> <CACRpkdYhQ+-d1COcvmg_hEJ==cTFpKLNDnvF8kdK4QgXzHenEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYhQ+-d1COcvmg_hEJ==cTFpKLNDnvF8kdK4QgXzHenEA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 11.10.2013 13:11, Linus Walleij wrote:
> On Tue, Oct 1, 2013 at 3:55 PM, Daniel Mack <zonque@gmail.com> wrote:

>> +Example:
>> +
>> +       wake_up {
>> +               compatible = "gpio-wakeup";
>> +               gpios = <&gpio0 19 0>;
>> +       };
> 
> This will not work if that GPIO chip is not capable of supporting
> interrupts on that GPIO line right?

Of course. It's the IRQ that wakes up the system, after all :)

> We have recently had a very long discussion about this: such
> GPIO chips will also be marked "interrupt-controller" and you
> should be able to just state interrupt-parent and
> interrupts = <>; for this. (And it should accept an array.)

Well, but that's not very intuitive. I was aiming for a drop-in
replacement for what I currently use for this purpose: a fake GPIO key
input device which is marked as wakeup source (linux,wakeup). Schematics
and everything else use GPIO notation, and so should the DTB binding here.

> Since what the driver will then eventually provide is to
> flag an IRQ line as wakeup, I wonder if this should not just
> simply go into the interrupt core, or atleast of/irq.c.

But for that, the IRQ line must be requested exclusively and handled as
well, no? If not, how would you handle cases where an interrupt is
marked as wakeup source by the core, but used by another driver which
calls disable_irq_wake() on it for whatever reason?


Thanks,
Daniel

