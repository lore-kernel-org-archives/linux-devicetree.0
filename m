From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 4/8] regulator: Hi655x: Add support for Hi655x regulator
Date: Thu, 8 Oct 2015 09:47:57 +0200
Message-ID: <CABxcv=kRJPxJiOvqsX_cSJzbew0-_-4Y_q_bQioOdknLbKkZ1A@mail.gmail.com>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
	<1443611111-3196-5-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443611111-3196-5-git-send-email-w.f@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fei Wang <w.f@huawei.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kevin Hilman <khilman@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, bintian.wang@huawei.com, xuyiping@hisilicon.com, guodong.xu@linaro.org, puck.chen@hisilicon.com, xuwei5@hisilicon.com, william.wfei@gmail.com, z.liuxinliang@hisilicon.com, kong.kongxinwei@hisilicon.com, zhongkaihua@huawei.com, haojian.zhuang@linaro
List-Id: devicetree@vger.kernel.org

Hello Fei Wang,

On Wed, Sep 30, 2015 at 1:05 PM, Fei Wang <w.f@huawei.com> wrote:
> Add Hi655x regulator driver.
>
> Signed-off-by: Fei Wang <w.f@huawei.com>
> ---

[snip]

>
> +config REGULATOR_HI655X
> +        tristate "Hisilicon HI655X PMIC regulators support"

The Kconfig symbol is tree state which means it can be built as a module...

> +
> +static const struct of_device_id of_hi655x_regulator_match_tbl[] = {
> +       {
> +               .compatible = "hisilicon,hi655x-regulator-pmic",
> +               .data = &hi655x_regulator_pmic,
> +       },
> +       { /* end */ }
> +};

...but the OF module alias information is not built into the module so
module autoloading won't work.

Please add a MODULE_DEVICE_TABLE(of, of_hi655x_regulator_match_tbl) here.

Best regards,
Javier
