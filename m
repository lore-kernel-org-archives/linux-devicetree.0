From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.
Date: Fri, 09 Sep 2016 14:20:57 -0700
Message-ID: <8737l893d2.fsf@eliezer.anholt.net>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com> <1473244289-20728-2-git-send-email-kraxel@redhat.com> <1628308726.55593.220fafc0-57d9-4317-a72d-0875dfb2d658.open-xchange@email.1und1.de> <1473411924.6698.85.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473411924.6698.85.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

e<#secure method=pgpmime mode=sign>
Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

>   Hi,
>
>> According to this page [1] the pinctrl group for parallel display interface is
>> missing. Is it intended?
>> 
>> [1] - http://elinux.org/RPi_BCM2835_GPIOs
>
> Just an oversight I guess.  Eric?
>
> Does this look correct?
>
> +                       dpi_gpio4: dpi_gpio4 {
> +                               brcm,pins = <4 5 6 7 8 9 10 11 12 13
> +                                            14 15 16 17 18 19 20 21
> +                                            22 23 24 25 26 27>;
> +                               brcm,function = <BCM2835_FSEL_ALT2>;
> +                       };

For DPI, you also need pins 0-3 in there for clock and syncs.

That set of data pins would be for a 24-bit mode, which is what we
should be using for the Adafruit kippah + 7" panel combo.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
