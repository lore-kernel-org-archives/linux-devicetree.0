From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry
 Pi 3, for arm (32)
Date: Wed, 01 Feb 2017 11:24:32 +0100
Message-ID: <1485944672.1076.50.camel@redhat.com>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com>
         <87fukcgsqp.fsf@eliezer.anholt.net> <878tpqki0k.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878tpqki0k.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> -	bcm2835-rpi-zero.dtb
> >> +	bcm2835-rpi-zero.dtb \
> >> +	../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb

> Unfortunately, I just remembered yesterday that one of the requirements
> is that we not use these sorts of ../../../ references in the DT tree.
> Instead we have to use symlinks -- see arch/arm64/boot/dts/broadcom/ for
> how we did the last round of this.

Yes, we did that with the *.dtsi include files.
Not fully sure this is a requirement for the Makefile too.

> I think just having links from
> arch/arm64/boot/dts/broadcom/bcm2837*.dts* to arch/arm/boot/dts/ would
> be the solution, then this Makefile could just reference
> bcm2837-rpi-3-b.dtb.

I suspect it is not that easy, last time I tried it didn't work.
Will try again though.

cheers,
  Gerd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
