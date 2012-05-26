From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: introduce lock mechanism for gpiochip_find
Date: Sat, 26 May 2012 09:17:04 -0700
Message-ID: <CAA+hA=QOC4_bWzDfbdLEwHBDw_CBjcd-iQOTp9TU0h3j_qwyxw@mail.gmail.com>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com>
	<1337952980-14621-4-git-send-email-b29396@freescale.com>
	<20120526002500.CA3123E14E9@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120526002500.CA3123E14E9@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2012 at 5:25 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Fri, 25 May 2012 21:36:18 +0800, Dong Aisheng <b29396@freescale.co=
m> wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> The module lock will be automatically claimed for gpiochip_find func=
tion
>> in case the gpio module is removed during the using of gpiochip inst=
ance.
>> Users are responsible to call gpiochip_put to release the lock after
>> the using.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>
> Hey Dong,
>
> Does this actually protect anything? =A0From what I can see the gpio_=
lock
> is held for the entire time of iterating over gpio_chips when the
> match function is called and the gpio number is fully resolved before
> gpiochip_find returns when called from of_get_named_gpio_flags().
>
Correct, the of_get_named_gpio_flags() has no issues.
The problem is the gpiochip pointer is returned and user may use it
with no lock which may possible already been released.
I got this suggestion from Stephen Warren originally and i agreed with =
him.

> Also, it doesn't do anything to protect against the gpio_chip being
> removed after the gpio number is resolved, which means the gpio numbe=
r
> may no longer be valid, or may no longer point to the same gpio chip.
Can you help explain this case a bit more?
The module lock used here is only prevent the gpio module to be
removed which causes
the gpiochip to be release during the using.
You mean except module remove, the gpio_chip can also be removed by oth=
er case?

> It looks like the locking protection needs to be wider to be useful.
>
> Or is this patch to fix something in the mach-mx35-3ds.c, which is th=
e
> only other use of gpiochip_find().
>
=46ormerly it's used for patch 6 since it used the gpiochip_find functi=
on.
But yes, mach-mx35-3ds.c should also need the lock if this is an issue.

Regards
Dong Aisheng
>
>> ---
>> =A0drivers/gpio/gpiolib-of.c =A0| =A0 =A05 ++++-
>> =A0drivers/gpio/gpiolib.c =A0 =A0 | =A0 17 +++++++++++++++++
>> =A0include/asm-generic/gpio.h | =A0 =A02 +-
>> =A03 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index b8010a9..d521452 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -63,6 +63,7 @@ int of_get_named_gpio_flags(struct device_node *np=
, const char *propname,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index, e=
num of_gpio_flags *flags)
>> =A0{
>> =A0 =A0 =A0 struct gg_data gg_data =3D { .flags =3D flags, .out_gpio=
 =3D -ENODEV };
>> + =A0 =A0 struct gpio_chip *chip;
>> =A0 =A0 =A0 int ret;
>>
>> =A0 =A0 =A0 /* .of_xlate might decide to not fill in the flags, so c=
lear it. */
>> @@ -76,7 +77,9 @@ int of_get_named_gpio_flags(struct device_node *np=
, const char *propname,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> =A0 =A0 =A0 }
>>
>> - =A0 =A0 gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
>> + =A0 =A0 chip =3D gpiochip_find(&gg_data, of_gpiochip_find_and_xlat=
e);
>> + =A0 =A0 if (chip)
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpiochip_put(chip);
>>
>> =A0 =A0 =A0 of_node_put(gg_data.gpiospec.np);
>> =A0 =A0 =A0 pr_debug("%s exited with status %d\n", __func__, ret);
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 120b2a0..6453d43 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1144,6 +1144,18 @@ int gpiochip_remove(struct gpio_chip *chip)
>> =A0EXPORT_SYMBOL_GPL(gpiochip_remove);
>>
>> =A0/**
>> + * gpiochip_put() - release a gpio_chip
>> + * @chip: the chip to release
>> + */
>> +inline void gpiochip_put(struct gpio_chip *chip)
>> +{
>> + =A0 =A0 BUG_ON(!chip);
>> +
>> + =A0 =A0 module_put(chip->owner);
>> +}
>> +EXPORT_SYMBOL_GPL(gpiochip_put);
>> +
>> +/**
>> =A0 * gpiochip_find() - iterator for locating a specific gpio_chip
>> =A0 * @data: data to pass to match function
>> =A0 * @callback: Callback function to check gpio_chip
>> @@ -1153,6 +1165,9 @@ EXPORT_SYMBOL_GPL(gpiochip_remove);
>> =A0 * 0 if the device doesn't match and non-zero if it does. =A0If t=
he callback is
>> =A0 * non-zero, this function will return to the caller and not iter=
ate over any
>> =A0 * more gpio_chips.
>> + *
>> + * Note the gpio_chip is returned with the module locked, users are=
 responsible
>> + * to release the lock with gpiochip_put(chip) after using it.
>> =A0 */
>> =A0struct gpio_chip *gpiochip_find(void *data,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*ma=
tch)(struct gpio_chip *chip,
>> @@ -1169,6 +1184,8 @@ struct gpio_chip *gpiochip_find(void *data,
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (match(gpio_desc[i].chip, data)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip =3D gpio_desc[i].ch=
ip;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!try_module_get(chip->=
owner))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip =3D N=
ULL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 }
>> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
>> index 365ea09..af372be 100644
>> --- a/include/asm-generic/gpio.h
>> +++ b/include/asm-generic/gpio.h
>> @@ -145,7 +145,7 @@ extern int __must_check gpiochip_remove(struct g=
pio_chip *chip);
>> =A0extern struct gpio_chip *gpiochip_find(void *data,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 int (*match)(struct gpio_chip *chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0void *data));
>> -
>> +extern void gpiochip_put(struct gpio_chip *chip);
>>
>> =A0/* Always use the library code for GPIO management calls,
>> =A0 * or when sleeping may be involved.
>> --
>> 1.7.0.4
>>
>>
>
> --
> Grant Likely, B.Sc, P.Eng.
> Secret Lab Technologies, Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
