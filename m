From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: use "output-active" and "output-inactive" for gpio-hogs
Date: Fri, 9 Jun 2017 16:42:27 +0200
Message-ID: <CACRpkdYGgs2GunEV50e++WoTP31kz768MDi0j1ZL=Fkyj8_31g@mail.gmail.com>
References: <20170604101049.4592-1-uwe@kleine-koenig.org> <20170608223346.unfwdh32v3kt2y52@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170608223346.unfwdh32v3kt2y52@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 12:33 AM, Rob Herring <robh@kernel.org> wrote:

> On Sun, Jun 04, 2017 at 12:10:49PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> Using the following gpio hog:
>>
>>       {
>>               gpio-hog;
>>               gpios =3D <17 GPIO_ACTIVE_LOW>;
>>               output-high;
>>       }
>>
>> results in the gpio to be set to (physically) low value, which is
>> surprising. So support "output-active" which makes the semantic more
>> obvious. The old semantic is still supported for backward compatibility.
>
> Ugg. Can't say I'm a fan of the Linux GPIO subsystem inverting the logic
> for GPIO_ACTIVE_LOW...

Actually it is the other way around, chronologically speaking.

>From its inception, the GPIO bindings supplied a flag to invert
the signal on the consumer phandle. Then some consumers started to
screw around with their local inversion properties.

This has some historical reasons.
<dt-bindings/gpio/gpio.h> is just documenting the historical fact
that was introduced in the very first GPIO DT bindings
in commit
commit d524dac9279b6a41ffdf7ff7958c577f2e387db6
"dt: Move device tree documentation out of powerpc directory"

But already the cabal of powerpc developers did this before we
started to globalize their DT attempts. It all started (AFAICT)
in the MMC bindings. What actually happened was this:

commit 3f1c6ebf57b815ad709e89291e446935fee78f75
"powerpc: add mmc-spi-slot bindings"

Then used in:
commit 754582853120a9ec8b8293b5147b605b1c6a39f1
"powerpc/83xx: add mmc-spi support via the device tree for MPC8323E-RDB
from march 31st 2009:

+                       mmc-slot@0 {
+                               compatible =3D "fsl,mpc8323rdb-mmc-slot",
+                                            "mmc-spi-slot";
+                               reg =3D <0>;
+                               gpios =3D <&qe_pio_d 14 1
+                                        &qe_pio_d 15 0>;
+                               voltage-ranges =3D <3300 3300>;
+                               spi-max-frequency =3D <50000000>;
+                       };

As you can see the first GPIO line here (card detect) is clearly active low=
,
and that is why it has the magical flag "1".

What happens later is more disturbing:
commit 50dfe70fe9e216cf356830194630f9a39e498d76
"powerpc: introduce and document sdhci,wp-inverted property for eSDHC"
On sep 22, 2009 adds:

   - clock-frequency : specifies eSDHC base clock frequency.
+  - sdhci,wp-inverted : (optional) specifies that eSDHC controller
+    reports inverted write-protect state;

These two oxymoronic patches were even written by the same developer.
Who is not to blame.

This is simply the result of lack of review, and lack of macros clearly sho=
wing
what is going on. The open coded numerals obscured the meaning of the
line inversion flag, so when merging the latter binding this was forgotten.

But it is very clear that in the beginning of time, the idea was that consu=
mers
should specify any line inversion with a "1" in the second cell of the GPIO
specifier.

Maybe that initial idea was wrong. Maybe someone who was there back in
2009 could care to tell us how they were thinking. Maybe this was even
discussed by the IEEE quarter?

Yours,
Linus Walleij
