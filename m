From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V8 6/8] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Tue, 16 Feb 2016 00:18:00 +0100
Message-ID: <CACRpkdbA+pHHpjT-HMr8FS8DehRZE=G2m5s6=MRoqR4n_RrHEQ@mail.gmail.com>
References: <1455191794-6065-1-git-send-email-ldewangan@nvidia.com>
	<1455191794-6065-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1455191794-6065-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 12:56 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
> pins. It also supports interrupts from these pins.
>
> Add GPIO driver for these pins to control via GPIO APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(...)
Nit and no big deal:

> +#include <linux/gpio.h>

<linux/gpio/driver.h>

should be enough.

Yours,
Linus Walleij
