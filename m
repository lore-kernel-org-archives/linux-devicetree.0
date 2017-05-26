From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/6] mfd: hi6421-pmic: move hi6421_regmap_config
 definition to header file
Date: Fri, 26 May 2017 10:33:47 +0200
Message-ID: <CAK8P3a0maxQdwLMMwEnYgmMHRHDRUaeYRb5JM0PtRbWopeHjUw@mail.gmail.com>
References: <20170526063518.21246-1-guodong.xu@linaro.org>
 <20170526063518.21246-3-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170526063518.21246-3-guodong.xu@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, Kevin Hilman <khilman@baylibre.com>, damm+renesas@opensource.se, Wei Xu <xuwei5@hisilicon.com>, treding@nvidia.com, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Eric Anholt <eric@anholt.net>, Riku Voipio <riku.voipio@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, hw.wangxiaoyin@hisilicon.com, Liam Girdwood <lgi>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 8:35 AM, Guodong Xu <guodong.xu@linaro.org> wrote:
> Move hi6421_regmap_config definition from c code to common header:
>  - include/linux/mfd/hi6421-pmic.h
>
> This is to improve code re-use for upcoming hi6421 series of MFD driver.
>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>

> diff --git a/include/linux/mfd/hi6421-pmic.h b/include/linux/mfd/hi6421-pmic.h
> index 587273e..f4674ff 100644
> --- a/include/linux/mfd/hi6421-pmic.h
> +++ b/include/linux/mfd/hi6421-pmic.h
> @@ -38,4 +38,10 @@ struct hi6421_pmic {
>         struct regmap           *regmap;
>  };
>
> +static const struct regmap_config hi6421_regmap_config = {
> +       .reg_bits = 32,
> +       .reg_stride = 4,
> +       .val_bits = 8,
> +       .max_register = HI6421_REG_TO_BUS_ADDR(HI6421_REG_MAX),
> +};
>  #endif         /* __HI6421_PMIC_H */

Header files should not have static variables in general, it will cause warnings
about unused variables when you include the header from another file
(depending on compiler version and warning options, I think older gcc
versions don't warn about this, but clang and latest gcc do).

How about adding the new code into the existing
drivers/mfd/hi6421-pmic-core.c file, and splitting out the part that differs
(the regmap_update_bits is the only difference I see) into a callback
that you reference through the of_device_id->data pointer?

        Arnd
