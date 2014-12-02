From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: hip04: set ARCH_NR_GPIO to 128
Date: Tue, 02 Dec 2014 14:43:51 +0800
Message-ID: <547D5FA7.3040307@gmail.com>
References: <1417156188-500-1-git-send-email-wangzhou.bry@gmail.com> <1417156188-500-2-git-send-email-wangzhou.bry@gmail.com> <3094004.3WUKgY6xNz@wuerfel> <547971BF.1050706@gmail.com> <CACRpkdb1nZN-vOXLC-QFUAT9wDGM2Nm5YeH0qY_u2JV9toOaVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdb1nZN-vOXLC-QFUAT9wDGM2Nm5YeH0qY_u2JV9toOaVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B412=E6=9C=8801=E6=97=A5 22:04, Linus Walleij wrote:
> On Sat, Nov 29, 2014 at 8:11 AM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>> On 2014=E5=B9=B411=E6=9C=8828=E6=97=A5 17:33, Arnd Bergmann wrote:
>>> On Friday 28 November 2014 14:29:47 Zhou Wang wrote:
>
>>>>           default 264 if MACH_H4700
>>>> +       default 128 if ARCH_HIP04
>>>>           default 0
>>>>           help
>>>>             Maximum number of GPIOs in the system.
>>>>
>>>
>>> If I remember correctly, you don't actually need to set this if all=
 gpio
>>> clients are using the new gpio descriptor interfaces instead of gpi=
o
>>> numbers. Would that work for you? You'd have to know which devices
>>
>> If I don't set this, it will use the default ARCH_NR_GPIO(512), then
>> the range of GPIO number will be 384~511 which is very strange to us=
ers,
>> because Hip04 based machines can only support 128 GPIOs.
>
> That is a totally different problem.
>
> Not that these numbers have ever been stable...
>
> Think of a patch to gpiochip_find_base() in
> drivers/gpio/gpiolib.c to fix this so that numbers are
> assigned a better way rather than doing
> random hacks with numbers like this.
>
> Yours,
> Linus Walleij
>
Hi Linus,

how about a patch like this, we read the base from the dts here.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8e98ca..0c40f53 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -107,11 +107,16 @@ struct gpio_chip *gpiod_to_chip(const struct=20
gpio_desc *desc)
  EXPORT_SYMBOL_GPL(gpiod_to_chip);

  /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
-static int gpiochip_find_base(int ngpio)
+static int gpiochip_find_base(struct gpio_chip *gpio_chip)
  {
         struct gpio_chip *chip;
+       int ngpio =3D gpio_chip->ngpio;
         int base =3D ARCH_NR_GPIOS - ngpio;

+       /* just prototype */
+       if (!of_property_read_u32(gpio_chip->dev->of_node, "base", &bas=
e))
+               return base;
+
         list_for_each_entry_reverse(chip, &gpio_chips, list) {
                 /* found a free space? */
                 if (chip->base + chip->ngpio <=3D base)
@@ -236,7 +241,7 @@ int gpiochip_add(struct gpio_chip *chip)
         spin_lock_irqsave(&gpio_lock, flags);

         if (base < 0) {
-               base =3D gpiochip_find_base(chip->ngpio);
+               base =3D gpiochip_find_base(chip);
                 if (base < 0) {
                         status =3D base;
                         goto unlock;

Best regards,
Zhou Wang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
