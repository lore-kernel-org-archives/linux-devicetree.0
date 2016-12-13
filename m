From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] iio: misc: add a generic regulator driver
Date: Tue, 13 Dec 2016 15:28:22 +0100
Message-ID: <CAMpxmJVpj57s-m_FS58J+QWvu-MnVmaZP-6ECnYHeRVSCfd-Fw@mail.gmail.com>
References: <1480432969-20913-1-git-send-email-bgolaszewski@baylibre.com>
 <44cce3d5-f65e-1a35-20a4-5eb9fda42312@metafoo.de> <CAMpxmJWDWk-mXUHHGEKm-VVwzqEGLDQjc274Xq+Qwc2eN=YbsQ@mail.gmail.com>
 <d4c7f1ca-49d4-7abe-bfc9-e1728f62a9fb@metafoo.de> <bf3dde7e-cee8-c54c-db93-447ffa063116@kernel.org>
 <CAMpxmJVJ+y9tRbRBsVg+i0EJO_6EFuvrypwC=ETnBWbMnxRFyg@mail.gmail.com> <c670d597-46b6-235f-545f-7136a3abff7f@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c670d597-46b6-235f-545f-7136a3abff7f-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-12-12 18:15 GMT+01:00 Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>:
> On 12/06/2016 12:12 PM, Bartosz Golaszewski wrote:

[snip!]

>>
>> So the problem we have is not power-cycling the adc - it's
>> power-cycling the device connected to a probe on which there's an adc.
>> What I was trying to do was adding support for the power-switch on
>> baylibre-acme[1] probes.
>>
>> For example: we have a USB probe on which the VBUS signal goes through
>> a power load switch and than through the adc. The adc (in this case
>> ina226) is always powered on, while the fixed regulator I wanted to
>> enable/disable actually drives the power switch to cut/restore power
>> to the connected USB device i.e. there's no real regulator - just a
>> GPIO driving the power switch.
>>
>> A typical use case is measuring the power consumption of development
>> boards[2]. Rebooting them remotely using acme probes is already done,
>> but we're using the obsolete /sys/class/gpio interface.
>>
>> We're already using libiio to read the measured data from the power
>> monitor, that's why we'd like to use the iio framework for
>> power-cycling the devices as well. My question is: would bridging the
>> regulator framework be the right solution? Should we look for
>> something else? Bridge the GPIO framework instead?
>
> I wouldn't necessaries create bridge, but instead just use the GPIO
> framework directly.
>
> We now have the GPIO chardev interface which meant to be used to support
> application specific logic that control the GPIOs, but where you don't want
> to write a kernel driver.
>
> My idea was to add GPIOs and GPIO chips as high level object inside libiio
> that can be accessed through the same context as the IIO devices. Similar to
> the current IIO API you have a API for gpios that allows to enumerate the
> GPIO devices and their pins as well as modify the pin state.
>

+ Linus

While the new GPIO interface would be very convenient - in our case we
could simply name the lines appropriately in the device tree - I'm not
sure this would be the correct approach.

>From this year's ELCE in Berlin I remember Linus suggested during his
talk that it's always better to write a kernel driver. Also: this way
the relevant GPIO lines would not be reserved for exclusive use by
power switches.

Linus - do you have any thoughts/suggestions on that subject?

Best regards,
Bartosz Golaszewski
