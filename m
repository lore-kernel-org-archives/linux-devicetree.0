From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/4] mfd: pv88080: MFD core support
Date: Thu, 27 Oct 2016 22:11:23 +0200
Message-ID: <CACRpkdZ1jrvbEdxZTUoBgrabdyaY2eFcmp2cxQbLTR-QK7yN4g@mail.gmail.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com> <6dcaf788e4ebffd5c753e5fc5ae67668f74f7c32.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6dcaf788e4ebffd5c753e5fc5ae67668f74f7c32.1477530195.git.eric.jeong-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUX-GPIO <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 3:03 AM, Eric Jeong
<eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org> wrote:

> From: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>
> This patch adds supports for PV88080 MFD core device.
>
> It provides communication through the I2C interface.
> It contains the following components:
>     - Regulators
>     - Configurable GPIOs
>
> Kconfig and Makefile are updated to reflect support for PV88080 PMIC.
>
> Signed-off-by: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
(...)
>  drivers/mfd/pv88080-i2c.c   |   99 ++++++++++++++++

This looks like a pure I2C driver.

Why is it not in drivers/i2c/busses/i2c-pv88080.c?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
