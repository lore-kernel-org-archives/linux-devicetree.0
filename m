From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Thu, 9 Apr 2015 11:20:55 +0900
Message-ID: <CAAVeFu+0bWSAUSaDGTUmPyj9JxEJn4yxF_hzab4CHp8YV1MuoA@mail.gmail.com>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
 <20150306085957.GC10717@pengutronix.de> <CACRpkdYq70V8SG4XOPBCGWs__J4ehknZSucpO5OdXpMDj8GPKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYq70V8SG4XOPBCGWs__J4ehknZSucpO5OdXpMDj8GPKA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 5:59 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,
>
> On Fri, Mar 06, 2015 at 09:26:26AM +0100, Linus Walleij wrote:
>> On Thu, Feb 12, 2015 at 10:03 AM, Uwe Kleine-K=C3=B6nig
>> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> > I wonder if gpiod_get_optional et all should be changed to return =
NULL
>> > instead.
>>
>> This is actually the norm in most subsystems returning cookie
>> pointers, clk, regulator, pinctrl... a NULL pointer is a functional
>> noop. But normally then NULL is returned from all stubs, not
>> just optional.
>>
>> Alexandre, what do you say?
>>
>> > The obvious downside is that if the device tree specifies a
>> > reset-gpio and the kernel just fails to use it because there is so=
me
>> > code missing, this should better be an error. (The adau1977 code h=
as
>> > this problem already know, but when changing devm_gpiod_get_option=
al all
>> > callers are affected.)
>>
>> Device Tree-specific problems is not something we design
>> subsystems for, we try to just accomodate them. I'm not
>> sure I fully understand what you mean here.
> Consider you have a device that has:
>
>         enable-gpio =3D <&gpio3 12 0>;
>
> and you do in your driver:
>
>         enablegpio =3D devm_gpiod_get_optional(... "enable" ...);
>
> . If GPIOLIB is off, enablegpio gets assigned NULL and the driver
> continues happily without enabling the device which most likely is a
> bug.
>
> So IMHO the logic in devm_gpiod_get_optional for the GPIOLIB=3Dn case
> should be:
>
>         if (device_has_gpio())
>                 return ERR_PTR(-ENOSYS);
>         else
>                 return NULL;
>
> . device_has_gpio should use similar logic like gpiod_get_index to ch=
eck
> if there is a gpio. If this is considered to be too complicated for a
> disabled subsystem, returning -ENOSYS unconditionally is better than
> NULL.

I should have replied one month ago, but if gpiolib is disabled, how
can we use gpiolib-like logic to check the existence of a GPIO?

Having GPIO disabled means there is no GPIO support, including the
ability to look for GPIOs. -ENOSYS is a well-documented error-code
which meaning also applies to the gpio_*_optional functions (we don't
have support for the operation you requested). If a driver or
architecture really, really needs GPIO support they can require or
depend on CONFIG_GPIOLIB, and the problem goes away. If they can work
with and without gpiolib, then they should check for -ENOSYS when they
request GPIOs and behave accordingly.

Moving the interpretation of what the absence of gpiolib means down to
the GPIO functions themselves is actually what might lead consumers to
not know the result of their request. For this reason I would say that
-ENOSYS is appropriate here.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
