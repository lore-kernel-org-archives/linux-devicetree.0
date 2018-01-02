From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/4] gpio: driver for the RPi3 GPIO expander
Date: Tue, 2 Jan 2018 19:05:38 +0100 (CET)
Message-ID: <1090269396.181215.1514916338795@email.1und1.de>
References: <cover.1514898134.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1514898134.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 2. Januar 2018 um 14:19 geschrieben:
> 
> 
> The Raspberry Pi 3 has a GPIO expander that controls, among others, the 
> activity LED, and the camera connector GPIOs. The GPIO expander on an I2C bus 
> that is not directly controlled from the ARM core. The VC4 firmware controls 
> the I2C bus, and allows the ARM core to set/get GPIO settings over its mailbox 
> interface.
> 
> This series adds support for the RPi3 expander.
> 
> The driver is ported from the downstream kernel at 
> https://github.com/raspberrypi/linux/, branch rpi-4.9.y.
> 

thanks for trying to upstream this. There has been attemps by Eric Anholt (September 2016) and Michael Zoran (March 2017). Some problems like get_direction() has been fixed, but not all of them.

So please look at the followings links first:
https://patchwork.kernel.org/patch/9339859/
https://patchwork.kernel.org/patch/9339857/
http://lists.infradead.org/pipermail/linux-rpi-kernel/2017-March/005903.html

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
