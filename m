From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [rtc-linux] [PATCH V7 5/8] gpio: add DT binding doc for gpio of
 PMIC max77620/max20024
Date: Fri, 5 Feb 2016 15:48:48 +0100
Message-ID: <CACRpkdYNBHvefR_qdjZ7hWr=cFzhv1gEgb5jBCrqHdWzNWgV6w@mail.gmail.com>
References: <1454171931-27752-1-git-send-email-ldewangan@nvidia.com>
	<1454171931-27752-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1454171931-27752-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, vreddytalla@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 30, 2016 at 5:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
> which act as GPIO as well as special function mode.
>
> Add DT binding document to support these pins in GPIO
> mode via GPIO framework.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Lee can merge this too.

Yours,
Linus Walleij
