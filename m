From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Tue, 28 Oct 2014 18:25:04 +0100
Message-ID: <CACRpkdZ2K0dE3ZmBqHDJijN2i4bJtNra-RFemE_XUa+3meD70Q@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
	<CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com>
	<E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
	<CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
	<E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
	<CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com>
	<54489EC9.4020108@aksignal.cz>
	<CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
	<F82900FA-5999-4B39-8E7E-6FAA99ABDB2D@antoniou-consulting.com>
	<CAAVeFuKd7s3qgud0buWgHeSSjOXjVC5M82bjy4m3=B7Tr2OPzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKd7s3qgud0buWgHeSSjOXjVC5M82bjy4m3=B7Tr2OPzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 8:23 AM, Alexandre Courbot <gnurou@gmail.com> w=
rote:
> On Thu, Oct 23, 2014 at 8:23 PM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:

>> 2. A way to have the pinmux configuration of said GPIO configured wi=
thout
>> having to do anything explicit. I.e. on am335x the pinmux configurat=
ion is
>> decoupled from the GPIO driver; having a GPIO configured as a GPIO d=
oes not
>> alter the pinmux settings.
>
> Shouldn't that be fixed in the pinmux/GPIO kernel drivers? I am not
> too familiar with pinmux, but IIUC pixmux configuration when GPIOs ar=
e
> requested is something that is commonly done.

The answer is in Documentation/pinctrl.txt:

Pin control interaction with the GPIO subsystem
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Note that the following implies that the use case is to use a certain p=
in
from the Linux kernel using the API in <linux/gpio.h> with gpio_request=
()
and similar functions. There are cases where you may be using something
that your datasheet calls "GPIO mode", but actually is just an electric=
al
configuration for a certain device. See the section below named
"GPIO mode pitfalls" for more details on this scenario.

The public pinmux API contains two functions named pinctrl_request_gpio=
()
and pinctrl_free_gpio(). These two functions shall *ONLY* be called fro=
m
gpiolib-based drivers as part of their gpio_request() and
gpio_free() semantics. Likewise the pinctrl_gpio_direction_[input|outpu=
t]
shall only be called from within respective gpio_direction_[input|outpu=
t]
gpiolib implementation.

NOTE that platforms and individual drivers shall *NOT* request GPIO pin=
s to be
controlled e.g. muxed in. Instead, implement a proper gpiolib driver an=
d have
that driver request proper muxing and other control for its pins.

The function list could become long, especially if you can convert ever=
y
individual pin into a GPIO pin independent of any other pins, and then =
try
the approach to define every pin as a function.

In this case, the function array would become 64 entries for each GPIO
setting and then the device functions.

=46or this reason there are two functions a pin control driver can impl=
ement
to enable only GPIO on an individual pin: .gpio_request_enable() and
=2Egpio_disable_free().

This function will pass in the affected GPIO range identified by the pi=
n
controller core, so you know which GPIO pins are being affected by the =
request
operation.

If your driver needs to have an indication from the framework of whethe=
r the
GPIO pin shall be used for input or output you can implement the
=2Egpio_set_direction() function. As described this shall be called fro=
m the
gpiolib driver and the affected GPIO range, pin offset and desired dire=
ction
will be passed along to this function.

Alternatively to using these special functions, it is fully allowed to =
use
named functions for each GPIO pin, the pinctrl_request_gpio() will atte=
mpt to
obtain the function "gpioN" where "N" is the global GPIO pin number if =
no
special GPIO-handler is registered.
(...)

>> There is no higher layer driver API. We don=E2=80=99t want to litter=
 the kernel
>> with =E2=80=98valve=E2=80=99 drivers, there=E2=80=99s no such thing.=
 There=E2=80=99s only digital I/Os
>> that=E2=80=99s connected to low speed devices.

This is true.

But we do want the kernel to handle: LEDs, switches, PWMs, and
other simple, yet normally kernel-business things. Here is an example:

        /* The user LED on the board is set up to be used for heartbeat=
 */
        leds {
                compatible =3D "gpio-leds";
                user-led {
                        label =3D "user_led";
                        gpios =3D <&gpio0 2 0x1>;
                        default-state =3D "off";
                        linux,default-trigger =3D "heartbeat";
                        pinctrl-names =3D "default";
                        pinctrl-0 =3D <&user_led_default_mode>;
                };
        };

        /* User key mapped in as "escape" */
        gpio-keys {
                compatible =3D "gpio-keys";
                user-button {
                        label =3D "user_button";
                        gpios =3D <&gpio0 3 0x1>;
                        linux,code =3D <1>; /* KEY_ESC */
                        gpio-key,wakeup;
                        pinctrl-names =3D "default";
                        pinctrl-0 =3D <&user_button_default_mode>;
                };
        };

This is just setting up already existing in-kernel drivers to
use GPIOs as backend for a LED and a key (switch).

Is someone prefers to handle LEDs or keys in userspace
they are plain *WRONG* from our point of view.

I agree that valves and doors should not have kernel drivers,
that is not the issue. They should probably use sysfs. But for
hardware the kernel normally handles and that is not exceptional,
no way.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
