From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Excluding pins from Linux control
Date: Tue, 14 Mar 2017 15:39:11 +0100
Message-ID: <CACRpkdYB+4=hG4YcUTvyg50cP6SfMhUuUMW7XqJAVxswYBsWng@mail.gmail.com>
References: <433834766.313467.1488218521360@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <433834766.313467.1488218521360-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 27, 2017 at 7:02 PM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:

> on BCM2835 (Raspberry Pi) the firmware on the VideoCore and Linux on the ARM core share
> a common pin "space". Depending on the board revision the VideoCore needs to controls
> some pins, which shouldn't be claimed by Linux on the ARM.
>
> What is the right way to exclude control on Linux for those pins in order to avoid possible
> harmful operations?

Do you want to do this statically (at boot) or dynamically (at runtime)?

If you want to do it statically, at boot time:
Just add some NOOP function (i.e. a function that result in
zero register writes or anything) named "videocore-reserved" or
something to the driver in  drivers/pinctrl/bcm/pinctrl-bcm2835.c,
make it applicable to the affected pins, making it possible
to create a state that will combine the function "videocore-reserved"
with these pins, resulting in them being exclusively used for
that.

Then in the videocore device tree node (I assume there is
something like such) create a pinctrl state that just take all these
pins with this dummy function.

(If the videocore does not even have a device tree node, hog all
those pins to that function using hogs as described in
Documentaion/pinctrl.txt, essentially just take the pins for the
pin controller itself.)

If you want to do it at runtime, you need some communication link
to the videocore (I guess) and then it is essentially the same
approach but done using proper states reflecting whether the
videocore is actively using them or not, but for the simple case
even this would be easiest done using the static approach above.
You may need a dynamic solution if you want to remux the
pins to ground when going to sleep for example, then something
must move the pins from "default" to "sleep" state and back,
and that needs to be the videocore driver in the kernel I guess.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
