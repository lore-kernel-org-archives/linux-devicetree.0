From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH V2 3/5] gpio: add support for AMS AS3722 gpio driver
Date: Mon, 23 Sep 2013 20:06:25 +0200
Message-ID: <CACRpkdYY2tfU4-E2DdoUUW4K04H08KL70JVp3ZgqW-=RFwh+Aw@mail.gmail.com>
References: <1379680214-9143-1-git-send-email-ldewangan@nvidia.com>
	<1379680214-9143-4-git-send-email-ldewangan@nvidia.com>
	<CACRpkdbJ6N-5RET+cmF=14jKVDnuAZtZwjcKym75ySER2gCpBQ@mail.gmail.com>
	<524001F3.3060602@nvidia.com>
	<CACRpkdYVTdh3+ayy96D4=iNO6ZASfTfeQOHF9vdoPjfLDCtB5Q@mail.gmail.com>
	<5240117C.8060300@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5240117C.8060300-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Lobmaier <florian.lobmaier-QzQKeY2x7wg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2013 at 12:01 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Ok, I was thinking that we should not call gpiochip_add() from the pin
> control driver in any new driver

No that is not the case.

There are many combined pinctrl+GPIO drivers that register
both pinctrl devices and gpio_chip and also irq_chip.

When the driver and hardware does multiple things like that
in the same register range it is usually best to put the combined
driver in drivers/pinctrl.

> So this gpio driver can be moved now to the pincntrl folder and can use
> pincontrol and gpio framework.

Thanks!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
