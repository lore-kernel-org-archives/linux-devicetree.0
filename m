From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH V3 4/4] gpio: pv88080: Add GPIO function support
Date: Wed, 28 Dec 2016 01:28:25 +0100
Message-ID: <CACRpkda1_SVGLeK9rgkpVj-6vj_WKZnAyOJp_Z775o88+wo49A@mail.gmail.com>
References: <cover.1481002393.git.eric.jeong@diasemi.com> <3e5d9f938494bf7420577ca2f55fd243705d9415.1481002393.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <3e5d9f938494bf7420577ca2f55fd243705d9415.1481002393.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 6, 2016 at 6:33 AM, Eric Jeong
<eric.jeong.opensource@diasemi.com> wrote:

> From: Eric Jeong <eric.jeong.opensource@diasemi.com>
>
> This patch adds support for PV88080 PMIC GPIOs.
> PV88080 has two configurable GPIOs.
>
> Kconfig and Makefile are updated to reflect support
> for PV88080 PMIC GPIO.
>
> Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>

> +#include <linux/gpio.h>

Use

#include <linux/gpio/driver.h>

only.

> +#include <linux/mfd/pv88080.h>

I see this header is not yet upstream so I can't merge
this driver (else I would just correct the above and merge it).

With the oneliner change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess Lee needs to merge this with the MFD bits.

Yours,
Linus Walleij
