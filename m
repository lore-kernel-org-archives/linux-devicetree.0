From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/4] mfd: pv88080: MFD core support
Date: Fri, 28 Oct 2016 14:18:13 +0200
Message-ID: <CACRpkdZMhtiyk1iyBE-j7rAS6yhSCBsa57-VMnyL=tsUi9wQZg@mail.gmail.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com> <6dcaf788e4ebffd5c753e5fc5ae67668f74f7c32.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6dcaf788e4ebffd5c753e5fc5ae67668f74f7c32.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 3:03 AM, Eric Jeong
<eric.jeong.opensource@diasemi.com> wrote:

> +++ b/drivers/mfd/pv88080-i2c.c
> +
> +static const struct of_device_id pv88080_of_match_table[] = {
> +       { .compatible = "pvs,pv88080",    .data = (void *)TYPE_PV88080_AA },
> +       { .compatible = "pvs,pv88080-aa", .data = (void *)TYPE_PV88080_AA },
> +       { .compatible = "pvs,pv88080-ba", .data = (void *)TYPE_PV88080_BA },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, pv88080_of_match_table);

Actually you are doing something weird.

The only thing you put in your device tree is this I guess.

That means that the GPIO chip does *not* have a device tree
entry, so you cannot reference the GPIOs there with &phandle
notation.

Please look around a bit to see how other OF-MFDs do it: they
register and populate by struct mfd_cell using the
.of_compatible member so that subdevices get
their own DT nodes, which is necessary for nodes providing
resources such as GPIOs, regulators and clocks, lest you
cannot reference them in your device tree!

Therefore I think all your subdevices should instantiate from
device tree with compatible matching as well, not as
platform devices.

> +struct pv88080_pdata {
> +       int (*init)(struct pv88080 *pv88080);
> +       int irq_base;
> +       int gpio_base;

NAK.

Get irq from the device tree, assign gpio base dynamically.

> +       struct regulator_init_data *regulators[PV88080_MAX_REGULATORS];

I suspect also this should come from the device tree.

Yours,
Linus Walleij
