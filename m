From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: Add pinctrl support for BM1880 SoC
Date: Thu, 25 Apr 2019 09:09:28 +0200
Message-ID: <CACRpkdZJweCPs096r6LJJTUSmPYViPDV_rBJ8NWbHzx96xEfsw@mail.gmail.com>
References: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org> <20190424120224.22660-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424120224.22660-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 2:03 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add pinctrl support for Bitmain BM1880 SoC. The driver only handles
> pinmuxing as the SoC is not capable of handling pinconf.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied, because there is no reason to hold back this clean
and important infrastructure for the platform. Minor nits can be
considered for follow-up patches.

> +config PINCTRL_BM1880
> +       bool "Bitmain BM1880 Pinctrl driver"
> +       depends on ARCH_BITMAIN

Could we do:

depends on ARCH_BITMAIN || COMPILE_TEST

to get some compiler coverage?

> +       select PINMUX
> +       help
> +         Pinctrl driver for Bitmain BM1880 SoC.

I think the platform always want this driver enabled, so I would either
select it from arch/arm/mach-foo/Kconfig or add a row like this:

default ARCH_BITMAIN

Either defaulting it to 'y'.

> +       F_nand, F_spi, F_emmc, F_sdio, F_eth0, F_pwm0, F_pwm1, F_pwm2,
> +       F_pwm3, F_pwm4, F_pwm5, F_pwm6, F_pwm7, F_pwm8, F_pwm9, F_pwm10,
> +       F_pwm11, F_pwm12, F_pwm13, F_pwm14, F_pwm15, F_pwm16, F_pwm17,
> +       F_pwm18, F_pwm19, F_pwm20, F_pwm21, F_pwm22, F_pwm23, F_pwm24,
> +       F_pwm25, F_pwm26, F_pwm27, F_pwm28, F_pwm29, F_pwm30, F_pwm31,
> +       F_pwm32, F_pwm33, F_pwm34, F_pwm35, F_pwm36, F_pwm37, F_i2c0, F_i2c1,


Wow 38 individual PWMs. This platform must really have good use for PWM.
I wonder why they hardcoded so many of them into the hardware...

> +static int __init bm1880_pinctrl_init(void)
> +{
> +       return platform_driver_register(&bm1880_pinctrl_driver);
> +}
> +arch_initcall(bm1880_pinctrl_init);

driver_initcall() also known as module_builtin_driver() doesn't work?

Do you plan to add GPIO (and interrupts) and pin config to this driver as well?

Yours,
Linus Walleij
