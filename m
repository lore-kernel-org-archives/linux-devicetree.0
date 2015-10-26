From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: Add leds support to STM32F429 Discovery board
Date: Mon, 26 Oct 2015 14:41:38 +0100
Message-ID: <CACRpkdYjq9XqKM4imYsaa_HBopS7uFnbb6gf=hRZHGC4baafAg@mail.gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1445102604-11502-9-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445102604-11502-9-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 17, 2015 at 7:23 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
(...)
> +       leds {
> +               compatible = "gpio-leds";
> +               red {
> +                       gpios = <&gpiog 14 0>;
> +               };
> +               green {
> +                       gpios = <&gpiog 13 0>;
> +               };

I suggest you add labels to these LEDs.

label = "red-LED"
label = "green-LED"

This make things so much easier in sysfs.

Usually people also want to add a default linux,trigger to these,
like linux,default-trigger = "heartbeat"; but whatever you prefer.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
