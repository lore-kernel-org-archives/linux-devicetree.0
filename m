From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v7 5/5] gpio: tps65912: Add GPIO driver for the TPS65912
 PMIC
Date: Tue, 1 Dec 2015 13:40:45 -0600
Message-ID: <565DF7BD.6010204@ti.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <1447869580-10416-6-git-send-email-afd@ti.com>
 <CACRpkdbV+FzEXC_6HqRMRONY5fHoUWzg0HdoXq_s2N-RYphpVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbV+FzEXC_6HqRMRONY5fHoUWzg0HdoXq_s2N-RYphpVA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/30/2015 02:26 AM, Linus Walleij wrote:
> On Wed, Nov 18, 2015 at 6:59 PM, Andrew F. Davis <afd@ti.com> wrote:
>
>> This patch adds support for the TPS65912 PMIC GPIOs.
>>
>> TPS65912 has five configurable GPIOs that can be used for several
>> purposes.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> (...)
>> +       gpio->tps = dev_get_drvdata(pdev->dev.parent);
>> +       gpio->gpio_chip = template_chip;
>> +       gpio->gpio_chip.dev = tps->dev;
>
> This is now renamed .parent in linux-next. It needs to be changed if the
> code should compile after merge.
>

Are you able to make this change when you pick this up or would you
like me to resend this?

> Yours,
> Linus Walleij
>

