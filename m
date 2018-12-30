Return-Path: <SRS0=MkjG=PH=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <87r2f83uww.fsf@soft-dev15.microsemi.net> <87zhsr2jxk.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87zhsr2jxk.fsf@soft-dev15.microsemi.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Dec 2018 21:00:10 +0100
Message-ID: <CACRpkdaW5g2NpknVRz84oS-FWt-0vxKGsbaLv32aKmZtcfHjFg@mail.gmail.com>
Subject: Re: [PATCH v2] mips: gpio: mscc_sgpio: Add DT bindings documentation
Content-Type: text/plain; charset="UTF-8"
To: Lars Povlsen <lars.povlsen@microchip.com>
Cc: Device Tree <devicetree@vger.kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Dec 27, 2018 at 2:12 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

>     mips: mscc_sgpio: Add DT bindings documentation
>
>     This add device tree binding documentation for the MSCC serial GPIO
>     driver.
>
> v2 changes:
>  - Added more device background info
>  - Dropped "mscc,sgpio-bitcount" in favour of "ngpios" and "gpio-ranges".
>  - Elaborated "mscc,sgpio-ports" explanation
>
>
>     Signed-off-by: Lars Povlsen <lars.povlsen@microsemi.com>

Overall looks good to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> +Optional properties:
> +- ngpios: Set the number of GPIO's actually used.

Just say see: gpio.txt

Yours,
Linus Walleij
