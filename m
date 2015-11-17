From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 6/6] gpio: tps65086: Add GPIO driver for the TPS65086
 PMIC
Date: Tue, 17 Nov 2015 10:11:31 -0600
Message-ID: <564B51B3.2000102@ti.com>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
 <1446657135-7820-7-git-send-email-afd@ti.com>
 <CACRpkdb1V7JxLSbwqf4CX+nDLeQzP=bOA9YMXzE4CFTQfzRL9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb1V7JxLSbwqf4CX+nDLeQzP=bOA9YMXzE4CFTQfzRL9w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/17/2015 03:17 AM, Linus Walleij wrote:
> On Wed, Nov 4, 2015 at 6:12 PM, Andrew F. Davis <afd@ti.com> wrote:
>
>> Add support for the TPS65086 PMIC GPOs.
>>
>> TPS65086 has four configurable GPOs that can be used for several
>> purposes.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>
> OK...
>
>> +static int tps65086_gpio_get(struct gpio_chip *gc, unsigned offset)
>> +static void tps65086_gpio_set(struct gpio_chip *gc, unsigned offset,
>
> Just get/set and no get_direction/direction_input/direction_output?
> Are you sure?
>

Yeah, these are output only, I could probably add get_direction and just
always return output, but setters wouldn't make sense here.

Andrew

> Yours,
> Linus Walleij
>
