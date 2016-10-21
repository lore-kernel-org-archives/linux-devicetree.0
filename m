From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: cbc-presence: Add CBC presence detect as GPIO driver
Date: Fri, 21 Oct 2016 10:49:44 +0200
Message-ID: <CACRpkdY2-9OVz1qjszNJuUzt2CbCr8Ln3MiFzc6dnFSW7F7MkA@mail.gmail.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853614-22409-5-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853614-22409-5-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Debjit Ghosh <dghosh@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 7, 2016 at 5:20 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> From: Georgi Vlaev <gvlaev@juniper.net>
>
> This driver exports the CB FPGA presence detect bits from a
> single 32bit CB register as GPIOs.
>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Guenter Roeck <groeck@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

This needs some more verbose commit message and explanation.

Note: GPIO = General Purpose Input/Output.

This doesn't really sound like general purpose, more like special
purpose.

Consider drivers/input and drivers/connector classes for example.

> +config GPIO_CBC_PRESENCE
> +       tristate "Juniper Networks PTX1K CBC presence detect as GPIO"
> +       depends on MFD_JUNIPER_CBC && OF
> +       default y if JNX_CONNECTOR
> +       help
> +         This driver exports the CH_PRS and OTHER_CH_PRS presence detect
> +         bits of the PTX1K RCB CBC FPGA as GPIOs on the relevant Juniper
> +         platforms. Select if JNX_CONNECTOR is selected.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called gpio-cbc-presence.

At least tell us *what* it is detecting the presence of.

Apart from this it has some of the same issues pointed out in the
other drivers, correct these as well.

Yours,
Linus Walleij
