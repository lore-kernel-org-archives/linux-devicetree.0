From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 3/3] gpio: Add Spreadtrum PMIC EIC driver support
Date: Tue, 27 Mar 2018 17:10:56 +0800
Message-ID: <CAMz4ku+cvrNmCL3g7hKVO7Tj6xQuWKToytHD0Hxx1ftptMO1Jw@mail.gmail.com>
References: <787c9f115db06390549bfee366b7f70faf312286.1520218279.git.baolin.wang@linaro.org>
 <c84c05b6619a17848a11335f881f42153a4e51c0.1520218279.git.baolin.wang@linaro.org>
 <CAHp75VdmiESNg_06iby8Y0FgK47AHkJdu1kVYiBch82zGcnv-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdmiESNg_06iby8Y0FgK47AHkJdu1kVYiBch82zGcnv-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 5 March 2018 at 23:46, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Mar 5, 2018 at 4:56 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
>> The Spreadtrum PMIC EIC controller contains only one bank of debounce EIC,
>> and this bank contains 16 EICs. Each EIC can only be used as input mode,
>> as well as supporting the debounce and the capability to trigger interrupts
>> when detecting input signals.
>>
>
> FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> for entire series.

Thanks Andy.

Linus, could you apply this series if there are no other issues? Thanks.

-- 
Baolin.wang
Best Regards
