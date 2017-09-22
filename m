From: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Subject: Description of a gamepad device?
Date: Fri, 22 Sep 2017 17:58:47 +0200
Message-ID: <CAJ-oXjQkbHE3HZ=x3bJkAhk5+kNZ-nXKGzAumQDOeVOjTwqGMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm currently trying to port mainline to the GPD XD. This is an
handled game console, running an rk3288.
My current situation is the following:
- the buttons are connected to GPIOs, so they are well defined by a gpio-keys
- the joysticks are connected on I2C
- the device can connect to other gamepad (for instance through USB)

My problem is that I need a way to describe in the DTS that the
buttons and the joystick are the same game controller.

In Linux userland, this means that at the moment, there is one inputX
for the buttons, one for the joysticks, one for an external gamepad.
Most applications will be lost, and consider those are three different
game controllers.
Hence, the OS needs a way to know, via the device-tree description,
that the two first input have to be merged.

I see two possibilities:
- do a sort of master/slave description, where the joystick's driver
has a slave-device = <&gpio-keys> property
- do a brand new i2c driver/compatible for the joystick, including the
description of the keys on gpios

But both of those ideas seems clunky to me...

Would you have some suggestion?

Thanks,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
