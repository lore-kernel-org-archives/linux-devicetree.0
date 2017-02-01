From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry
 Pi 3, for arm (32)
Date: Wed, 01 Feb 2017 13:20:53 +0100
Message-ID: <1485951653.1076.54.camel@redhat.com>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com>
         <87fukcgsqp.fsf@eliezer.anholt.net> <878tpqki0k.fsf@eliezer.anholt.net>
         <1485944672.1076.50.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485944672.1076.50.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > I think just having links from
> > arch/arm64/boot/dts/broadcom/bcm2837*.dts* to arch/arm/boot/dts/ would
> > be the solution, then this Makefile could just reference
> > bcm2837-rpi-3-b.dtb.
> 
> I suspect it is not that easy, last time I tried it didn't work.
> Will try again though.

Yep, dtbs_install fails:

[ ... ]
  INSTALL arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb
  INSTALL arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb
  INSTALL arch/arm/boot/dts/bcm2836-rpi-2-b.dtb
  INSTALL 
cp: missing destination file operand after '/boot/dtbs/4.10.0-rc5+'
Try 'cp --help' for more information.
/root/linux/scripts/Makefile.dtbinst:41: recipe for target
'bcm2837-rpi-3-b.dts' failed
make[3]: *** [bcm2837-rpi-3-b.dts] Error 1
arch/arm/Makefile:348: recipe for target 'dtbs_install' failed
make[2]: *** [dtbs_install] Error 2
Makefile:150: recipe for target 'sub-make' failed
make[1]: *** [sub-make] Error 2
Makefile:24: recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
