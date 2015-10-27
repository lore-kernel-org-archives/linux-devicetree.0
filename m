From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 8/9] ARM: dts: Add leds support to STM32F429 Discovery board
Date: Tue, 27 Oct 2015 21:31:52 +0100
Message-ID: <CALszF6Bo3x4jWnvDc=28s=517YJrv2=3BuuYmxjqP4ciF17fcQ@mail.gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1445102604-11502-9-git-send-email-mcoquelin.stm32@gmail.com>
	<CACRpkdYjq9XqKM4imYsaa_HBopS7uFnbb6gf=hRZHGC4baafAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYjq9XqKM4imYsaa_HBopS7uFnbb6gf=hRZHGC4baafAg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

2015-10-26 14:41 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> On Sat, Oct 17, 2015 at 7:23 PM, Maxime Coquelin
> <mcoquelin.stm32@gmail.com> wrote:
>
>> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> (...)
>> +       leds {
>> +               compatible = "gpio-leds";
>> +               red {
>> +                       gpios = <&gpiog 14 0>;
>> +               };
>> +               green {
>> +                       gpios = <&gpiog 13 0>;
>> +               };
>
> I suggest you add labels to these LEDs.
>
> label = "red-LED"
> label = "green-LED"
>
> This make things so much easier in sysfs.

I'm not sure to understand where it makes things easier in sysfs.
This is the sysfs path for the red led:
/sys/class/leds/red/

Indeed, if label is not present, it gets the node name.

>
> Usually people also want to add a default linux,trigger to these,
> like linux,default-trigger = "heartbeat"; but whatever you prefer.

Makes sense, I will add default trigger in next version.

> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!
Maxime
