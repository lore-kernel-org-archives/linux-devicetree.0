From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Excluding pins from Linux control
Date: Wed, 15 Mar 2017 09:46:21 +0100
Message-ID: <CACRpkdbr9-hsFzPvOpwiVg=X=avx8fb14HhWWXNda7gGZaM2Gg@mail.gmail.com>
References: <433834766.313467.1488218521360@email.1und1.de>
 <CACRpkdYB+4=hG4YcUTvyg50cP6SfMhUuUMW7XqJAVxswYBsWng@mail.gmail.com> <1588667510.505126.1489522194503@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1588667510.505126.1489522194503@email.1und1.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 9:09 PM, Stefan Wahren <stefan.wahren@i2se.com> wro=
te:
>> Linus Walleij <linus.walleij@linaro.org> hat am 14. M=C3=A4rz 2017 um 15=
:39 geschrieben:

>> If you want to do it statically, at boot time:
>> Just add some NOOP function (i.e. a function that result in
>> zero register writes or anything) named "videocore-reserved" or
>> something to the driver in  drivers/pinctrl/bcm/pinctrl-bcm2835.c,
>> make it applicable to the affected pins, making it possible
>> to create a state that will combine the function "videocore-reserved"
>> with these pins, resulting in them being exclusively used for
>> that.
>
> If you speak of a NOOP function, do you mean a "dummy" pin function
> which is configured by the device tree? Like extending the "brcm,function=
"
> property from the existing binding?

No, a function for videocore defined by the driver in
drivers/pinctrl/bcm/pinctrl-bcm2835.c
and then used by the device tree.

Looking at the BCM2835 syntax (hope I get it right), in the end you should
be able to do this:

    videocore: videocore {
        brcm,pins =3D <12, 13, 14, 15, 16, 17, 18, 19, 20>;
        brcm,function =3D <BCM2835_FSEL_VIDEOCORE>;
    };

So BCM2835_FSEL_VIDEOCORE need to be defined in the
DT include and made available as a muxing option inside the driver, with
the effect that nothing really happens when you select it.

The point is that the pinctrl core will then regard the pin as taken
(this can be verified in debugfs) and then no other function can go
in and use the pin by mistake.

Something like this:

>From d188c03c1fba7d1223c1dafcb8b977e383298ef4 Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Mar 2017 09:45:37 +0100
Subject: [PATCH] Stab at videocore function

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 9 +++++++++
 include/dt-bindings/pinctrl/bcm2835.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 85d009112864..213ca5117bd3 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -41,6 +41,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <dt-bindings/pinctrl/bcm2835.h>

 #define MODULE_NAME "pinctrl-bcm2835"
 #define BCM2835_NUM_GPIOS 54
@@ -226,6 +227,9 @@ enum bcm2835_fsel {
     BCM2835_FSEL_MASK =3D 0x7,
 };

+/* This function can no be configured in the hardware register */
+#define BCM2835_FSEL_VIDEOCORE 8
+
 static const char * const bcm2835_functions[BCM2835_FSEL_COUNT] =3D {
     [BCM2835_FSEL_GPIO_IN] =3D "gpio_in",
     [BCM2835_FSEL_GPIO_OUT] =3D "gpio_out",
@@ -235,6 +239,7 @@ static const char * const
bcm2835_functions[BCM2835_FSEL_COUNT] =3D {
     [BCM2835_FSEL_ALT3] =3D "alt3",
     [BCM2835_FSEL_ALT4] =3D "alt4",
     [BCM2835_FSEL_ALT5] =3D "alt5",
+    [BCM2835_FSEL_VIDEOCORE] =3D "videocore",
 };

 static const char * const irq_type_names[] =3D {
@@ -879,6 +884,10 @@ static int bcm2835_pmx_set(struct pinctrl_dev *pctldev=
,
 {
     struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);

+    /* This pin is set as used by the videocore - do nothing */
+    if (func_selector =3D=3D BCM2835_FSEL_VIDEOCORE)
+        return 0;
+
     bcm2835_pinctrl_fsel_set(pc, group_selector, func_selector);

     return 0;
diff --git a/include/dt-bindings/pinctrl/bcm2835.h
b/include/dt-bindings/pinctrl/bcm2835.h
index e4e4fdf5d38f..2de2a2eb2fbc 100644
--- a/include/dt-bindings/pinctrl/bcm2835.h
+++ b/include/dt-bindings/pinctrl/bcm2835.h
@@ -23,6 +23,7 @@
 #define BCM2835_FSEL_ALT1    5
 #define BCM2835_FSEL_ALT2    6
 #define BCM2835_FSEL_ALT3    7
+#define BCM2835_FSEL_VIDEOCORE    8

 /* brcm,pull property */
 #define BCM2835_PUD_OFF        0
--=20
2.9.3

>> Then in the videocore device tree node (I assume there is
>> something like such) create a pinctrl state that just take all these
>> pins with this dummy function.
>
> Is there a comparable example in the existing drivers?

A lot of drivers use functions much more granular than the GPIO,
ALT0, ALT1 ... etc used by bcm2835.

Yours,
Linus Walleij
