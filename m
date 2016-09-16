From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ARM: dts: bcm283x: add pinctrl group to &sdhci,
 drop pins from &gpio
Date: Fri, 16 Sep 2016 18:48:50 +0200 (CEST)
Message-ID: <43420281.199608.15854341-2f8e-4e20-95f4-e76f81e6fd56.open-xchange@email.1und1.de>
References: <1473841415-937-1-git-send-email-kraxel@redhat.com>
 <1473841415-937-7-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473841415-937-7-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gerd,

> Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> hat am 14. September 2016 um 10:23
> geschrieben:
> 
> 
> As the alt3 group has no pins left after this
> update drop the whole alt3 group from &gpio.

sorry it won't be that simple. The references needs to removed too :-(

> grep alt3 *.dts*
bcm2835-rpi-a.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt2 &alt3>;
bcm2835-rpi-a-plus.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
bcm2835-rpi-b.dts:	pinctrl-0 = <&gpioout &alt0 &alt3>;
bcm2835-rpi-b-plus.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
bcm2835-rpi-b-rev2.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt2 &alt3>;
bcm2835-rpi.dtsi:	alt3: alt3 {
bcm2835-rpi-zero.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
bcm2836-rpi-2-b.dts:	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;

Regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
