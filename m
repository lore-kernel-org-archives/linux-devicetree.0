From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH v3 0/4] gpio: driver for the RPi3 GPIO expander
Date: Wed, 7 Feb 2018 11:38:07 +0200
Message-ID: <20180207093807.5au4tlmuoa3iof35@sapphire.tkos.co.il>
References: <cover.1516105893.git.baruch@tkos.co.il>
 <CACRpkdZAtVfAU-k9EUihH6peY2d1Ntn3jboVMBn9adReNLupow@mail.gmail.com>
 <20180206162759.awghecpv4ihaatz7@tarshish>
 <a3e4ba9a-60bf-5038-7385-8cb3d2667ed2@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a3e4ba9a-60bf-5038-7385-8cb3d2667ed2-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Wed, Feb 07, 2018 at 10:33:24AM +0100, Stefan Wahren wrote:
> Am 06.02.2018 um 17:27 schrieb Baruch Siach:
> > On Tue, Feb 06, 2018 at 02:42:48PM +0100, Linus Walleij wrote:
> >> On Tue, Jan 16, 2018 at 1:45 PM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> >>
> >>> The Raspberry Pi 3 has a GPIO expander that controls, among others, the
> >>> activity LED, and the camera connector GPIOs. The GPIO expander on an I2C bus
> >>> that is not directly controlled from the ARM core. The VC4 firmware controls
> >>> the I2C bus, and allows the ARM core to set/get GPIO settings over its mailbox
> >>> interface.
> >>>
> >>> This series adds support for the RPi3 expander.
> >>>
> >>> The driver is ported from the downstream kernel at
> >>> https://github.com/raspberrypi/linux/, branch rpi-4.9.y.
> >>>
> >>> Changes in v3:
> >>>
> >>>   * Kconfig tweaks
> >>>   * Check rpi_exp_gpio_get_polarity() return value
> >>>   * Redundant header removal
> >>>   * Redundant platform_set_drvdata() call removal
> >>>   * Small coding style changes
> >> All is looking pretty good. I see Rob had some last minute comments,
> >> but please rebase and repost post v4.16-rc1 so we can get this merged,
> >> we need to get this upstream.
> > I was about to send v4 when I saw your email. I based v4 on current LinusT's 
> > tree as of e237f98a9c. I guess that affected files will not change before 
> > v4.16-rc1, but I can wait a few more days for -rc1.
>
> please also address the owner issue in the driver, which was reported by
> kbuild test robot.

I removed the .owner platform_driver field set from v4. The owner field in 
gpio_chip is still set.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
