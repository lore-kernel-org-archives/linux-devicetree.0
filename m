From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH 4/6] regulator: hi6421v530: add driver for hi6421v530
 voltage regulator
Date: Sat, 27 May 2017 17:42:01 +0800
Message-ID: <CAFGCpxw3orr+4OO2_YVj2DrAJsvo9O+WiGeVv6GAk26HLzAnRw@mail.gmail.com>
References: <20170526063518.21246-1-guodong.xu@linaro.org>
 <20170526063518.21246-5-guodong.xu@linaro.org>
 <CABxcv=kP7XLDhUifwDBEfnayfgjGJFf7v9kUkPS6pcLKiaLP-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABxcv=kP7XLDhUifwDBEfnayfgjGJFf7v9kUkPS6pcLKiaLP-g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, Kevin Hilman <khilman@baylibre.com>, damm+renesas@opensource.se, "xuwei (O)" <xuwei5@hisilicon.com>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Eric Anholt <eric@anholt.net>, Riku Voipio <riku.voipio@lina>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 8:13 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Guodong,
>
> On Fri, May 26, 2017 at 8:35 AM, Guodong Xu <guodong.xu@linaro.org> wrote:
>> From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
>>
>
> [snip]
>
>>
>> +config REGULATOR_HI6421V530
>> +       tristate "HiSilicon Hi6421v530 PMIC voltage regulator support"
>
> The Kconfig symbol is tristate so the driver can be built as a module...
>
>> +
>> +static struct platform_driver hi6421v530_regulator_driver = {
>> +       .driver = {
>> +               .name   = "hi6421v530-regulator",
>> +       },
>> +       .probe  = hi6421v530_regulator_probe,
>> +};
>> +module_platform_driver(hi6421v530_regulator_driver);
>
> ... but the driver doesn't have a platform device ID table nor export
> it as a module alias using MODULE_DEVICE_TABLE().
>

I will add that.
Thanks for your review.

-Guodong

> That means that if built as a module, it won't be autoloaded when the
> "hi6421v530-regulator" device is registered by the MFD driver.
>
>> +
>> +MODULE_AUTHOR("Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>");
>> +MODULE_DESCRIPTION("Hi6421v530 regulator driver");
>> +MODULE_LICENSE("GPL v2");
>
> Alternative you can add a MODULE_ALIAS().
>
> Best regards,
> Javier
