From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Thu, 04 Dec 2014 14:49:44 +0800
Message-ID: <54800408.3020403@gmail.com>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com> <CACRpkdb1nZN-vOXLC-QFUAT9wDGM2Nm5YeH0qY_u2JV9toOaVg@mail.gmail.com> <547D5FA7.3040307@gmail.com> <142367414.tx9doeBDv9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <142367414.tx9doeBDv9@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B412=E6=9C=8802=E6=97=A5 16:42, Arnd Bergmann wrote:
> On Tuesday 02 December 2014 14:43:51 Zhou Wang wrote:
>>
>> how about a patch like this, we read the base from the dts here.
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index e8e98ca..0c40f53 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -107,11 +107,16 @@ struct gpio_chip *gpiod_to_chip(const struct
>> gpio_desc *desc)
>>    EXPORT_SYMBOL_GPL(gpiod_to_chip);
>>
>>    /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
>> -static int gpiochip_find_base(int ngpio)
>> +static int gpiochip_find_base(struct gpio_chip *gpio_chip)
>>    {
>>           struct gpio_chip *chip;
>> +       int ngpio =3D gpio_chip->ngpio;
>>           int base =3D ARCH_NR_GPIOS - ngpio;
>>
>> +       /* just prototype */
>> +       if (!of_property_read_u32(gpio_chip->dev->of_node, "base", &=
base))
>> +               return base;
>> +
>
> I don't think that would be appropriate. The concept of a gpio number
> base is implementation specific to current Linux versions and we want
> to get rid of that in the future, so it should not be part of an
> OS-independent spec.
>
> 	Arnd
>
Got it. I will make a patch in which it finds base number of a GPIO
controller in a increasing order. Maybe it can get rid of ARCH_NR_GPIOS
in the future.

Thanks,
Zhou Wang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
