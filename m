From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/2] gpio: Add GPIO driver for Spreadtrum SC9860 platform
Date: Wed, 31 Jan 2018 10:01:59 +0800
Message-ID: <CAMz4kuL9r+97_rDihgKD_TyNaDQ3aCk7go6e4mB24QOpovFYJg@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517313987.git.baolin.wang@linaro.org>
 <cccc1addb9c0cc541b676dbad005ec341d12d165.1517313987.git.baolin.wang@linaro.org>
 <CAHp75Vcig869pUQ5yK1b=GpXinhYkpw1q29OVKSs_7EqP4Hknw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcig869pUQ5yK1b=GpXinhYkpw1q29OVKSs_7EqP4Hknw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 31 January 2018 at 00:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Jan 30, 2018 at 2:07 PM, Baolin Wang <baolin.wang@linaro.org> wrote:
>> The Spreadtrum SC9860 platform GPIO controller contains 16 groups and
>> each group contains 16 GPIOs. Each GPIO can set input/output and has
>> the interrupt capability.
>
>> +config GPIO_SPRD
>
>> +       bool "Spreadtrum GPIO support"
>
> Either you have to put tristate here, or remove all redundant
> module_*() and MODULE_*() macros.

I will remove module_*() and MODULE_*() macros in next version. Thanks
for your comments.

>
> Other than that looks fine to me, FWIW:
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>

-- 
Baolin.wang
Best Regards
