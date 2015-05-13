From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Wed, 13 May 2015 13:00:07 +0200
Message-ID: <CACRpkdZn+bkDKzAD6gpnysezGZ6fzizD2o4zdBfEamFgUbzcvg@mail.gmail.com>
References: <1428306169.634.51.camel@x220>
	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>
	<1428311043-12012-2-git-send-email-linux@rempel-privat.de>
	<CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>
	<55522993.6090104@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55522993.6090104@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 12, 2015 at 6:25 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> Am 05.05.2015 um 17:12 schrieb Linus Walleij:

>> Just reference the statically defined array by a pointer instead,
>> this just takes up a lot o memory for no reason.
>
> This two arrays have different types this is why i convert it.
> priv->pin_desc[i].name - here i copy pointer any ways, and
> priv->pin_desc[i].number can be smaller then pointer.

I probably do not understand what you're trying to do, sorry :(

Why is it necessary for the driver to copy one description of
the pin into another?

>> Mory copying. I don't see why this is necessary at all.
>
> I hadn't seen the point to define groups statically, especially because
> they are used only  to make curious user happy. So, memory will be used
> only if you request the list over sysfs. Or miss some thing?

pinctrl does not even use sysfs.

The group names are usually there for matching with a function,
it is part of the core functionality. The group name + function name
matching is even more obvious in the dt case.

They also make things easier to read in debugfs yes, but
the core of the crux is to make it easy to config function+groups
states with e.g. DT or board files.

>>> +static struct pinmux_ops asm9260_pinmux_ops = {
>>> +       .get_functions_count    = asm9260_pinctrl_get_funcs_count,
>>> +       .get_function_name      = asm9260_pinctrl_get_func_name,
>>> +       .get_function_groups    = asm9260_pinctrl_get_func_groups,
>>> +       .set_mux                = asm9260_pinctrl_set_mux,
>>> +       /* TODO: should we care about gpios here? gpio_request_enable? */
>>
>> I think you should, if you also have a matching GPIO driver.
>
> I fear it would cause unpredictable bugs. GPIO mode is just one of mux
> modes. If some one will request gpio some busy or dangerous line it
> would do more harm then use. So, i assume limiting this only to device
> tree would be better.

Device tree or not doesn't matter, .gpio_request_enable() is used
as a shortcut to mux in GPIO pins.

If the simultaneous use of a pin for a device and GPIO bothers
you there is nowadays (linux-next or my devel branch) a .strict
option in pinmux_ops that you can set to disallow simultaneous
use by devices and GPIO of the same pin.

Yours,
Linus Walleij
