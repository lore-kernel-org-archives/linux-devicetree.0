From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Add gpio support to Broadcom Cygnus SoC
Date: Mon, 8 Dec 2014 10:48:14 -0800
Message-ID: <5485F26E.6050506@broadcom.com>
References: <Ray Jui <rjui@broadcom.com> <1418064468-8512-1-git-send-email-rjui@broadcom.com> <1418064468-8512-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418064468-8512-2-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry. Please ignore this particular cover letter. It accidentally got 
sent along with other v3 patches.

On 12/8/2014 10:47 AM, Ray Jui wrote:
> This patchset contains the initial GPIO support for the Broadcom Cygnus SoC.
> Cygnus has 3 GPIO controllers: 1) the ASIU GPIO; 2) the chipCommonG GPIO;
> and 3) the ALWAYS-ON GPIO. All 3 types of GPIO controllers are supported by
> the same Cygnus GPIO driver
>
> Changes from v1:
>   - Get rid of inline qualifier
>   - Get rid of redundant check in the ISR
>   - Other minor fixes to imrove code readability
>
> Ray Jui (5):
>    gpio: Cygnus: define Broadcom Cygnus GPIO binding
>    gpio: Cygnus: add GPIO driver
>    ARM: mach-bcm: Enable GPIO support for Cygnus
>    ARM: dts: enable GPIO for Broadcom Cygnus
>    MAINTAINERS: Entry for Cygnus GPIO driver
>
>   .../devicetree/bindings/gpio/brcm,cygnus-gpio.txt  |   85 +++
>   MAINTAINERS                                        |    7 +
>   arch/arm/boot/dts/bcm-cygnus.dtsi                  |   30 +
>   arch/arm/mach-bcm/Kconfig                          |    1 +
>   drivers/gpio/Kconfig                               |   11 +
>   drivers/gpio/Makefile                              |    1 +
>   drivers/gpio/gpio-bcm-cygnus.c                     |  712 ++++++++++++++++++++
>   7 files changed, 847 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/brcm,cygnus-gpio.txt
>   create mode 100644 drivers/gpio/gpio-bcm-cygnus.c
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
