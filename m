From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Wed, 6 Feb 2019 11:02:08 +0100
Message-ID: <CACRpkdYuH6QnumRnAUbzJCwrj58mog68FJu6Tvi_48bLzsBbZg@mail.gmail.com>
References: <20190125162302.14036-1-masneyb@onstation.org> <20190125162302.14036-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

Hi Brian!

Thanks for this patch!

On Fri, Jan 25, 2019 at 5:23 PM Brian Masney <masneyb@onstation.org> wrote:

> The IRQ handler was hardcoded as handle_level_irq and this patch
> properly sets the handler to either handle_edge_irq or handle_level_irq
> depending on the IRQ type.

Done like so:

> +               flow_handler = handle_edge_irq;

This creates a problem and makes my kernel crash, because
handle_edge_irq() *unconditionally* calls chip->irq_ack(),
and since this chip does not implement .irq_ack(), it crashes.

I tried to just add a void .irq_ack(). That instead made the
kernel hang.

If I just assign handle_level_irq() as before (just replaced
all assignments of handle_edge_irq with handle_level_irq)
it boots nicely, AND the interrupts are working fine on the
ADC calibration path, and further readings of the ADC
generates new IRQs, as expected!

The handle_edge_irq and .irq_ack() call path is for hardware
that require an explicit ACK (such as writing a bit in some
register) when handling edge IRQs. This is necessary in some
hardware because of the transient nature of edge IRQs.
This is not necessary on some hardware that will simply
clear the flag when something is reading the status register.
I think this is the case with PM8xxx and you can safely use
handle_level_irq with all IRQs. It looks counterintuitive and
maybe the function handle_edge_irq() has a stupid name.
Just drop this handle_edge_irq() business for now.

This was tested on the APQ8060 DragonBoard.

However this happens:

[    3.007727] mmci-pl18x 12180000.sdcc: ignoring dependency for
device, assuming no driver
[    3.007970] mmci-pl18x 12200000.sdcc: ignoring dependency for
device, assuming no driver
[    3.014984] mpu3050-i2c 1-0068: ignoring dependency for device,
assuming no driver
[    3.023543] cm3605 cm3605: ignoring dependency for device, assuming no driver
[    3.030532] ak8975 1-000c: ignoring dependency for device, assuming no driver
[    3.037729] bmp280 1-0077: ignoring dependency for device, assuming no driver
[    3.044789] reg-fixed-voltage regulators:xc622a331mrg: ignoring
dependency for device, assuming no driver
[    3.052485] smsc911x 1b800000.ethernet-ebi2: ignoring dependency
for device, assuming no driver

But I think that is because these all use ssbi-gpio interrupts and
these are now handled properly so I will try to fix the device
tree and send a separate patch that you can include.

Yours,
Linus Walleij
