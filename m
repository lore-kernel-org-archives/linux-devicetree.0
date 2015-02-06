From: Tyler Hall <tylerwhall@gmail.com>
Subject: gpio-pxa: getting GPIOs by devicetree phandle broken
Date: Fri, 6 Feb 2015 16:28:09 -0500
Message-ID: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Daniel Mack <zonque@gmail.com>, Hans Holmberg <hans.holmberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Howard Cochran <cochran@lexmark.com>
List-Id: devicetree@vger.kernel.org

Hi,

Commit 7b8792b ("gpiolib: of: Correct error handling in
of_get_named_gpiod_flags") seems to break the ability to use DT
bindings to reference this driver's GPIOs by phandle for banks above
the first.

The issue is that gpio-pxa registers multiple gpio chips - one for
each bank - but they're all associated with the same DT node. The new
behavior in of_gpiochip_find_and_xlate() causes gpiochip_find() to
bail after the first chip matches and its xlate function fails.
Previously it would try all chips associated with the phandle and
pxa_gpio_of_xlate() would fail until it was called with the correct
gpiochip.

I think the new behavior of of_gpiochip_find_and_xlate() is reasonable,
so I see a couple ways of fixing gpio-pxa.

1. Require child nodes in DT for each bank
2. Refactor gpio-pxa to only register one gpiochip

There was a previously undocumented binding that required child nodes
but it was removed by 5dbb7c6 ("gpio: pxa: remove dead code"). It's
still present in the DT files that use "marvell,mmp-gpio." Here's an
example from pxa168.dtsi.

            gpio@d4019000 {
                compatible = "marvell,mmp-gpio";
                #address-cells = <1>;
                #size-cells = <1>;

                ...

                gcb0: gpio@d4019000 {
                    reg = <0xd4019000 0x4>;
                };
                ...
            };

I may proceed with option 1 since there's some precedent, but I'd
appreciate any input.

Thanks,
Tyler
