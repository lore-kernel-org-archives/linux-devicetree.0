From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH 0/5] Support for LEGO MINDSTORTMS EV3
Date: Fri, 21 Oct 2016 13:36:52 -0500
Message-ID: <1477075018-20176-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for LEGO MINDSTORTMS EV3[1]. This is a TI AM1808
based board.

This patch series has been tested working (along with some hacks to fix the
GPIOs) on an EV3.

There are still quite a few additional new drivers that need to be submitted
to get everything working. This patch series just adds support for the parts
that already have mainline kernel drivers.

I have a plan/driver in progress for many of the components[2], but I could use
some advice on a few particulars.

Bluetooth: This needs a driver to sequence a GPIO to take the Bluetooth chip
out of shutdown *after* the Bluetooth clock has been configured and started.
Is there a generic driver that can do this sort of thing? Or, if not, which
subsystem should the new driver go in?

Input and output ports: These ports are capable of hotplugging various devices,
such as sensors and motors. I have written a driver for these that can detect
most devices. I created a new subsystem for this called `lego-port`. However,
I am wondering if the existing phy or extcon subsystems might be a good fit for
this sort of thing.


[1]: http://mindstorms.lego.com
[2]: https://github.com/ev3dev/lego-linux-drivers/tree/master/evb

David Lechner (5):
  ARM: davinci: Compile MMC in kernel
  ARM: davinci: Don't append git rev to local version
  ARM: davinci: enable gpio poweroff in default config
  ARM: davinci: enable LEDs default-on trigger in default config
  ARM: dts: Add LEGO MINDSTORTMS EV3 dts

 arch/arm/boot/dts/Makefile             |   3 +-
 arch/arm/boot/dts/lego-ev3.dts         | 454 +++++++++++++++++++++++++++++++++
 arch/arm/configs/davinci_all_defconfig |   8 +-
 3 files changed, 462 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/lego-ev3.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
