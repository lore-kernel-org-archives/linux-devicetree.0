From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V8 6/8] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Sat, 20 Feb 2016 10:24:59 +0530
Message-ID: <56C7F1A3.70404@nvidia.com>
References: <1455191794-6065-1-git-send-email-ldewangan@nvidia.com>	<1455191794-6065-7-git-send-email-ldewangan@nvidia.com> <CACRpkdbA+pHHpjT-HMr8FS8DehRZE=G2m5s6=MRoqR4n_RrHEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbA+pHHpjT-HMr8FS8DehRZE=G2m5s6=MRoqR4n_RrHEQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dzaw==?= =?UTF-8?B?aQ==?= <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org


On Tuesday 16 February 2016 04:48 AM, Linus Walleij wrote:
> On Thu, Feb 11, 2016 at 12:56 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
>> pins. It also supports interrupts from these pins.
>>
>> Add GPIO driver for these pins to control via GPIO APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> (...)
> Nit and no big deal:
>
>> +#include <linux/gpio.h>
> <linux/gpio/driver.h>
>
> should be enough.

Yaah, this is better.

Lee,
Should I respin the patch series for this change?




