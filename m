From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 4/6] regulator: hi6421v530: add driver for hi6421v530
 voltage regulator
Date: Fri, 26 May 2017 14:13:33 +0200
Message-ID: <CABxcv=kP7XLDhUifwDBEfnayfgjGJFf7v9kUkPS6pcLKiaLP-g@mail.gmail.com>
References: <20170526063518.21246-1-guodong.xu@linaro.org> <20170526063518.21246-5-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170526063518.21246-5-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, xuwei5@hisilicon.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Gregory Clement <gregory.clement@free-electrons.com>, Olof Johansson <olof@lixom.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, riku.voipio@linaro.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Geert
List-Id: devicetree@vger.kernel.org

Hello Guodong,

On Fri, May 26, 2017 at 8:35 AM, Guodong Xu <guodong.xu@linaro.org> wrote:
> From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
>

[snip]

>
> +config REGULATOR_HI6421V530
> +       tristate "HiSilicon Hi6421v530 PMIC voltage regulator support"

The Kconfig symbol is tristate so the driver can be built as a module...

> +
> +static struct platform_driver hi6421v530_regulator_driver = {
> +       .driver = {
> +               .name   = "hi6421v530-regulator",
> +       },
> +       .probe  = hi6421v530_regulator_probe,
> +};
> +module_platform_driver(hi6421v530_regulator_driver);

... but the driver doesn't have a platform device ID table nor export
it as a module alias using MODULE_DEVICE_TABLE().

That means that if built as a module, it won't be autoloaded when the
"hi6421v530-regulator" device is registered by the MFD driver.

> +
> +MODULE_AUTHOR("Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>");
> +MODULE_DESCRIPTION("Hi6421v530 regulator driver");
> +MODULE_LICENSE("GPL v2");

Alternative you can add a MODULE_ALIAS().

Best regards,
Javier
