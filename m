From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/7] pinctrl: armada-37xx: Add gpio support
Date: Mon, 27 Mar 2017 10:57:15 +0200
Message-ID: <CACRpkdaueEJKTJq6QihyBS18wgtgqVLHAFa=13_2X8AYuh7tqg@mail.gmail.com>
References: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
 <913cf9807c7c351bb7dabac9b3336431dac060e5.1490120798.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <913cf9807c7c351bb7dabac9b3336431dac060e5.1490120798.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Victor Gu <xigu@marvell.com>, Hua Jing <jinghua@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 7:28 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

You should add something to your Kconfig including:

select GPIOLIB
select OF_GPIO

or so... or depends on. You certainly need them.

> +static int armada_37xx_gpiochip_register(struct platform_device *pdev,
> +                                       struct armada_37xx_pinctrl *info)
> +{
> +       struct device_node *np;
> +       struct gpio_chip *gc;
> +       int ret = -ENODEV;
> +
> +       for_each_child_of_node(info->dev->of_node, np) {
> +               if (of_find_property(np, "gpio-controller", NULL)) {
> +                       ret = 0;
> +                       break;
> +               }
> +       };

OK so several GPIO chips as subnodes, why not one device per
chip? Or have we discussed this before? It seems a bit weird,
apparently there is just one node with a gpio-controller, as you're
just adding one pin range.

What happens if there would be two gpio-controllers? The second
is just ignored without error?

> +       ret = gpiochip_add_data(gc, info);
> +       if (ret)
> +               return ret;

Can't you use devm_gpiochip_add_data()?

> +       ret = gpiochip_add_pin_range(&info->gpio_chip, dev_name(dev), 0,
> +                                    pinbase, info->data->nr_pins);
> +       if (ret)
> +               return ret;

Why can't you put the range(s) into the device tree?

We already have code in drivers/gpio/gpiolib-of.c to do this
for you. And generic range definition bindings.

Yours,
Linus Walleij
