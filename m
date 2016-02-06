From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v6 3/3] gpio: tps65086: Add GPO driver for the TPS65086
 PMIC
Date: Sat, 6 Feb 2016 10:11:23 -0600
Message-ID: <56B61B2B.2020001@ti.com>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
 <1453737012-3130-4-git-send-email-afd@ti.com>
 <CACRpkdY9P=opTEzsMJ42dqMUV-kVmDzLuVq_vSgr3on3=9LtqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY9P=opTEzsMJ42dqMUV-kVmDzLuVq_vSgr3on3=9LtqQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/05/2016 08:43 AM, Linus Walleij wrote:
> On Mon, Jan 25, 2016 at 4:50 PM, Andrew F. Davis <afd@ti.com> wrote:
>
>> Add support for the TPS65086 PMIC GPOs.
>>
>> TPS65086 has four configurable GPOs that can be used for several
>> purposes. These are output only.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
> (...)
>> +static inline struct tps65086_gpio *to_tps65086_gpio(struct gpio_chip *chip)
>> +{
>> +       return container_of(chip, struct tps65086_gpio, chip);
>> +}
>
> Remove this and use gpiochip_get_data() instead.
>
>> +       ret = gpiochip_add(&gpio->chip);
>
> And use gpiochip_add_data() to pass what gpiochip_get_data()
> will return.
>
> Apart from that no strong opinions.
>
> If there is a header file dependency this either has to go to
> Lee's tree with my ACK, or wait until the next kernel cycle.
> But first change the above.
>
> Yours,
> Linus Walleij
>

Changes made, I will resend this part as its own patch as the other components
have been taken.

Thanks,
Andrew
