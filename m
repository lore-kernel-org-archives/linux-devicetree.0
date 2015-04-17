From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V3 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Fri, 17 Apr 2015 09:39:23 -0700
Message-ID: <CAL1qeaEd67bGw9Qw5DGwHeuPjEqdRdNz6bvCJ+OtCKuuZ4h1wA@mail.gmail.com>
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org>
	<1428435862-14354-3-git-send-email-abrestic@chromium.org>
	<553099AF.3060108@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553099AF.3060108@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On Thu, Apr 16, 2015 at 10:27 PM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
>
> Hi Andrew,
>
> On 04/07/2015 04:44 PM, Andrew Bresticker wrote:
> [..]
>> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>> +{
>> +     struct device_node *node = pctl->dev->of_node;
>> +     struct pistachio_gpio_bank *bank;
>> +     unsigned int i;
>> +     int irq, ret = 0;
>> +
>> +     for (i = 0; i < pctl->nbanks; i++) {
>> +             char child_name[sizeof("gpioXX")];
>> +             struct device_node *child;
>
> The first submission used for_each_child_of_node, and I can't find
> any review comments explaining why you've changed it to a regular for
> loop.

The reason for this was the change to looking for particular node
names (gpio0, gpio1, ...) instead of assuming they'd be in order.  It
seemed cleaner to me to do the above rather than:

        for_each_child_of_node()
                if (strcmp(node->name, ...) == 0)

>> +
>> +             snprintf(child_name, sizeof(child_name), "gpio%d", i);
>
> This assumes the GPIO bank nodes are called gpio0, gpio1, ... and so on.
> Do we really want to assume that?

Linus suggested using aliases [1] in a previous review, but that
obviously won't work when we have the RPU pinctrl as well since there
will be multiple "gpio0"s, so I decided to use node names instead.
The Rockchip and Samsung pinctrl drivers do something similar.

[1] http://patchwork.linux-mips.org/patch/9307/

Thanks,
Andrew
