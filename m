Return-Path: <SRS0=puvY=HX=goldelico.com=hns@kernel.org>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v5 5/7] gpio: pca953x: fix address calculation for pcal6524
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <4F016FCD-04B0-4EE1-A9F4-5A182DD437EF@goldelico.com>
Date: Fri, 4 May 2018 09:30:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <14D3FF3C-0F70-4F72-B381-318B61B944CA@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com> <aaac818909d71523726094b1dfacc03e756874e9.1524933096.git.hns@goldelico.com> <CAHp75VfD4gYesEw2n4JMycmr=qcAtqSkAAjwCViJZRYC6kVUVg@mail.gmail.com> <4F016FCD-04B0-4EE1-A9F4-5A182DD437EF@goldelico.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, kernel@pyra-handheld.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

> Am 02.05.2018 um 14:35 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Andy,
>=20
>> Am 02.05.2018 um 14:28 schrieb Andy Shevchenko =
<andy.shevchenko@gmail.com>:
>>=20
>> On Sat, Apr 28, 2018 at 7:31 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> The register constants are so far defined in a way that they fit
>>> for the pcal9555a when shifted by the number of banks, i.e. are
>>> multiplied by 2 in the accessor function.
>>>=20
>>> Now, the pcal6524 has 3 banks which means the relative offset
>>> is multiplied by 4 for the standard registers.
>>>=20
>>> Simply applying the bit shift to the extended registers gives
>>> a wrong result, since the base offset is already included in
>>> the offset.
>>>=20
>>> Therefore, we add code to the 24 bit accessor functions to
>>> adjust the register number for these exended registers.
>>>=20
>>=20
>> Suggested-by ?
>=20
> Detecting that we need to adjust the registers generally was from me,
> but your suggestion of an improved formula should of course be =
mentioned
> and appreciated!
>=20
> I'll think about a good formulation for v6.

Would the following commit message be ok for you?

...

Therefore, we have to add code to the 24 bit accessor functions
that adjusts the register number for these exended registers.

The formula finally used was developed and proposed by
Andy Shevchenko <andy.shevchenko@gmail.com>.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus


>=20
> BR and thanks,
> Nikolaus
>=20
>>=20
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> drivers/gpio/gpio-pca953x.c | 8 ++++++--
>>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/drivers/gpio/gpio-pca953x.c =
b/drivers/gpio/gpio-pca953x.c
>>> index fc863faa3ce4..4194495a7990 100644
>>> --- a/drivers/gpio/gpio-pca953x.c
>>> +++ b/drivers/gpio/gpio-pca953x.c
>>> @@ -221,9 +221,11 @@ static int pca957x_write_regs_16(struct =
pca953x_chip *chip, int reg, u8 *val)
>>> static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, =
u8 *val)
>>> {
>>>       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>>> +       int addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
>>> +       int pinctrl =3D (reg & PCAL_PINCTRL_MASK) << 1;
>>>=20
>>>       return i2c_smbus_write_i2c_block_data(chip->client,
>>> -                                             (reg << bank_shift) | =
REG_ADDR_AI,
>>> +                                             pinctrl | addr | =
REG_ADDR_AI,
>>>                                             NBANK(chip), val);
>>> }
>>>=20
>>> @@ -263,9 +265,11 @@ static int pca953x_read_regs_16(struct =
pca953x_chip *chip, int reg, u8 *val)
>>> static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, =
u8 *val)
>>> {
>>>       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>>> +       int addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
>>> +       int pinctrl =3D (reg & PCAL_PINCTRL_MASK) << 1;
>>>=20
>>>       return i2c_smbus_read_i2c_block_data(chip->client,
>>> -                                            (reg << bank_shift) | =
REG_ADDR_AI,
>>> +                                            pinctrl | addr | =
REG_ADDR_AI,
>>>                                            NBANK(chip), val);
>>> }
>>>=20
>>> --
>>> 2.12.2
>>>=20
>>=20
>>=20
>>=20
>> --=20
>> With Best Regards,
>> Andy Shevchenko
>=20
> _______________________________________________
> Kernel mailing list
> Kernel@pyra-handheld.com
> http://pyra-handheld.com/cgi-bin/mailman/listinfo/kernel
